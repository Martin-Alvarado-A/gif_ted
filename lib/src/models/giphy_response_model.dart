import 'package:json_annotation/json_annotation.dart';

part 'giphy_response_model.g.dart';

@JsonSerializable()
class GiphyResponseModel {
  late List<dynamic> data;
  late dynamic pagination;
  late dynamic meta;

  GiphyResponseModel({required this.data, this.pagination, this.meta});

  factory GiphyResponseModel.fromJson(Map<String, dynamic> json) =>
      _$GiphyResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$GiphyResponseModelToJson(this);
}
