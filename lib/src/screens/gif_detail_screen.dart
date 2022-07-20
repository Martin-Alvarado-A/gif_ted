import 'package:flutter/material.dart';
import 'package:gif_ted/src/data/models/giphy_item_model.dart';
// import 'package:url_launcher/url_launcher.dart';

class GifDetailScreen extends StatelessWidget {
  const GifDetailScreen({Key? key}) : super(key: key);
  static const String id = '/gif_detail_screen';

  @override
  Widget build(BuildContext context) {
    final item = ModalRoute.of(context)!.settings.arguments as GiphyItemModel;

    final title = item.title;
    final original = item.images.original;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            title,
            overflow: TextOverflow.ellipsis,
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
            ),
          ),
        ),
        body: Column(
          children: [
            Center(
              child: SizedBox(
                width: double.parse(original.width),
                child: Image.network(
                  original.url,
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    }
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    );
                  },
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          'Title: $title',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          'Username: ${item.username}',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          'Source: ${item.source}',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Rating: ${item.rating}',
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Type: ${item.type}',
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  // Row(
                  //   children: [
                  //     RichText(
                  //       text: TextSpan(
                  //         children: [
                  //           TextSpan(
                  //             text: 'Unwrap on Giphy!',
                  //             recognizer: TapGestureRecognizer()
                  //               ..onTap = () {
                  //                 launchUrl(Uri.parse(item.url));
                  //               },
                  //             //launch(item.url);
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //   ],
                  // )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
