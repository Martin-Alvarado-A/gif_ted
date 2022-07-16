part of 'gif_ted_cubit.dart';

abstract class GifTedState extends Equatable {
  const GifTedState();

  @override
  List<Object> get props => [];
}

class GifTedInitial extends GifTedState {
  const GifTedInitial();
}

class GifTedResponse extends GifTedState {
  const GifTedResponse({
    required this.dataList,
    required this.pagination,
  });

  final List<GiphyItemModel> dataList;
  final PaginationModel pagination;

  @override
  List<Object> get props => [dataList, pagination];
}
