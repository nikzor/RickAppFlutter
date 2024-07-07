import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_app/ui/app_theme.dart';
import 'package:rick_app/ui/bloc/get_characters_bloc.dart';
import 'package:rick_app/ui/screens/home_screen.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => CharactersBloc()..add(GetCharacters()),
      child: MaterialApp(
        home: const HomeScreen(),
        theme: appTheme,
      ),
    ),
  );
}
