import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shopqua_app/core/service/database/cart_database_helper.dart';
import 'package:shopqua_app/model/cart_product_model.dart';

class CartViewModel extends GetxController {
  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);
  List<CartProductModel> _cartProductModel = [];
  List<CartProductModel> get cartProductModel => _cartProductModel;
  CartViewModel(){
    getAllProduct();
  }
  getAllProduct() async {
    _loading.value = true;

    var dbHelper = CartDatabaseHelper.db;
    _cartProductModel = await dbHelper.getAllProduct();
    print(_cartProductModel.length);
    _loading.value = false;
    update();
  }

  addProduct(CartProductModel cartProductModel) async {
    if(_cartProductModel.length == 0){
      var dbHelper = CartDatabaseHelper.db;
      await dbHelper.insert(cartProductModel);
    } else{
      for(int i = 0 ; i< _cartProductModel.length ; i++){
        if(_cartProductModel[i].productId == cartProductModel.productId){

          return;
        }else {
          var dbHelper = CartDatabaseHelper.db;
          await dbHelper.insert(cartProductModel);
        }
      }
    }


    update();
  }
}