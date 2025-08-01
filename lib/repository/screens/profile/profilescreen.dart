import 'package:chatappui/domain/constants/appcolors.dart';
import 'package:chatappui/repository/screens/bottomnav/bottomnavigationscreen.dart';
import 'package:chatappui/repository/screens/widgets/uihelper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(CupertinoIcons.back),
        ),
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? AppColors.scaffolddark
            : AppColors.scaffoldlight,
        title: UiHelper.customtext(
          text: "Your Profile",
          fontsize: 18,
          context: context,
          fontweight: FontWeight.bold,
          fontfamily: "bold",
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Theme.of(context).brightness == Brightness.dark
                ? UiHelper.customimage(imgurl: "darkprofile.png")
                : UiHelper.customimage(imgurl: "lightprofile.png"),
            SizedBox(height: 30),
            UiHelper.customtextField(
              controller: firstnameController,
              text: "First Name (Required)",
              textinputtype: TextInputType.name,
              context: context,
              icondata: Icons.person,
            ),
            SizedBox(height: 10),
            UiHelper.customtextField(
              controller: lastnameController,
              text: "Last Name (Required)",
              textinputtype: TextInputType.name,
              context: context,
              icondata: CupertinoIcons.person_2,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: UiHelper.custombutton(
        buttonnname: "Save",
        callback: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => BottomNavScreen()),
          );
        },
      ),
    );
  }
}
