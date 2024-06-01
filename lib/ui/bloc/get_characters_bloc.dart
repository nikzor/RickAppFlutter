import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_app/domain/model.dart';
import 'package:rick_app/repository/character_repository_impl.dart';

part 'get_characters_event.dart';
part 'get_characters_state.dart';

class GetCharactersBloc extends Bloc<GetCharactersEvent, GetCharactersState> {
  GetCharactersBloc() : super(GetCharactersInitial()) {
    on<GetCharacters>(
      (event, emit) async {
        await _onGetCharacters(event, emit);
      },
    );
  }

  Future<void> _onGetCharacters(
      GetCharacters event, Emitter<GetCharactersState> emit) async {
    emit(GetCharactersLoading());
    try {
      final result = await CharacterRepositoryImpl().getCharacters();
      emit(GetCharactersLoaded(characters: result));
    } catch (e) {
      print(e);
      emit(GetCharactersError());
    }
  }
}
