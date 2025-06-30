import 'package:ecomapp/core/Theme/entity/appTheme.dart';
import 'package:ecomapp/presentation/Bloc/MultiSplashScreenBloc/multi_splah_screen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class MultiSplashScreen extends StatelessWidget {
  MultiSplashScreen({super.key});

  static const int totalPages = 3;
  AppTheme appTheme = AppTheme();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MultiSplahScreenBloc(),
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<MultiSplahScreenBloc, MultiSplahScreenState>(
            builder: (context, state) {
              final bloc = context.read<MultiSplahScreenBloc>();
              final isLastPage = (state.currentPage == totalPages - 1);

              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: '${state.currentPage + 1}',
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: AppTheme().black,
                                fontSize: 18),
                            children: <TextSpan>[
                              TextSpan(
                                  text: '/$totalPages',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w700)),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () => context.go("/signin"),
                          child: const Text(
                            'Skip',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            state.currentSplashPage.imagePath,
                            width: 300,
                            height: 300,
                            fit: BoxFit.contain,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            state.currentSplashPage.title,
                            style: TextStyle(
                                fontWeight: appTheme.Fontweight_multi_splash_H,
                                fontSize: appTheme.FontSize_multi_splash_H,
                                color: appTheme.black),
                          ),
                          const SizedBox(height: 10),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              state.currentSplashPage.description,
                              style: TextStyle(
                                  fontWeight:
                                      appTheme.Fontweight_multi_splash_N,
                                  fontSize: appTheme.FontSize_multi_splash_N,
                                  wordSpacing: 2,
                                  color: Colors.grey[600]),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (state.currentPage > 0)
                          GestureDetector(
                            onTap: () => bloc.add(SplashPrevEvent()),
                            child: Text(
                              'Prev',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: Colors.grey[400]),
                            ),
                          )
                        else
                          const SizedBox(width: 50),
                        Row(
                          children: List.generate(totalPages, (index) {
                            bool isActive = index == state.currentPage;
                            return Container(
                              margin: const EdgeInsets.symmetric(horizontal: 5),
                              width: isActive ? 24 : 10,
                              height: 10,
                              decoration: BoxDecoration(
                                color:
                                    isActive ? Colors.black : Colors.grey[300],
                                borderRadius: BorderRadius.circular(10),
                              ),
                            );
                          }),
                        ),
                        GestureDetector(
                          onTap: () {
                            if (isLastPage) {
                              context.go("/signin");
                            } else {
                              bloc.add(SplashNextEvent());
                            }
                          },
                          child: Text(
                            isLastPage ? 'Get Started' : 'Next',
                            style: TextStyle(
                                color: appTheme.red,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
