part of 'anime_cubit.dart';

@immutable
abstract class AnimeState {}

class AnimeInitial extends AnimeState {}

class AnimeLoading extends AnimeState {
  AnimeLoading();
}

class AnimeCompleted extends AnimeState {
  final AnimeModel? animeList;
  AnimeCompleted({this.animeList});
}
