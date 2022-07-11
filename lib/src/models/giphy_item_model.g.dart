// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'giphy_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GiphyItemModel _$GiphyItemModelFromJson(Map<String, dynamic> json) =>
    GiphyItemModel(
      json['type'] as String,
      json['id'] as String,
      json['url'] as String,
      json['username'] as String,
      json['title'] as String,
      json['rating'] as String,
      json['is_sticker'] as int,
      GiphyImageModel.fromJson(json['images'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GiphyItemModelToJson(GiphyItemModel instance) =>
    <String, dynamic>{
      'type': instance.type,
      'id': instance.id,
      'url': instance.url,
      'username': instance.username,
      'title': instance.title,
      'rating': instance.rating,
      'is_sticker': instance.isSticker,
      'images': instance.images,
    };

GiphyImageModel _$GiphyImageModelFromJson(Map<String, dynamic> json) =>
    GiphyImageModel(
      original: GiphyImageOriginalModel.fromJson(
          json['original'] as Map<String, dynamic>),
      previewGif: GiphyImagePreviewGifModel.fromJson(
          json['preview_gif'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GiphyImageModelToJson(GiphyImageModel instance) =>
    <String, dynamic>{
      'original': instance.original,
      'preview_gif': instance.previewGif,
    };

GiphyImageOriginalModel _$GiphyImageOriginalModelFromJson(
        Map<String, dynamic> json) =>
    GiphyImageOriginalModel(
      height: json['height'] as String,
      width: json['width'] as String,
      size: json['size'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$GiphyImageOriginalModelToJson(
        GiphyImageOriginalModel instance) =>
    <String, dynamic>{
      'height': instance.height,
      'width': instance.width,
      'size': instance.size,
      'url': instance.url,
    };

GiphyImagePreviewGifModel _$GiphyImagePreviewGifModelFromJson(
        Map<String, dynamic> json) =>
    GiphyImagePreviewGifModel(
      height: json['height'] as String,
      width: json['width'] as String,
      size: json['size'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$GiphyImagePreviewGifModelToJson(
        GiphyImagePreviewGifModel instance) =>
    <String, dynamic>{
      'height': instance.height,
      'width': instance.width,
      'size': instance.size,
      'url': instance.url,
    };
