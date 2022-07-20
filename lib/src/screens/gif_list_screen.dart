import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gif_ted/cubit/gif_ted_cubit.dart';
import 'package:gif_ted/src/data/models/giphy_item_model.dart';
import 'package:gif_ted/src/data/models/giphy_response_model.dart';
import 'package:gif_ted/src/data/repository.dart';
import 'package:gif_ted/src/components/gif_card.dart';
import 'package:gif_ted/src/styles/constants.dart';
import 'package:gif_ted/src/screens/settings_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rive/rive.dart';

class GifListScreen extends StatelessWidget {
  GifListScreen({Key? key}) : super(key: key);

  static const String id = '/gif_list_screen';

  final _repo = Repository();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
      future: _repo.getTrendingGifs(offset: 0),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.white,
              color: Colors.blueAccent,
              strokeWidth: 8,
            ),
          );
        } else if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasError) {
          return const Center(
            child: RiveAnimation.asset(
              'assets/jpereira-error-icon.riv',
            ),
          );
        } else if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          final GiphyResponseModel snapshotData = snapshot.data;
          List<GiphyItemModel> gifsList = snapshotData.data;
          int gifsOffset = snapshotData.pagination.offset;

          final state = context.watch<GifTedCubit>().state;

          if (state is GifTedResponse) {
            gifsList = state.dataList;
            gifsOffset = state.pagination.offset;
          }

          return OrientationBuilder(
            builder: (context, orientation) {
              int orientationCrossAxisCount =
                  orientation == Orientation.portrait ? 2 : 3;

              return CustomScrollView(
                // Reduced cacheExtent to show off the progress indicator and image placeholder
                cacheExtent: 1, // Default value is 200
                //
                slivers: [
                  SliverAppBar(
                    floating: true,
                    leading: Image.asset('assets/logo.png'),
                    actions: <Widget>[
                      IconButton(
                        icon: const Icon(Icons.settings),
                        onPressed: () {
                          Navigator.pushNamed(context, SettingsScreen.id);
                        },
                      ),
                    ],
                    title: const Text('Gifs'),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.all(appGridPaddingDoubleMd),
                    sliver: SliverGrid(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: orientationCrossAxisCount,
                        mainAxisSpacing: appGridPaddingDoubleSm,
                        crossAxisSpacing: appGridPaddingDoubleSm,
                      ),
                      delegate: SliverChildBuilderDelegate(
                        (
                          BuildContext context,
                          int index,
                        ) {
                          GiphyItemModel item = gifsList[index];

                          debugPrint(
                              'showing #${index + 1} of ${gifsList.length}');
                          if (index + 1 >= gifsList.length) {
                            context.read<GifTedCubit>().getMoreGifs(
                                  currentList: gifsList,
                                  offset: gifsOffset,
                                );
                          }

                          return GifCard(
                            item: item,
                          );
                        },
                        childCount: gifsList.length,
                      ),
                    ),
                  ),
                  const SliverPadding(
                    padding: EdgeInsets.all(appGridPaddingDoubleLg),
                    sliver: SliverToBoxAdapter(
                      child: Center(
                        child: SizedBox(
                          height: 24,
                          width: 24,
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        } else {
          return const Center(
            child: Text("No data Found"),
          );
        }
      },
    );
  }
}
