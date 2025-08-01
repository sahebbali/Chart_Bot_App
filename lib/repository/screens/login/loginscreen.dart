import 'package:chatappui/domain/constants/appcolors.dart';
import 'package:chatappui/repository/screens/otp/otpscreen.dart';
import 'package:chatappui/repository/screens/widgets/uihelper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController phoneController = TextEditingController();
  LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? AppColors.scaffolddark
            : AppColors.scaffoldlight,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(CupertinoIcons.back),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            UiHelper.customtext(
              text: "Enter Your Phone Number",
              fontsize: 24,
              context: context,
              fontweight: FontWeight.bold,
              fontfamily: "bold",
            ),
            SizedBox(height: 10),
            UiHelper.customtext(
              text: "Please confirm your country code and enter",
              fontsize: 14,
              context: context,
            ),
            UiHelper.customtext(
              text: "your phone number",
              fontsize: 14,
              context: context,
            ),
            SizedBox(height: 20),
            UiHelper.customtextField(
              controller: phoneController,
              text: "Phone Number",
              textinputtype: TextInputType.number,
              context: context,
              icondata: Icons.phone,
            ),
          ],
        ),
      ),
      floatingActionButton: UiHelper.custombutton(
        buttonnname: "Continue",
        callback: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => OTPScreen()),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
