import 'package:gif_ted/src/models/giphy_response_model.dart';
import 'package:gif_ted/src/services/api_client.dart';
import 'package:dio/dio.dart';

class Networking {
  late APIClient mClient;
  Networking() {
    mClient = APIClient(Dio());
  }

  /// Call the client api requesting the trending data with the offset parameter
  getTrendingGifs({required int offset}) async {
    GiphyResponseModel giphyModel = await mClient.giphyTrendingData(offset);
    return giphyModel;
  }
}
