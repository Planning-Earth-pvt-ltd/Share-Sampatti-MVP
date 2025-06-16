import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:share_sampatti_mvp/app/app.dart';
import 'package:share_sampatti_mvp/scr/features/profile/screens/profile_heading.dart';
import 'package:share_sampatti_mvp/scr/features/profile/screens/profile_list.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: Icon(Icons.arrow_back_sharp),
          color: AppColors.lightGrey,
        ),
        title: Inter(
          text: "User Profile",
          color: Theme.of(context).colorScheme.primary,
          fontSize: 20.75,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: AppColors.darkGrey,
              height: 90,
              margin: const EdgeInsets.only(top: 30),
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: AppColors.profileBackground,
                        child: Inter(
                          text: "S",
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(width: 10),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Inter(
                            text: "Shubham Patel",
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                          Inter(
                            text: "View Details",
                            color: AppColors.lightGrey,
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                          ),
                        ],
                      ),
                    ],
                  ),
                  CustomTextButton(text: "Edit"),
                ],
              ),
            ),
            ProfileHeading(text: "Account Details"),
            ProfileList(
              details: AppConstants.accountDetails,
              subDetails: AppConstants.accountSubDetails,
            ),
            ProfileHeading(text: "Account"),
            ProfileList(details: AppConstants.account),
            ProfileHeading(text: "About"),
            ProfileList(details: AppConstants.about),
            SizedBox(height: 30),
            ProfileList(details: AppConstants.logout),
          ],
        ),
      ),
    );
  }
}
