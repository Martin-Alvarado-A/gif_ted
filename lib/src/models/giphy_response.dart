import 'package:json_annotation/json_annotation.dart';

part 'giphy_response.g.dart';

@JsonSerializable()
class GiphyResponse {
  @JsonKey(name: "id")
  String name;

  factory GiphyResponse.fromJson(Map<String, dynamic> json) =>
      _$GiphyResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GiphyResponseToJson(this);

  GiphyResponse(this.name);
}
