import 'package:bkash_flutter/core/app_route.dart';
import 'package:bkash_flutter/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColors.pink100,
          elevation: 0,
          title: const Text(
            "Bkash",
            style: TextStyle(
                color: AppColors.white100, fontWeight: FontWeight.bold),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
          child: SizedBox(
            height: 50,
            width: MediaQuery.of(context).size.width,
            child: ElevatedButton(
              onPressed: () async {
                Get.toNamed(AppRoute.checkOutScreen);
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(AppColors.pink100),
              ),
              child: const Text(
                "Pay With Bkash",
                style: TextStyle(color: AppColors.white100),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
