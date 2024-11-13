import 'dart:convert';
import 'dart:ffi';

import 'package:apps/data/remote/network_calls.dart';
import 'package:apps/presentation/controlers/base_controler.dart';
import 'package:apps/utils/api_states.dart';
import 'package:apps/utils/apis.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class HomeControler extends BaseControler {
  NetWorkCalls calls = NetWorkCalls();

  RxList<String> categories = <String>[].obs;
  RxString selectedCategory = "".obs;

  getCategories() async {
    try {
      isLoading.value = true;
      var response = await calls.getApi(ApisServices.GET_CATEGORIES);
      switch (response.apiState) {
        case ApiState.LOADING:
          {
            isLoading.value = true;
          }
        case ApiState.SUCESS:
          {
            categories.addAll(List<String>.from(json.decode(response.data)));
          }

        case ApiState.NOT_INTERNET:
          {
            error.value = response.message;
          }

        case ApiState.FAILUER:
          error.value = response.message;
      }
    } catch (e) {
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    super.onInit();

    getCategories();
  }
}
