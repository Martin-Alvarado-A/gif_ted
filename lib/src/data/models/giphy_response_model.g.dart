// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'giphy_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GiphyResponseModel _$GiphyResponseModelFromJson(Map<String, dynamic> json) =>
    GiphyResponseModel(
      data: (json['data'] as List<dynamic>)
          .map((e) => GiphyItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      pagination:
          PaginationModel.fromJson(json['pagination'] as Map<String, dynamic>),
      meta: MetaModel.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GiphyResponseModelToJson(GiphyResponseModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'pagination': instance.pagination,
      'meta': instance.meta,
    };

PaginationModel _$PaginationModelFromJson(Map<String, dynamic> json) =>
    PaginationModel(
      totalCount: json['total_count'] as int,
      count: json['count'] as int,
      offset: json['offset'] as int,
    );

Map<String, dynamic> _$PaginationModelToJson(PaginationModel instance) =>
    <String, dynamic>{
      'total_count': instance.totalCount,
      'count': instance.count,
      'offset': instance.offset,
    };

MetaModel _$MetaModelFromJson(Map<String, dynamic> json) => MetaModel(
      status: json['status'] as int,
      msg: json['msg'] as String,
      responseId: json['response_id'] as String,
    );

Map<String, dynamic> _$MetaModelToJson(MetaModel instance) => <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
      'response_id': instance.responseId,
    };
