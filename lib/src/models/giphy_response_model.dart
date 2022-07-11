import 'package:gif_ted/src/models/giphy_item_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'giphy_response_model.g.dart';

@JsonSerializable()
class GiphyResponseModel {
  @JsonKey(name: "data")
  final List<GiphyItemModel> data;

  @JsonKey(name: "pagination")
  final PaginationModel pagination;

  @JsonKey(name: "meta")
  final MetaModel meta;

  GiphyResponseModel(
      {required this.data, required this.pagination, required this.meta});

  factory GiphyResponseModel.fromJson(Map<String, dynamic> json) =>
      _$GiphyResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$GiphyResponseModelToJson(this);
}

@JsonSerializable()
class PaginationModel {
  @JsonKey(name: "total_count")
  final int totalCount;

  @JsonKey(name: "count")
  final int count;

  @JsonKey(name: "offset")
  final int offset;

  PaginationModel(
      {required this.totalCount, required this.count, required this.offset});

  factory PaginationModel.fromJson(Map<String, dynamic> json) =>
      _$PaginationModelFromJson(json);

  Map<String, dynamic> toJson() => _$PaginationModelToJson(this);
}

@JsonSerializable()
class MetaModel {
  @JsonKey(name: "status")
  final int status;

  @JsonKey(name: "msg")
  final String msg;

  @JsonKey(name: "response_id")
  final String responseId;

  MetaModel(
      {required this.status, required this.msg, required this.responseId});

  factory MetaModel.fromJson(Map<String, dynamic> json) =>
      _$MetaModelFromJson(json);

  Map<String, dynamic> toJson() => _$MetaModelToJson(this);
}
