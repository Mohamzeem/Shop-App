import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_getx_firebase/core/controllers/data_controller.dart';
import 'package:shop_getx_firebase/view/details_screen/details_screen.dart';
import '../../../consts/colors.dart';
import '../../widgets/custom_sized_box.dart';
import '../../widgets/custom_text.dart';

class BigList extends StatelessWidget {
  const BigList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DataController>(
      builder: ((controller) => CustomSizedBox(
            height: 0.43,
            width: 1,
            child: GetBuilder<DataController>(
              builder: (controller) => ListView.separated(
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) {
                  return const CustomSizedBox(height: 0, width: 0.04);
                },
                itemCount: controller.productModel.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => Get.to(() => DetailsScreen(
                          model: controller.productModel[index],
                        )),
                    child: CustomSizedBox(
                      height: 0.3,
                      width: 0.4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.3,
                            width: MediaQuery.of(context).size.width * 0.4,
                            decoration:
                                BoxDecoration(color: Colors.grey.shade100),
                            child: Image.network(
                                controller.productModel[index].image!),
                          ),
                          const CustomSizedBox(
                            height: 0.02,
                            width: 0,
                          ),
                          CustomText(
                              text: controller.productModel[index].name!,
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: kBlack),
                          const CustomSizedBox(
                            height: 0.005,
                            width: 0,
                          ),
                          CustomText(
                              text: controller.productModel[index].description!,
                              maxLines: 1,
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                              color: Colors.grey.shade700),
                          const CustomSizedBox(
                            height: 0.01,
                            width: 0,
                          ),
                          CustomText(
                              text:
                                  '${controller.productModel[index].price!} \$',
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: mainColor),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          )),
    );
  }
}
