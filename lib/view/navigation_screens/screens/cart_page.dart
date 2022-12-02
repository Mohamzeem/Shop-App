import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shop_getx_firebase/consts/colors.dart';
import 'package:shop_getx_firebase/core/controllers/cart_controller.dart';
import 'package:shop_getx_firebase/model/cart_product_model.dart';
import 'package:shop_getx_firebase/view/widgets/custom_elevated_button.dart';
import 'package:shop_getx_firebase/view/widgets/custom_text.dart';
import '../../widgets/custom_sized_box.dart';

// ignore: must_be_immutable
class CartScreen extends StatelessWidget {
  CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    return Scaffold(
        body: GetBuilder<CartController>(
            init: CartController(),
            builder: ((controller) => Column(
                  children: [
                    Expanded(
                      child: ListView.separated(
                        itemBuilder: ((context, index) => Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15.w),
                              child: CustomSizedBox(
                                height: 0.16,
                                width: 1,
                                child: Row(
                                  children: [
                                    CustomSizedBox(
                                        height: 0.16,
                                        width: 0.3,
                                        child: Image.network(
                                          controller
                                              .cartProductModel[index].image!,
                                          fit: BoxFit.fill,
                                        )),
                                    Padding(
                                      padding: EdgeInsets.only(left: 20.w),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          CustomText(
                                            text: controller
                                                .cartProductModel[index].name!,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w300,
                                            color: kBlack,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 10.h),
                                            child: CustomText(
                                              text:
                                                  '\$ ${controller.cartProductModel[index].price!.toString()}',
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                              color: mainColor,
                                            ),
                                          ),
                                          Container(
                                            color: Colors.grey.shade200,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.045,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.28,
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                IconButton(
                                                  onPressed: () {},
                                                  icon: Icon(
                                                    Icons.add,
                                                    size: 20.r,
                                                  ),
                                                ),
                                                const CustomText(
                                                  text: '2',
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  color: kBlack,
                                                ),
                                                IconButton(
                                                  onPressed: () {},
                                                  icon: Icon(
                                                    Icons.remove,
                                                    size: 20.r,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )),
                        separatorBuilder: ((context, index) =>
                            const CustomSizedBox(height: 0.02, width: 1)),
                        itemCount: controller.cartProductModel.length,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 15.w, vertical: 10.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              CustomText(
                                  text: "TOTAL",
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: kGrey),
                              CustomSizedBox(height: 0.008, width: 0.008),
                              CustomText(
                                  text: "\$ 1800",
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: mainColor),
                            ],
                          ),
                          CustomElevatedButton(
                              onPressed: () {},
                              text: 'CHECKOUT',
                              height: 0.06,
                              width: 0.4,
                              backgroundColor: mainColor,
                              textColor: kWhite),
                        ],
                      ),
                    )
                  ],
                ))));
  }
}
