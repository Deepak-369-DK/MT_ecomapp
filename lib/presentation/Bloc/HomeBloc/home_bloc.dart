import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:ecomapp/data/Models/homeModel.dart';
import 'package:ecomapp/data/conts/homeData.dart';
import 'package:ecomapp/presentation/Bloc/HomeBloc/home_state.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<LoadHomeData>((_, emit) async {
      try {
        var _datas = homedata.map((e) => HomeModel.fromMap(e)).toList();
        emit(HomeLoaded(homeData: _datas));
      } catch (e) {
        emit(HomeError('Error loading home data'));
      }
    });
  }
}
