import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_getx_firebase/core/controllers/data_controller.dart';
import '../../../consts/colors.dart';
import '../../widgets/custom_sized_box.dart';
import '../../widgets/custom_text.dart';

class SmallList extends StatelessWidget {
  const SmallList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DataController>(
      builder: ((controller) => CustomSizedBox(
            height: 0.15,
            width: 1,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) {
                return const CustomSizedBox(height: 0, width: 0.04);
              },
              itemCount: controller.categoryModel.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.07,
                      width: MediaQuery.of(context).size.width * 0.15,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.grey.shade100),
                      child:
                          Image.network(controller.categoryModel[index].image!),
                    ),
                    const CustomSizedBox(
                      height: 0.02,
                      width: 0,
                    ),
                    CustomText(
                        text: controller.categoryModel[index].name!,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: kBlack),
                  ],
                );
              },
            ),
          )),
    );
  }
}
