import 'package:ecomapp/data/Models/homeModel.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<HomeModel> homeData;

  HomeLoaded({
    required this.homeData,
  });
}

class HomeError extends HomeState {
  final String message;

  HomeError(this.message);
}
