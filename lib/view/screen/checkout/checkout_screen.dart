import 'package:bkash_flutter/service/api_service.dart';
import 'package:bkash_flutter/utils/app_colors.dart';
import 'package:bkash_flutter/view/screen/checkout/checkout_controller/checkout_controller.dart';
import 'package:bkash_flutter/view/screen/checkout/checkout_repo/checkout_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({super.key});

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  @override
  void initState() {
    Get.put(ApiService(sharedPreferences: Get.find()));
    Get.put(CheckoutRepo(apiService: Get.find()));
    Get.put(CheckoutController(checkoutRepo: Get.find()));
    super.initState();
  }
  String amount = "0";

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
            "Bkash Payment",
            style: TextStyle(
                color: AppColors.white100, fontWeight: FontWeight.bold),
          ),
        ),
        bottomNavigationBar: GetBuilder<CheckoutController>(builder: (controller) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
            child: SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: () async {
                  if (controller.amountController.text == '') {
                    Get.snackbar("Error", "Please Enter Amount And Invoice",
                        colorText: AppColors.white100);
                  } else {
                    controller.bkashPaymentTokenGenerateResult();
                  }
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(AppColors.pink100),
                ),
                child: const Text(
                  "Make Payment",
                  style: TextStyle(color: AppColors.white100),
                ),
              ),
            ),
          );
        }),
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              physics: const BouncingScrollPhysics(),
              child: SizedBox(
                width: constraints.maxWidth,
                child: GetBuilder<CheckoutController>(builder: (controller) {
                  return Column(
                    children: [
                      SizedBox(
                        width: constraints.maxWidth,
                        child: Card(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                "Total Amount : ",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.pink60,
                                    fontSize: 16),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(amount.isEmpty?"0": amount,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.pink100,
                                    fontSize: 24),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: controller.amountController,
                        onChanged: (price){
                          amount = price;
                          setState(() {

                          });
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: "Enter Amount",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide:
                            const BorderSide(color: AppColors.pink100),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide:
                            const BorderSide(color: AppColors.pink100),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide:
                            const BorderSide(color: AppColors.pink100),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide:
                            const BorderSide(color: AppColors.pink100),
                          ),
                        ),
                      ),
                    ],
                  );
                }),
              ),
            );
          },
        ),
      ),
    );
  }
}
