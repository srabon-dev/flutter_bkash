import 'package:bkash_flutter/view/screen/checkout/checkout_screen.dart';
import 'package:bkash_flutter/view/screen/home/home_screen.dart';
import 'package:bkash_flutter/view/screen/payment/bkash_payment.dart';
import 'package:get/get.dart';

class AppRoute{
  static const String homeScreen = "/home_screen";
  static const String bkashPaymentScreen = "/bkash_payment";
  static const String checkOutScreen = "/checkout_screen";

  static List<GetPage> routes = [

    GetPage(name: homeScreen, page: () => const HomeScreen()),
    GetPage(name: bkashPaymentScreen, page: () => const BkashPaymentScreen()),
    GetPage(name: checkOutScreen, page: () => const CheckOutScreen()),
  ];
}


