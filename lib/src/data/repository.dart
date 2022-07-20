import 'package:gif_ted/src/data/models/giphy_response_model.dart';
import 'package:gif_ted/src/data/gif_ted_data_provider.dart';
import 'package:dio/dio.dart';

class Repository {
  Repository() {
    giphyClient = GiphyAPIClient(Dio());
  }

  late GiphyAPIClient giphyClient;

  /// Call the client api requesting the trending data with the offset parameter
  getTrendingGifs({required int offset}) async {
    GiphyResponseModel giphyModel = await giphyClient.getTrendingGifs(offset);
    return giphyModel;
  }
}
