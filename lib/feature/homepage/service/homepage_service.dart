import 'package:vexana/vexana.dart';

import '../model/anime_model.dart';

abstract class HomepageService {
  final INetworkManager networkManager;

  HomepageService(this.networkManager);

  Future<AnimeModel?> getAnimes();
}

class VexanaHomepageService extends HomepageService{
  VexanaHomepageService(INetworkManager networkManager) : super(networkManager);

  @override
  Future<AnimeModel?> getAnimes() async {
    final response = await networkManager.send<AnimeModel,AnimeModel>('https://anime-facts-rest-api.herokuapp.com/api/v1', 
    parseModel: AnimeModel(),
    method: RequestType.GET);
    return response.data;
  }
}