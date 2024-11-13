import 'dart:convert';

import 'package:apps/data/remote/network_calls.dart';
import 'package:apps/domain/models/products.dart';
import 'package:apps/presentation/controlers/base_controler.dart';
import 'package:apps/utils/api_states.dart';
import 'package:get/get.dart';

import '../../utils/apis.dart';

class ProductsControler extends BaseControler {
  RxList<Products> products = RxList();
  NetWorkCalls calls = NetWorkCalls();

  getProducts(String selectedCategory) async {
    var response =
    await calls.getApi(ApisServices.GET_PRODUCTS + "/$selectedCategory");
    switch (response.apiState) {
      case ApiState.LOADING:
        {
          isLoading.value = true;
        }
      case ApiState.SUCESS:
        {
          final parsed = json.decode(response.data).cast<
              Map<String, dynamic>>();

          products(
              parsed.map<Products>((json) => Products.fromJson(json)).toList());
        }
      case ApiState.FAILUER:
        {
          error.value = response.message;
        }
      case ApiState.NOT_INTERNET:
        {
          error.value = response.message;
        }

    }
  }

}
