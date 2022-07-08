// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'giphy_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GiphyItemModel _$GiphyItemModelFromJson(Map<String, dynamic> json) =>
    GiphyItemModel(
      json['id'] as String,
      json['username'] as String,
      json['title'] as String,
    );

Map<String, dynamic> _$GiphyItemModelToJson(GiphyItemModel instance) =>
    <String, dynamic>{
      'id': instance.name,
      'username': instance.username,
      'title': instance.title,
    };
