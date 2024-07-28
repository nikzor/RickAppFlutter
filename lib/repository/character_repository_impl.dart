import 'package:rick_app/core/internet_services/dio_client.dart';
import 'package:rick_app/core/internet_services/paths.dart';
import 'package:rick_app/domain/model.dart';
import 'package:rick_app/repository/character_repository.dart';

class CharacterRepositoryImpl extends CharacterRepository {
  @override
  Future<List<Character>> getCharacters({int page = 1}) async {
    try {
      final response =
          await DioClient.instance.get(charactersByPage + page.toString());
      final charactersList = (response['results'] as List)
          .map((e) => Character.fromJson(e))
          .toList();
      return charactersList;
    } catch (e) {
      throw Exception('Something wrong, try again later');
    }
  }

  @override
  Future<int> getMaxPageLimit() async {
    try {
      final response = await DioClient.instance.get(baseCharactersUrl);
      return response['info']['pages'];
    } catch (e) {
      throw Exception('Something wrong, try again later');
    }
  }
}
