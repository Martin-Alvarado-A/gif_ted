import 'package:gif_ted/src/models/giphy_response_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part "api_client.g.dart";

class Apis {
  static const _apiKey = "RERwoaJz4GoOn7KdJrJVgOsUFxhQBMZl";
  static const String trending =
      '?api_key=$_apiKey&q=trending&limit=20&offset={offset}&rating=g&lang=en';
}

@RestApi(baseUrl: "https://api.giphy.com/v1/gifs/search")
abstract class APIClient {
  factory APIClient(Dio dio, {String baseUrl}) = _APIClient;

  @GET(Apis.trending)
  Future<GiphyResponseModel> giphyTrendingData(@Path("offset") int offset);
}
