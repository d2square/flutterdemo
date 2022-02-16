import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helloworld/splashScreen/utils/const_string.dart';

class SignUpController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController jobController = TextEditingController();
  final client = Dio();

  bool isSubmitLoading = false;

  updateSignUUpLoading(bool val) {
    isSubmitLoading = val;
    update();
  }

  submitPostForReg() async {
    updateSignUUpLoading(true);
    Map<String, dynamic> params = {
      "name": nameController.text,
      "job": jobController.text,
    };
    try {
      var response = await client.post(
        baseUrlForPost + postUser,
        queryParameters: params,
      );
      if (response.statusCode == 201) {
        updateSignUUpLoading(false);
        successDialog("Success", "Data SuccessFully Submitted");
      } else {
        updateSignUUpLoading(false);
        successDialog("Error", response.data);
      }
    } catch (e) {
      updateSignUUpLoading(false);
      successDialog("Error", e.toString());
    }
  }

  successDialog(String msg, String errorOrSuccess) {
    Get.snackbar(msg, errorOrSuccess, snackPosition: SnackPosition.TOP);
    //Get.defaultDialog(title: msg, middleText: errorOrSuccess);
    // showDialog(
    //     context: context,
    //     builder: (context) {
    //       return AlertDialog(
    //         title: Text(message),
    //         content: const Text("Hello You have successFully Submitted Data"),
    //         actions: [
    //           MaterialButton(
    //
    //               onPressed: (){
    //
    //           })
    //         ],
    //       );
    //     });
  }
}
