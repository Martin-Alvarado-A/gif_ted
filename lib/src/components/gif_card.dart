import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gif_ted/src/data/models/giphy_item_model.dart';
import 'package:gif_ted/src/screens/gif_detail_screen.dart';

class GifCard extends StatelessWidget {
  const GifCard({
    Key? key,
    required this.item,
  }) : super(key: key);

  final GiphyItemModel item;

  @override
  Widget build(BuildContext context) {
    String previewURL = item.images.previewGif.url;

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          GifDetailScreen.id,
          arguments: item,
        );
      },
      child: Container(
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              spreadRadius: 1,
              blurRadius: 3,
              offset: Offset(0, 3),
            ),
          ],
          border: Border.all(
            color: Colors.blueAccent,
            width: 3,
          ),
          borderRadius: BorderRadius.circular(11),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: GridTile(
            footer: GridTileBar(
              backgroundColor: Colors.grey[800],
              title: Text(
                item.title,
                semanticsLabel: item.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            child: CachedNetworkImage(
              imageUrl: previewURL,
              fit: BoxFit.cover,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  Padding(
                padding: const EdgeInsets.all(64),
                child: CircularProgressIndicator(
                  value: downloadProgress.progress,
                  backgroundColor: Colors.white,
                  color: Colors.blueAccent,
                  strokeWidth: 8,
                ),
              ),
              errorWidget: (context, url, error) => const Icon(
                Icons.error,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
