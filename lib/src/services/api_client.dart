import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:gif_ted/src/models/giphy_response.dart';

part "api_client.g.dart";

class Apis {
  static const _apiKey = "RERwoaJz4GoOn7KdJrJVgOsUFxhQBMZl";
  static const String trending = '/trending?api_key=$_apiKey&limit=20&rating=g';
}

@RestApi(baseUrl: "https://api.giphy.com/v1/gifs")
abstract class APIClient {
  factory APIClient(Dio dio) = _APIClient;

  @GET(Apis.trending)
  Future<GiphyResponse> giphyTrendingData();
}
