import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vexana/vexana.dart';
import 'package:kartal/kartal.dart';

import '../service/homepage_service.dart';
import '../viewmodel/cubit/anime_cubit.dart';

class HomepageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AnimeCubit>(
      create: (context) => AnimeCubit(
          homepageService:
              VexanaHomepageService(NetworkManager(options: BaseOptions()))),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  "ANIME LIST",
                  style: context.textTheme.headline4?.copyWith(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
                Expanded(
                  child: BlocConsumer<AnimeCubit, AnimeState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      if (state is AnimeInitial) {
                        return buildCenterInitialChild(context);
                      } else if (state is AnimeLoading) {
                        return buildCenterLoading();
                      } else if (state is AnimeCompleted) {
                        return buildListViewCats(state);
                      } else {
                        return buildError(state);
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildCenterInitialChild(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget buildCenterLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget buildListViewCats(AnimeCompleted state) {
    return ListView.builder(
        itemCount: state.animeList?.data?.length,
        itemBuilder: (context, index) {
          const double boxHeight = 5.0;
          return Card(
            elevation: 10,
            child: Column(
              children: [
                const SizedBox(
                  height: boxHeight,
                ),
                Text(
                  state.animeList?.data?[index].animeName
                          ?.replaceAll('_', ' ')
                          .toUpperCase() ??
                      '',
                  style: context.textTheme.headline5?.copyWith(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: boxHeight,
                ),
                Container(
                  height: context.dynamicHeight(0.4),
                  width: context.dynamicWidth(1),
                  child: Image.network(
                    state.animeList?.data?[index].animeImg ?? '',
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
          );
        });
  }

  Widget buildError(AnimeState state) {
    return const Center(
      child: Text("Error"),
    );
  }
}
