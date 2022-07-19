import 'package:json_annotation/json_annotation.dart';

part 'giphy_item_model.g.dart';

@JsonSerializable()
class GiphyItemModel {
  @JsonKey(name: "type")
  final String type;

  @JsonKey(name: "id")
  final String id;

  @JsonKey(name: "url")
  final String url;

  @JsonKey(name: "username")
  final String username;

  @JsonKey(name: "title")
  final String title;

  @JsonKey(name: "rating")
  final String rating;

  @JsonKey(name: "is_sticker")
  final int isSticker;

  @JsonKey(name: "source")
  final String source;

  @JsonKey(name: "images")
  final GiphyImageModel images;

  GiphyItemModel(
    this.type,
    this.id,
    this.url,
    this.username,
    this.title,
    this.rating,
    this.isSticker,
    this.images,
    this.source,
  );

  factory GiphyItemModel.fromJson(Map<String, dynamic> json) =>
      _$GiphyItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$GiphyItemModelToJson(this);
}

@JsonSerializable()
class GiphyImageModel {
  @JsonKey(name: "original")
  final GiphyImageOriginalModel original;

  @JsonKey(name: "preview_gif")
  final GiphyImagePreviewGifModel previewGif;

  GiphyImageModel({
    required this.original,
    required this.previewGif,
  });

  factory GiphyImageModel.fromJson(Map<String, dynamic> json) =>
      _$GiphyImageModelFromJson(json);

  Map<String, dynamic> toJson() => _$GiphyImageModelToJson(this);
}

@JsonSerializable()
class GiphyImageOriginalModel {
  @JsonKey(name: "height")
  final String height;

  @JsonKey(name: "width")
  final String width;

  @JsonKey(name: "size")
  final String size;

  @JsonKey(name: "url")
  final String url;

  GiphyImageOriginalModel({
    required this.height,
    required this.width,
    required this.size,
    required this.url,
  });

  factory GiphyImageOriginalModel.fromJson(Map<String, dynamic> json) =>
      _$GiphyImageOriginalModelFromJson(json);

  Map<String, dynamic> toJson() => _$GiphyImageOriginalModelToJson(this);
}

@JsonSerializable()
class GiphyImagePreviewGifModel {
  @JsonKey(name: "height")
  final String height;

  @JsonKey(name: "width")
  final String width;

  @JsonKey(name: "size")
  final String size;

  @JsonKey(name: "url")
  final String url;

  GiphyImagePreviewGifModel({
    required this.height,
    required this.width,
    required this.size,
    required this.url,
  });

  factory GiphyImagePreviewGifModel.fromJson(Map<String, dynamic> json) =>
      _$GiphyImagePreviewGifModelFromJson(json);

  Map<String, dynamic> toJson() => _$GiphyImagePreviewGifModelToJson(this);
}
