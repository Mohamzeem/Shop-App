// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shop_getx_firebase/consts/colors.dart';
import 'package:shop_getx_firebase/core/controllers/cart_controller.dart';
import 'package:shop_getx_firebase/model/cart_product_model.dart';
import 'package:shop_getx_firebase/model/product_model.dart';
import 'package:shop_getx_firebase/view/widgets/custom_elevated_button.dart';
import 'package:shop_getx_firebase/view/widgets/custom_sized_box.dart';
import 'package:shop_getx_firebase/view/widgets/custom_text.dart';

class DetailsScreen extends StatelessWidget {
  ProductModel model;
  DetailsScreen({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    return Scaffold(
      body: Column(
        children: [
          CustomSizedBox(
            height: 0.25,
            width: 1,
            child: Image.network(model.image!, fit: BoxFit.fill),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomSizedBox(height: 0.015, width: 1),
                  CustomText(
                    text: model.name!,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: kBlack,
                  ),
                  const CustomSizedBox(height: 0.03, width: 1),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: MediaQuery.of(context).size.height * 0.05,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            border: Border.all(color: kGrey, width: 0.7)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const CustomText(
                                text: 'Size',
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: kBlack),
                            CustomText(
                                text: model.size!,
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: kBlack)
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: MediaQuery.of(context).size.height * 0.05,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            border: Border.all(color: kGrey, width: 0.7)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const CustomText(
                                text: 'Color',
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: kBlack),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.06,
                              height: MediaQuery.of(context).size.height * 0.03,
                              decoration: BoxDecoration(color: model.color),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const CustomSizedBox(height: 0.03, width: 1),
                  const CustomText(
                      text: 'Details',
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: kBlack),
                  const CustomSizedBox(height: 0.02, width: 1),
                  CustomSizedBox(
                    height: 0.46,
                    width: 1,
                    child: CustomText(
                        text: model.description!,
                        heightText: 2,
                        maxLines: 9,
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                        color: kBlack),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const CustomText(
                              text: 'PRICE',
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: kBlack),
                          CustomText(
                              text: '${model.price!} \$',
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: mainColor)
                        ],
                      ),
                      GetBuilder<CartController>(
                        init: CartController(),
                        builder: ((controller) => CustomElevatedButton(
                              onPressed: () async =>
                                  await controller.addProduct(CartProductModel(
                                image: model.image,
                                name: model.name,
                                price: model.price,
                                productId: model.productId,
                                quantity: 1,
                              )),
                              text: 'ADD',
                              height: 0.06,
                              width: 0.35,
                              backgroundColor: mainColor,
                              textColor: kWhite,
                            )),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
