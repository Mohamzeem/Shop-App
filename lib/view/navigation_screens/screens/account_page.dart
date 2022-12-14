import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shop_getx_firebase/consts/colors.dart';
import 'package:shop_getx_firebase/view/widgets/custom_sized_box.dart';
import 'package:shop_getx_firebase/view/widgets/custom_text.dart';
import '../../../core/controllers/profile_accont_controller.dart';
import '../widgets/list_tile.dart';

class AccountScreen extends GetWidget<ProfileAccountController> {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 15.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 100.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.r),
                    color: mainColor,
                    image: DecorationImage(
                      image: controller.userModel == null
                          ? const AssetImage('assets/avatar.png')
                          : controller.userModel!.pic == 'default'
                              ? const AssetImage('assets/avatar.png')
                              : NetworkImage(
                                      controller.userModel!.pic.toString())
                                  as ImageProvider,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Column(
                  children: [
                    CustomText(
                      text: "controller.userModel!.name!",
                      fontSize: 10,
                      fontWeight: FontWeight.w900,
                      color: kBlack,
                    ),
                    const CustomText(
                      text: 'Account Screen',
                      fontSize: 10,
                      fontWeight: FontWeight.w900,
                      color: kBlack,
                    ),
                  ],
                ),
              ],
            ),
            const CustomSizedBox(height: 0.1, width: 1),
            CustomListTile(
              icon: Icons.edit,
              text: 'Edit Profile',
              onPressed: () {},
            ),
            CustomListTile(
              icon: Icons.location_on,
              text: 'Shipping Address',
              onPressed: () {},
            ),
            CustomListTile(
              icon: Icons.history,
              text: 'Order History',
              onPressed: () {},
            ),
            CustomListTile(
              icon: Icons.card_membership,
              text: 'Cards',
              onPressed: () {},
            ),
            CustomListTile(
              icon: Icons.notifications,
              text: 'Notifications',
              onPressed: () {},
            ),
            CustomListTile(
              icon: Icons.logout,
              text: 'Log Out',
              onPressed: () {
                controller.signOut();
              },
            ),
          ],
        ),
      ),
    );
  }
}
