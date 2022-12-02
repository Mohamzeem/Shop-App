import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shop_getx_firebase/core/controllers/data_controller.dart';
import 'package:shop_getx_firebase/view/navigation_screens/widgets/big_list.dart';
import 'package:shop_getx_firebase/view/widgets/custom_circle_indicator.dart';
import '../../../../consts/colors.dart';
import '../widgets/custom_search_bar.dart';
import '../../widgets/custom_sized_box.dart';
import '../../widgets/custom_text.dart';
import '../widgets/small_list.dart';

// ignore: must_be_immutable
class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DataController>(
      builder: ((controller) => controller.isLoading!
          ? const CustomCircleIndicator()
          : Scaffold(
              body: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(top: 20.h, right: 10.w, left: 10.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomSearchBar(),
                      const CustomSizedBox(height: 0.05, width: 1),
                      const CustomText(
                        text: 'Categories',
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: kBlack,
                      ),
                      const CustomSizedBox(height: 0.02, width: 1),
                      const SmallList(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          CustomText(
                            text: 'Best Selling',
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: kBlack,
                          ),
                          CustomText(
                            text: 'See All',
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: kBlack,
                          ),
                        ],
                      ),
                      const CustomSizedBox(height: 0.02, width: 1),
                      const BigList()
                    ],
                  ),
                ),
              ),
            )),
    );
  }
}
