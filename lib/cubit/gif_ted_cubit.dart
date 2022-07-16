import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:gif_ted/src/data/models/giphy_item_model.dart';
import 'package:gif_ted/src/data/models/giphy_response_model.dart';
import 'package:gif_ted/src/data/repository.dart';

part 'gif_ted_state.dart';

class GifTedCubit extends Cubit<GifTedState> {
  GifTedCubit() : super(const GifTedInitial());

  Future<void> getMoreGifs({
    required List<GiphyItemModel> currentList,
    required int offset,
  }) async {
    final _repo = Repository();

    try {
      final GiphyResponseModel response = await _repo.getTrendingGifs(
        offset: offset + 20,
      );

      emit(GifTedResponse(
        dataList: [...currentList, ...response.data],
        pagination: response.pagination,
      ));
    } catch (e) {
      debugPrint('$e');
    }
  }
}
