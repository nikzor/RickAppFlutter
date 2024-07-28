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
    this.maxPageLimit = 1,
  });

  final CharactersStatus status;
  final List<Character> characters;
  final int page;
  final int maxPageLimit;

  CharactersState copyWith({
    CharactersStatus? status,
    List<Character>? characters,
    int? page,
    int? maxPageLimit,
  }) {
    return CharactersState(
      status: status ?? this.status,
      characters: characters ?? this.characters,
      page: page ?? this.page,
      maxPageLimit: maxPageLimit ?? this.maxPageLimit,
    );
  }

  @override
  List<Object> get props => [
        status,
        characters,
        page,
        maxPageLimit,
      ];
}
