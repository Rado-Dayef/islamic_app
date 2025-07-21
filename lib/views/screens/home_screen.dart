import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamic_app/constants/colors.dart';
import 'package:islamic_app/constants/extensions.dart';
import 'package:islamic_app/constants/strings.dart';
import 'package:islamic_app/controllers/home_cubit/home_cubit.dart';
import 'package:islamic_app/models/home_categories_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: 10.edgeInsetsAll,
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              return Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 0,
                        child: Text(state.meladyDate, style: TextStyle(fontSize: 30, color: AppColors.darkBlueColor)),
                      ),
                      Spacer(),
                      Expanded(
                        flex: 0,
                        child: Text(state.hijriDate, style: TextStyle(fontSize: 30, color: AppColors.darkBlueColor)),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(AppStrings.prayerRoute);
                    },
                    child: Text(state.day, style: TextStyle(fontSize: 60, color: AppColors.darkBlueColor)),
                  ),
                  BlocBuilder<HomeCubit, HomeState>(
                    builder: (context, state) {
                      return Directionality(
                        textDirection: TextDirection.rtl,
                        child: GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: state.categories.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
                          itemBuilder: (_, int index) {
                            HomeCategoriesModel category = state.categories[index];
                            return InkWell(
                              onTap: () {
                                Navigator.of(context).pushNamed(category.route);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: AppColors.darkBlueColor,
                                  borderRadius: BorderRadius.only(topRight: Radius.circular(5), bottomRight: Radius.circular(25), bottomLeft: Radius.circular(5), topLeft: Radius.circular(25)),
                                ),

                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Image.asset(category.image, height: MediaQuery.of(context).size.width * 0.25, width: MediaQuery.of(context).size.width * 0.25),
                                    Text(category.name, style: TextStyle(color: AppColors.whiteColor, fontSize: 40)),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                  // BlocBuilder<QuranCubit, QuranState>(
                  //   builder: (context, state) {
                  //     if (state is QuranLoading) {
                  //       return CircularProgressIndicator();
                  //     } else if (state is QuranException) {
                  //       return Text(state.message, style: TextStyle(fontSize: 40));
                  //     } else if (state is QuranLoaded) {
                  //       return ListView.separated(
                  //         itemCount: state.suras.length,
                  //         shrinkWrap: true,
                  //         physics: NeverScrollableScrollPhysics(),
                  //         itemBuilder: (_, int index) {
                  //           SuraModel sura = state.suras[index];
                  //           return AppMainWidget(
                  //             sura.name,
                  //             leading: sura.number.toString(),
                  //             trailing: sura.verseCount.toString(),
                  //             onTap: () {
                  //               Navigator.of(context).pushNamed(AppStrings.suraRoute, arguments: sura);
                  //             },
                  //           );
                  //         },
                  //         separatorBuilder: (_, __) {
                  //           return 10.gap;
                  //         },
                  //       );
                  //     } else {
                  //       return Text("Unknown Error", style: TextStyle(fontSize: 40));
                  //     }
                  //   },
                  // ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
