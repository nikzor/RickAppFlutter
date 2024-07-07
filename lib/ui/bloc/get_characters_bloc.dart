import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_app/domain/model.dart';
import 'package:rick_app/repository/character_repository_impl.dart';

part 'get_characters_event.dart';
part 'get_characters_state.dart';

class CharactersBloc extends Bloc<GetCharactersEvent, CharactersState> {
  CharactersBloc() : super(const CharactersState()) {
    on<GetCharacters>(
      (event, emit) async {
        await _onGetCharacters(event, emit);
      },
    );
  }

  Future<void> _onGetCharacters(
      GetCharacters event, Emitter<CharactersState> emit) async {
    try {
      final result = await CharacterRepositoryImpl().getCharacters();
      emit(
        state.copyWith(
          status: CharactersStatus.success,
          characters: result,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: CharactersStatus.failure,
        ),
      );
    }
  }
}
