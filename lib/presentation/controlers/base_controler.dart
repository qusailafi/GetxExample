import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class BaseControler extends GetxController{
  RxBool isLoading=false.obs;
  RxString msg="".obs;
  @override
  void onInit() {
     super.onInit();
    isLoading=false.obs;
    msg="".obs;
  }
}