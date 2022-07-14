import 'package:flutter/material.dart';
import 'package:gif_ted/src/models/giphy_item_model.dart';

import 'package:gif_ted/src/services/networking.dart';
import 'package:gif_ted/src/components/gif_card.dart';
import 'package:gif_ted/src/styles/constants.dart';
import 'package:gif_ted/src/screens/settings_screen.dart';

class GifListScreen extends StatelessWidget {
  GifListScreen({Key? key}) : super(key: key);

  static const String id = 'gif_list_screen';

  final _networking = Networking();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
      future: _networking.getTrendingGifs(offset: 0),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            // TODO: Add a loading circle
            child: Text("LOADING..."),
          );
        }

        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          final gifs = snapshot.data;

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
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    // TODO: Control crossAxisCount with media query
                    crossAxisCount: 2,
                    mainAxisSpacing: appGridPaddingDoubleSm,
                    crossAxisSpacing: appGridPaddingDoubleSm,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (
                      BuildContext context,
                      int index,
                    ) {
                      GiphyItemModel item = gifs.data[index];

                      print(
                          'sliverGrid is building index ${index + 1} of ${gifs.data.length}');
                      if (index + 1 >= gifs.data.length) {
                        // TODO: using bloc state management,
                        // change the offset of the next call and add the new
                        // items on a state stored list to change this widget
                        print('LOADING NEXT ONES');
                      }

                      return GifCard(
                        item: item,
                      );
                    },
                    childCount: gifs.data.length,
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
        }

        // TODO: Add an error screen (message and retry button)
        return const Center(
          child: Text("Error!??"),
        );
      },
    );
  }
}
