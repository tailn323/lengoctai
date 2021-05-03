import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopqua_app/constance.dart';
import 'package:shopqua_app/core/view_model/cart_viewmodel.dart';
import 'package:shopqua_app/view/widgets/custom_button.dart';
import 'package:shopqua_app/view/widgets/custom_text.dart';

class CartView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          Column(
       children: [ Expanded(
        child: GetBuilder<CartViewModel>(
          init: CartViewModel(),
        builder: (controller) => Container(

        child: ListView.separated(
            itemBuilder: (context, index) {
              return Container(
                height: 140,
                child: Row(
                  children: [
                    Container(
                    child: Image.network(
                      controller.cartProductModel[index].image,
                      fit: BoxFit.fill,
                    ),),

                    Padding(padding: const EdgeInsets.only(left: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: controller.cartProductModel[index].name,
                        ),
                        SizedBox(height: 10,),
                        CustomText(
                          color: primaryColor,
                          text: '\$ ${controller.cartProductModel[index].price.toString()}',
                        ),
                        SizedBox(height: 20,),
                        Container(width: 140, color: Colors.grey.shade200,
                          height: 40,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.add, color: Colors.black,),
                              SizedBox(width: 20,),
                              CustomText(
                                alignment:
                                Alignment.center,
                                text: '1',
                                color: Colors.black,
                              ),
                              SizedBox(width: 20,),
                              Container(
                                padding: EdgeInsets.only(bottom: 20),
                              child: Icon(Icons.minimize, color: Colors.black,),),
                            ],
                          ),
                        ),

                      ],
                    ),),

                  ],
                ),
              );
            },
          itemCount: controller.cartProductModel.length,
          separatorBuilder: (BuildContext context, int index) {
              return SizedBox(height: 10,);
          }
        ),
      ),),

    ),
         Padding(
           padding: const EdgeInsets.only(left: 30, right: 30),
         child: Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             Column(
                children: [
                   CustomText(text: 'TOTAL', fontSize: 22, color: Colors.grey,),
                  SizedBox(height: 15,),
                  CustomText(text: '\$ 20000', fontSize: 18, color: primaryColor,),
                ],
             ),
             Container(
               padding: EdgeInsets.all(20),
             height: 100,
             width: 180,
             child: CustomButton(onPress: (){}, text: 'CheckOut',),),

           ],
         ),),

       ],),);



  }
}
