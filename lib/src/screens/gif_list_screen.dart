import 'package:flutter/material.dart';
import 'package:gif_ted/src/components/gif_item.dart';

class GifListScreen extends StatelessWidget {
  const GifListScreen({
    Key? key,
    this.items = const [],
  }) : super(key: key);

  static const String id = 'gif_list_screen';

  final List<GifItem> items;

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
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (BuildContext context, int index) {
              final item = items[index];
              final String previewURL = item.images?.previewGif?.url ?? '';

              return ListTile(
                title: Text("id: ${item.id}"),
                leading: Image.network(previewURL),
              );
            },
          ),
        ),
      ),
    );
  }
}
