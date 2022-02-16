import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:helloworld/sign_up/application/controller/signup_controller.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<SignUpController>(builder: (signUpController) {
          return Form(
            key: formKey,
            child: Card(
              elevation: 1.0,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    TextFormField(
                      controller: signUpController.nameController,
                      // inputFormatters: [
                      //   LengthLimitingTextInputFormatter(10),
                      // ],
                      // maxLengthEnforced: true,
                      // maxLength: 10,

                      validator: (String? s) {
                        return s!.isEmpty ? "Please Enter Value" : null;
                      },
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Name",
                          hintText: "Enter Your Name"),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      controller: signUpController.jobController,
                      validator: (String? s) {
                        return s!.isEmpty ? "Please Enter Value" : null;
                      },
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Job",
                          hintText: "Enter Your Job"),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    signUpController.isSubmitLoading == true
                        ? const Center(
                            child: CupertinoActivityIndicator(),
                          )
                        : MaterialButton(
                            minWidth: double.infinity,
                            color: Colors.blue.shade100,
                            child: const Text("Submit"),
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                signUpController.submitPostForReg();
                              }
                            })
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
