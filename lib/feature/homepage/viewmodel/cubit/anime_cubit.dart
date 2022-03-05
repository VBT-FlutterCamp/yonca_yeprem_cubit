import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../model/anime_model.dart';
import '../../service/homepage_service.dart';

part 'anime_state.dart';

class AnimeCubit extends Cubit<AnimeState> {
  AnimeCubit({required this.homepageService}) : super(AnimeInitial()){
    _init();
  }
  final HomepageService homepageService;
  AnimeModel? animeList;

  Future<void> _init() async {
    emit(AnimeLoading());
    await getAnimes();
    emit(AnimeCompleted(animeList:animeList));
  }


  Future<AnimeModel?> getAnimes() async {
    animeList = await homepageService.getAnimes();
  }

}
