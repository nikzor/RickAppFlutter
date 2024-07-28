import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_app/domain/model.dart';
import 'package:rick_app/ui/bloc/get_characters_bloc.dart';
import 'package:rick_app/ui/screens/characters_list_screen/character_card.dart';

class CharactersList extends StatefulWidget {
  const CharactersList({
    required this.characters,
    super.key,
  });

  final List<Character> characters;

  @override
  State<CharactersList> createState() => _CharactersListState();
}

class _CharactersListState extends State<CharactersList> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.extentAfter < 500) {
      context.read<CharactersBloc>().add(GetCharacters());
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      controller: _scrollController,
      itemCount: widget.characters.length,
      itemBuilder: (BuildContext context, int index) {
        return CharacterCard(
          name: "${widget.characters[index].name}",
          status: "${widget.characters[index].status}",
          species: "${widget.characters[index].species}",
          gender: "${widget.characters[index].gender}",
          image: "${widget.characters[index].image}",
        );
      },
      separatorBuilder: (_, __) => const SizedBox(height: 10),
    );
  }
}
