import 'package:flutter/material.dart';
import 'package:rick_app/domain/model.dart';
import 'package:rick_app/ui/character_card.dart';

class CharactersList extends StatelessWidget {
  const CharactersList({
    required this.characters,
    super.key,
  });

  final List<Character> characters;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: characters.length,
      itemBuilder: (BuildContext context, int index) => CharacterCard(
        name: "${characters[index].name}",
        status: "${characters[index].status}",
        species: "${characters[index].species}",
        gender: "${characters[index].gender}",
        image: "${characters[index].image}",
      ),
      separatorBuilder: (_, __) => const SizedBox(height: 10),
    );
  }
}
