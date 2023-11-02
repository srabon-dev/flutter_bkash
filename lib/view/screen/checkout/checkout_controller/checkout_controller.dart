import 'dart:convert';
import 'package:bkash_flutter/core/app_route.dart';
import 'package:bkash_flutter/core/global/api_response_model.dart';
import 'package:bkash_flutter/model/create_payment_model.dart';
import 'package:bkash_flutter/model/execute_payment_model.dart';
import 'package:bkash_flutter/model/grant_token_model.dart';
import 'package:bkash_flutter/model/query_payment_model.dart';
import 'package:bkash_flutter/view/screen/checkout/checkout_repo/checkout_repo.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class CheckoutController extends GetxController{
  CheckoutRepo checkoutRepo;
  CheckoutController({required this.checkoutRepo});


  //Amount Controller
  final TextEditingController amountController = TextEditingController();

  //All Response Model
  CreatePaymentModel createPaymentModel = CreatePaymentModel();
  ExecutePaymentModel executePaymentModel = ExecutePaymentModel();
  QueryPaymentModel queryPaymentModel = QueryPaymentModel();
  GrantTokenResponse grantTokenResponse = GrantTokenResponse();

  //Grant Token Controller Start
  bool tokenGenerateLoading = false;
  Future<void> bkashPaymentTokenGenerateResult() async{
    tokenGenerateLoading = true;
    update();

    ApiResponseModel responseModel = await checkoutRepo.bkashPaymentGrantTokenGenerate();

    if(responseModel.statusCode == 200){
      grantTokenResponse = GrantTokenResponse.fromJson(responseModel.responseJson);
      tokenGenerateLoading = false;
      update();
      bkashCreatePaymentResult(idToken: grantTokenResponse.idToken??"");
    }
    else{
      tokenGenerateLoading = false;
      update();
    }
    tokenGenerateLoading = false;
    update();
  }
  //Grant Token Controller End

  //Create Payment Controller Start
  bool createPaymentLoading = false;
  Future<void> bkashCreatePaymentResult({required String idToken}) async{
    createPaymentLoading = true;
    update();

    ApiResponseModel responseModel = await checkoutRepo.bkashCreatePaymentResponse(
        idToken: idToken,
        amount: amountController.text.trim()
    );
    if(responseModel.statusCode == 200){
      createPaymentModel = CreatePaymentModel.fromJson(jsonDecode(responseModel.responseJson));
      createPaymentLoading = false;
      update();
      Get.offAndToNamed(AppRoute.bkashPaymentScreen,arguments: createPaymentModel.bkashUrl);
    }
    else{
      createPaymentLoading = false;
      update();
    }
    createPaymentLoading = false;
    update();
  }
  //Create Payment Controller End

  //Execute Payment Controller Start
  bool bkashExecutePaymentLoading = false;
  Future<void> bkashExecutePaymentResult({required String idToken, required String paymentID}) async{
    createPaymentLoading = true;
    update();

    ApiResponseModel responseModel = await checkoutRepo.bkashExecutePaymentResponse(
        idToken: idToken,
        paymentID: paymentID,
    );
    if(responseModel.statusCode == 200){
      executePaymentModel = ExecutePaymentModel.fromJson(jsonDecode(responseModel.responseJson));
      createPaymentLoading = false;
      update();
    }
    else{
      createPaymentLoading = false;
      update();
    }
    createPaymentLoading = false;
    update();
  }
  //Execute Payment Controller End

  //Query Payment Controller Start
  bool bkashQueryPaymentLoading = false;
  Future<void> bkashQueryPaymentResult({required String idToken, required String paymentID}) async{
    createPaymentLoading = true;
    update();

    ApiResponseModel responseModel = await checkoutRepo.bkashQueryPaymentResponse(
      idToken: idToken,
      paymentID: paymentID,
    );
    if(responseModel.statusCode == 200){
      executePaymentModel = ExecutePaymentModel.fromJson(jsonDecode(responseModel.responseJson));
      createPaymentLoading = false;
      update();
    }
    else{
      createPaymentLoading = false;
      update();
    }
    createPaymentLoading = false;
    update();
  }
  //Query Payment Controller End
}