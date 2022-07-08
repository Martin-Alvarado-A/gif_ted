import 'package:json_annotation/json_annotation.dart';

part 'giphy_item_model.g.dart';

@JsonSerializable()
class GiphyItemModel {
  @JsonKey(name: "id")
  String name;
  @JsonKey(name: "username")
  String username;
  @JsonKey(name: "title")
  String title;

  GiphyItemModel(this.name, this.username, this.title);

  factory GiphyItemModel.fromJson(Map<String, dynamic> json) =>
      _$GiphyItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$GiphyItemModelToJson(this);
}
