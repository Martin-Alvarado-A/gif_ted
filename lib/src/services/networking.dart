import 'package:gif_ted/src/models/giphy_response_model.dart';
import 'package:gif_ted/src/services/api_client.dart';
import 'package:dio/dio.dart';

class Networking {
  late APIClient mClient;
  Networking() {
    mClient = APIClient(Dio());
  }

  getTrendingGifs() async {
    print("🔎 | Networking | getTrendingGifs > before data");

    GiphyResponseModel giphyModel = await mClient.giphyTrendingData();

    print("🔎 | Networking | getTrendingGifs > after data");

    return giphyModel;
  }
}
