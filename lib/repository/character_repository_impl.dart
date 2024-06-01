import 'package:rick_app/core/internet_services/dio_client.dart';
import 'package:rick_app/core/internet_services/paths.dart';
import 'package:rick_app/domain/model.dart';
import 'package:rick_app/repository/character_repository.dart';

class CharacterRepositoryImpl extends CharacterRepository {
  @override
  Future<List<Character>> getCharacters() async {
    try {
      final response = await DioClient.instance.get(characters);
      final charactersList = (response['results'] as List)
          .map((e) => Character.fromJson(e))
          .toList();
      return charactersList;
    } catch (e) {
      throw Exception('Something wrong, try again later');
    }
  }
}
