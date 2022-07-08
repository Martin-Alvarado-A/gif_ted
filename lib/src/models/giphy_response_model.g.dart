// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'giphy_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GiphyResponseModel _$GiphyResponseModelFromJson(Map<String, dynamic> json) =>
    GiphyResponseModel(
      data: json['data'] as List<dynamic>,
      pagination: json['pagination'],
      meta: json['meta'],
    );

Map<String, dynamic> _$GiphyResponseModelToJson(GiphyResponseModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'pagination': instance.pagination,
      'meta': instance.meta,
    };
