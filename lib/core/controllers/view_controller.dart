import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../consts/colors.dart';
import '../../view/navigation_screens/screens/account_page.dart';
import '../../view/navigation_screens/screens/cart_page.dart';
import '../../view/navigation_screens/screens/explore_page.dart';
import '../../view/widgets/custom_text.dart';

class ViewController extends GetxController {
  RxInt currentIndex = 0.obs;

  List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Image.asset(
          'assets/Explore.png',
          fit: BoxFit.contain,
          width: 50,
        ),
      ),
      //     Icon(
      //   Icons.explore,
      //   color: kBlack,
      //   size: 25,
      // ),
      label: '',
      activeIcon: const Padding(
        padding: EdgeInsets.only(top: 10),
        child: CustomText(
          text: 'Explore',
          fontSize: 15,
          fontWeight: FontWeight.w500,
          color: mainColor,
        ),
      ),
    ),
    BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Image.asset(
          'assets/Icon_Cart.png',
          fit: BoxFit.contain,
          width: 20,
        ),
      ),
      //     Icon(
      //   Icons.shop,
      //   color: kBlack,
      //   size: 25,
      // ),
      label: '',
      activeIcon: const Padding(
        padding: EdgeInsets.only(top: 10),
        child: CustomText(
          text: 'Cart',
          fontSize: 15,
          fontWeight: FontWeight.w500,
          color: mainColor,
        ),
      ),
    ),
    BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Image.asset(
          'assets/Icon_User.png',
          fit: BoxFit.contain,
          width: 20,
        ),
      ),
      //     Icon(
      //   Icons.person,
      //   color: kBlack,
      //   size: 25,
      // ),
      label: '',
      activeIcon: const Padding(
        padding: EdgeInsets.only(top: 10),
        child: CustomText(
          text: 'Account',
          fontSize: 15,
          fontWeight: FontWeight.w500,
          color: mainColor,
        ),
      ),
    ),
  ].obs;
  List<Widget> screens = [
    const ExploreScreen(),
    CartScreen(),
    const AccountScreen(),
  ].obs;

  // get newValue => currentIndex;
  // void changeSelectedValue(int selectedValue) {
  //   currentIndex.value = selectedValue;
  //   update();
  // }
}
