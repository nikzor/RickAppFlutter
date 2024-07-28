import 'package:equatable/equatable.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:rick_app/domain/model.dart';
import 'package:rick_app/repository/character_repository_impl.dart';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';

part 'get_characters_event.dart';
part 'get_characters_state.dart';

const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class CharactersBloc extends Bloc<GetCharactersEvent, CharactersState> {
  CharactersBloc() : super(const CharactersState()) {
    on<GetCharacters>(
      _onGetCharacters,
      transformer: throttleDroppable(throttleDuration),
    );
  }

  Future<void> _onGetCharacters(
      GetCharacters event, Emitter<CharactersState> emit) async {
    try {
      if (state.status == CharactersStatus.initial) {
        final result = await CharacterRepositoryImpl().getCharacters();
        final maxPageLimit = await CharacterRepositoryImpl().getMaxPageLimit();
        return emit(
          state.copyWith(
            status: CharactersStatus.success,
            characters: List.of(state.characters)..addAll(result),
            page: state.page + 1,
            maxPageLimit: maxPageLimit,
          ),
        );
      } else if (state.page <= state.maxPageLimit) {
        final result =
            await CharacterRepositoryImpl().getCharacters(page: state.page);
        return emit(
          state.copyWith(
            status: CharactersStatus.success,
            characters: List.of(state.characters)..addAll(result),
            page: state.page + 1,
          ),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(
          status: CharactersStatus.failure,
        ),
      );
    }
  }
}
