import 'package:ecomapp/core/Const/assetspath.dart';
import 'package:ecomapp/presentation/Bloc/HomeBloc/home_bloc.dart';
import 'package:ecomapp/presentation/Bloc/HomeBloc/home_state.dart';
import 'package:ecomapp/presentation/CommonWidgets/appbar.dart';
import 'package:ecomapp/presentation/CommonWidgets/headerSortbar.dart';
import 'package:ecomapp/presentation/CommonWidgets/searchBar.dart';
import 'package:ecomapp/presentation/Screens/Home/Widgets/addBanner.dart';
import 'package:ecomapp/presentation/Screens/Home/Widgets/bottomProductList.dart';
import 'package:ecomapp/presentation/Screens/Home/Widgets/carosalOfferBanner.dart';
import 'package:ecomapp/presentation/Screens/Home/Widgets/dealoftheDay.dart';
import 'package:ecomapp/presentation/Screens/Home/Widgets/homeTopCategories.dart';
import 'package:ecomapp/presentation/Screens/Home/Widgets/specialOfferCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeBloc()..add(LoadHomeData()),
      child: Scaffold(
        appBar: CustomAppBar.IconAppbar(),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoading) {
              return Center(child: CircularProgressIndicator());
            }
            if (state is HomeLoaded) {
              return SingleChildScrollView(
                padding: EdgeInsets.only(bottom: 75),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomSearchbar(),
                      CustomHeadersortbar(headersortbarLabel: "All Featured"),
                      Hometopcategories(
                          categories: state.homeData[0].categories),
                      SizedBox(height: 16),
                      Carosalofferbanner(),
                      SizedBox(height: 16),
                      Dealoftheday(
                          dealOfDayProducts:
                              state.homeData[0].dealOfDayProducts),
                      SizedBox(height: 16),
                      Specialoffercard(),
                      SizedBox(height: 16),
                      Addbanner(
                        imgPath: "${Img_Home}add2.png",
                      ),
                      SizedBox(height: 16),
                      Bottomproductlist(
                          trendingProducts: state.homeData[0].trendingProducts),
                      SizedBox(height: 16),
                      Addbanner(
                        imgPath: "${Img_Home}add3.png",
                        height: 400,
                      ),
                      SizedBox(height: 16),
                      Addbanner(imgPath: "${Img_Home}add4.png", height: 450),
                      SizedBox(height: 16),
                    ],
                  ),
                ),
              );
            }
            return Center(child: Text('Something went wrong'));
          },
        ),
      ),
    );
  }
}
