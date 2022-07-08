import 'package:gif_ted/src/services/api_client.dart';
import 'package:dio/dio.dart';

class Networking {
  late APIClient mClient;
  Networking() {
    mClient = APIClient(Dio());
  }

  getTrendingGifs() async {
    var giphyModel = await mClient.giphyTrendingData();
    //You can use your splash model data as per your requirements.
    print(giphyModel);
  }
}
