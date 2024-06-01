import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_app/ui/bloc/get_characters_bloc.dart';
import 'package:rick_app/ui/home_screen.dart';

void main() {
  runApp(
    BlocProvider(
      create: (_) => GetCharactersBloc(),
      child: const MaterialApp(
        home: HomeScreen(),
      ),
    ),
  );
}
