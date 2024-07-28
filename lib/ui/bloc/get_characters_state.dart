part of 'get_characters_bloc.dart';

enum CharactersStatus {
  initial,
  success,
  failure,
}

final class CharactersState extends Equatable {
  const CharactersState({
    this.status = CharactersStatus.initial,
    this.characters = const <Character>[],
    this.page = 1,
    this.hasReachedMax = false,
  });

  final CharactersStatus status;
  final List<Character> characters;
  final int page;
  final bool hasReachedMax;

  CharactersState copyWith({
    CharactersStatus? status,
    List<Character>? characters,
    int? page,
    bool? hasReachedMax,
  }) {
    return CharactersState(
      status: status ?? this.status,
      characters: characters ?? this.characters,
      page: page ?? this.page,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object> get props => [status, characters, page, hasReachedMax];
}
