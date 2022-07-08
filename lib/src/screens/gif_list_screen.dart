// import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gif_ted/src/models/giphy_item_model.dart';
import 'package:gif_ted/src/models/giphy_response_model.dart';
// import 'package:gif_ted/src/components/gif_item.dart';
import 'package:gif_ted/src/services/networking.dart';

class GifListScreen extends StatelessWidget {
  GifListScreen({Key? key}) : super(key: key);

  static const String id = 'gif_list_screen';

  final _networking = Networking();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                // _auth.signOut();
                Navigator.pop(context);
              }),
        ],
        title: Text('Gifs'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: FutureBuilder<dynamic>(
            future: _networking.getTrendingGifs(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              print("🔎 | Gif List Screen | FutureBuilder");
              if (snapshot.connectionState == ConnectionState.waiting) {
                print("🔎 | Gif List Screen | Waiting!");
                return Center(
                  child: Text("Loading..."),
                );
              }

              if (snapshot.connectionState == ConnectionState.done &&
                  snapshot.hasData) {
                print("🔎 | Gif List Screen | DATA!");
                final gifs = snapshot.data;
                return GifsList(gifs: gifs);
              }

              return const Center(
                child: Text("done!??"),
              );
            },
          ),
        ),
      ),
    );
  }
}

class GifsList extends StatelessWidget {
  const GifsList({
    Key? key,
    required this.gifs,
  }) : super(key: key);

  final gifs;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: gifs["data"].length,
      itemBuilder: (BuildContext context, int index) {
        final item = gifs["data"][index];
        final String previewURL = item["images"]["preview_gif"]["url"] ?? '';

        return ListTile(
          title: Text("id: ${item["id"]}"),
          leading: Image.network(previewURL),
        );
      },
    );
  }
}
