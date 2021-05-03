import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopqua_app/core/view_model/control_view_model.dart';
import 'package:shopqua_app/core/view_model/home_view_model.dart';
import 'package:shopqua_app/view/cart_view.dart';
import 'package:shopqua_app/view/widgets/custom_text.dart';
import 'package:shopqua_app/constance.dart';

import 'datails_view.dart';

class HomeView extends StatelessWidget {
  final List<String> names = <String>[
    'men',
    's',
    's',
    's',
    's',
  ];
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init: Get.find(),
      builder:(controller) => controller.loading.value
          ? Center(child: CircularProgressIndicator())
          : Scaffold(
              body: SingleChildScrollView(
                  child: Container(
                  padding: EdgeInsets.only(top: 100, left: 20, right: 20),
                  child: Column(
                    children: [
                      _searchTextFormField(),
                      SizedBox(height: 20,),
                      CustomText(text: "Catagories",
                      ),
                      SizedBox(height: 20,),
                      _ListViewCategory(),
                      SizedBox(height: 20,),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      CustomText(text: "Best Selling", fontSize: 18,),
                      CustomText(text: "See All", fontSize: 18,),
                    ],
                    ),
                      SizedBox(height: 50,),
                      _ListViewProducts(),


                    ],
                  ),
                ),),

          ),
    );


  }

   Widget _searchTextFormField() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey.shade200,
      ),
      child: TextFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(Icons.search , color: Colors.black,),
        ),
      ),
    );
  }

   Widget _ListViewCategory() {
    return GetBuilder<HomeViewModel>(
      builder: (controller) =>Container(
      height: 100,
      child: ListView.separated(
        itemCount: controller.categoryModel.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.grey.shade100,
                ),
                height: 60,
                width: 60,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(controller.categoryModel[index].image),
                ),
              ),
              SizedBox(height: 20,),
              CustomText(text: controller.categoryModel[index].name,),

            ],
          );

        }, separatorBuilder: (context, index) => SizedBox(width: 20,),
      ),
    ),
    );
  }

   Widget _ListViewProducts() {
      return GetBuilder<HomeViewModel> (
        builder: (controller) => Container(
        height: 350,
        child: ListView.separated(
          itemCount: controller.productModel.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap:  () {
                Get.to(DetailsView(model: controller.productModel[index],));
              },
              child: Container(
              width: MediaQuery.of(context).size.width * .4,
              child: Column(
                children: [
                  Container(

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.grey.shade100,
                    ),



                    child:
                       Container(
                         height: 220,
                         width: MediaQuery.of(context).size.width * .4,
                         child: Image.network(controller.productModel[index].image, fit: BoxFit.fill),),

                  ),
                  SizedBox(height: 10,),
                  CustomText(
                    text: controller.productModel[index].name,
                    alignment: Alignment.bottomLeft,
                  ),

                 Expanded(
                  child: CustomText(
                    text:controller.productModel[index].description,
                    color: Colors.grey,
                    alignment: Alignment.bottomLeft,
                    maxLine: 1,
                  ),),

                  SizedBox(height: 10,),
                  CustomText(
                    text: controller.productModel[index].price.toString() + "  \$",
                    color: Colors.blue,
                    alignment: Alignment.bottomLeft,
                  ),

                ],
            ),),);


          },
          separatorBuilder: (context, index) => SizedBox(width: 20,),
        ),
      ),
      );

  }

}
