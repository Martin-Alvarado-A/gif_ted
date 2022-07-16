import 'package:gif_ted/src/data/models/giphy_response_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part "gif_ted_data_provider.g.dart";

class GiphyApis {
  static const _apiKey = "RERwoaJz4GoOn7KdJrJVgOsUFxhQBMZl";
  static const String trending =
      '?api_key=$_apiKey&q=trending&limit=20&offset={offset}&rating=g&lang=en';
}

/// The base url for all Giphy API calls
@RestApi(baseUrl: "https://api.giphy.com/v1/gifs/search")
abstract class GiphyAPIClient {
  factory GiphyAPIClient(Dio dio, {String baseUrl}) = _GiphyAPIClient;

  /// Get the trending url, pass the offset argument for it and call the API.
  @GET(GiphyApis.trending)
  Future<GiphyResponseModel> getTrendingGifs(@Path("offset") int offset);
}
