part of 'get_characters_bloc.dart';

sealed class GetCharactersState extends Equatable {
  const GetCharactersState();

  @override
  List<Object> get props => [];
}

final class GetCharactersInitial extends GetCharactersState {
  @override
  List<Object> get props => [];
}

final class GetCharactersLoading extends GetCharactersState {
  @override
  List<Object> get props => [];
}

final class GetCharactersLoaded extends GetCharactersState {
  const GetCharactersLoaded({required this.characters});

  final List<Character> characters;

  @override
  List<Object> get props => [];
}

final class GetCharactersError extends GetCharactersState {
  @override
  List<Object> get props => [];
}
