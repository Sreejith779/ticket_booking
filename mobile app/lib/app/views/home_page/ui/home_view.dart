import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_fadein/flutter_fadein.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../utils/assets.dart';
import '../../../utils/buttons.dart';
import '../../../utils/colors.dart';
import '../../../utils/consts.dart';
import '../../../utils/textStyles.dart';
import '../controller/home_controller.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<HomeController>(context);
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    var format = DateFormat.yMd();
    var dateString = format.format(DateTime.now());

    return Scaffold(
      backgroundColor: AppColors.primaryWhite,
      body: Stack(
        children: [
          Column(
            children: [
              //background bus image
              Container(
                height: h * 0.45,
                width: w,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(AppAssets.busBg),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                      left: w * 0.15, right: w * 0.15, top: h * 0.06),
                  child: Text(
                    "Let's Book Your Next Ticket",
                    style: style(32, FontWeight.w600, Colors.white),
                    maxLines: 2,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
          //booking widget
          Positioned(
            top: h * 0.25, // Adjusted position
            left: 18,
            right: 18,
            child: Container(
              height: h * 0.5,
              width: w,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 10,
                  children: [
                    //trip type
                    Container(
                      width: w,
                      height: h * 0.06,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade50,
                          borderRadius: BorderRadius.circular(18)),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(3, (index) {
                            return GestureDetector(
                              onTap: () {
                                controller.selectedTrip(index);
                                log("selectedTrip: ${controller.selectedIndex}");
                              },
                              child: Container(
                                width: w * 0.25,
                                height: h * 0.05,
                                decoration: BoxDecoration(
                                    color: controller.selectedIndex == index
                                        ? Colors.white
                                        : Colors.transparent,
                                    boxShadow: [
                                      BoxShadow(
                                          offset: Offset(0, 4),
                                          color:
                                              controller.selectedIndex == index
                                                  ? Colors.grey.shade200
                                                  : Colors.transparent,
                                          blurRadius: 6,
                                          spreadRadius: 1)
                                    ],
                                    borderRadius: BorderRadius.circular(20)),
                                child: Center(
                                    child: Text(
                                  typesOfTrips[index],
                                  style: style(
                                      12,
                                      controller.selectedIndex == index
                                          ? FontWeight.w600
                                          : FontWeight.w500,
                                      controller.selectedIndex == index
                                          ? AppColors.blue
                                          : AppColors.textColor),
                                )),
                              ),
                            );
                          })),
                    ),
//source and destination
                    Stack(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(2, (index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Container(
                              height: h * 0.08,
                              width: w * 0.36,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border:
                                      Border.all(color: AppColors.textColor)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  spacing: 2,
                                  children: [
                                    Text(
                                      locationType[index],
                                      style: style(12, FontWeight.w500,
                                          AppColors.textColor),
                                    ),
                                    Center(
                                      child: Text(
                                        index == 0 ? "Source" : "Destination",
                                        style: style(14, FontWeight.w600,
                                            AppColors.grey),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                      Positioned(
                        top: h * 0.018,
                        left: w * 0.35,
                        child: CircleAvatar(
                          radius: 18,
                          backgroundColor: AppColors.white,
                          child: Image.asset(
                            AppAssets.exchange,
                            height: 14,
                            color: AppColors.blue,
                          ),
                        ),
                      )
                    ]),
//Departure Date
                    GestureDetector(
                      onTap: () async {
                        //  showDatePicker(context: context,
                        //      firstDate: DateTime.now(),
                        //      lastDate: DateTime(2050),
                        //  currentDate: DateTime.now(),
                        // initialDatePickerMode: DatePickerMode.day,
                        //  initialDate: DateTime.now());

                        await showDialog(
                            context: context,
                            builder: (context) {
                              return FadeIn(
                                duration: Duration(milliseconds: 500),
                                child: DatePickerDialog(
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime(2026)),
                              );
                            });
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 4, right: 4),
                        child: Container(
                          height: h * 0.08,
                          width: w,
                          decoration: BoxDecoration(
                              border: Border.all(color: AppColors.textColor),
                              borderRadius: BorderRadius.circular(8)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              spacing: 5,
                              children: [
                                Text(
                                  "Departure Date",
                                  style: style(
                                      12, FontWeight.w500, AppColors.textColor),
                                ),
                                Row(
                                  spacing: 10,
                                  children: [
                                    Image.asset(
                                      AppAssets.calender,
                                      height: 18,
                                      color: AppColors.textColor,
                                    ),
                                    Text(
                                      dateString,
                                      style: style(12, FontWeight.w500,
                                          AppColors.textColor),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),

                    // passenger selection
                    GestureDetector(
                      onTap: () async {
                        _showPassengersDialog(context, controller);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 4, right: 4),
                        child: Container(
                          height: h * 0.08,
                          width: w,
                          decoration: BoxDecoration(
                              border: Border.all(color: AppColors.textColor),
                              borderRadius: BorderRadius.circular(8)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              spacing: 2,
                              children: [
                                Text(
                                  "Passengers",
                                  style: style(
                                      12, FontWeight.w500, AppColors.textColor),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      context
                                                  .watch<HomeController>()
                                                  .selectedPassengersCount >
                                              0
                                          ? "Select Passengers Count ${context.watch<HomeController>().selectedPassengersCount}"
                                          : "Select Passengers Count",
                                      style: style(14, FontWeight.w500,
                                          AppColors.textColor),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    // search Button
                    button(
                        title: "Search",
                        color: AppColors.blue,
                        context: context, onPressed: () {  })
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _showPassengersDialog(
      BuildContext context, HomeController controller) async {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return await showDialog(
      context: context,
      builder: (context) {
        return FadeIn(
          duration:
              Duration(milliseconds: 300), // Adjust fade duration as needed
          child: Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Container(
              height:
                  (passengersCount.length * 50).toDouble().clamp(100, h * 0.5),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: AppColors.primaryWhite,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                  passengersCount.length,
                  (index) {
                    return GestureDetector(
                      onTap: () {
                        controller.updateSelectedPassengersCount(
                            passengersCount[index]);
                        log("selectedPassengers: ${controller.selectedPassengersCount}");
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 3,
                          horizontal: 10,
                        ),
                        child: Column(
                          children: [
                            Text(
                              "Passengers ${passengersCount[index]}",
                              style: style(
                                  16, FontWeight.w600, AppColors.textColor),
                            ),
                            Divider()
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
