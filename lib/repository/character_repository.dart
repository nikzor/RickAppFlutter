import 'dart:async';

import 'package:rick_app/domain/model.dart';

abstract class CharacterRepository {
  Future<List<Character>> getCharacters();
}
