import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_app/ui/bloc/get_characters_bloc.dart';
import 'package:rick_app/ui/screens/characters_list_screen/characters_list.dart';

class CharactersListScreen extends StatefulWidget {
  const CharactersListScreen({super.key});

  @override
  State<CharactersListScreen> createState() => _CharactersListScreenState();
}

class _CharactersListScreenState extends State<CharactersListScreen> {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<CharactersBloc>(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: BlocBuilder<CharactersBloc, CharactersState>(
          bloc: bloc,
          builder: (context, state) {
            switch (state.status) {
              case CharactersStatus.initial:
                return const CircularProgressIndicator();
              case CharactersStatus.success:
                return CharactersList(
                  characters: state.characters,
                );
              case CharactersStatus.failure:
                return const Text('Error');
            }
          },
        ),
      ),
    );
  }
}
