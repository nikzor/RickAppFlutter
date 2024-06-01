import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_app/ui/bloc/get_characters_bloc.dart';
import 'package:rick_app/ui/characters_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<GetCharactersBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Rick App'),
        backgroundColor: Colors.green[200],
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: BlocBuilder<GetCharactersBloc, GetCharactersState>(
              bloc: bloc,
              builder: (context, state) {
                switch (state) {
                  case GetCharactersInitial():
                    return TextButton(
                        onPressed: () {
                          bloc.add(GetCharacters());
                        },
                        child: const Text('Load Characters'));
                  case GetCharactersLoading():
                    return const CircularProgressIndicator();
                  case GetCharactersLoaded():
                    return CharactersList(characters: state.characters);
                  case GetCharactersError():
                    return const Text('Error');
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
