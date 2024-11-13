import 'package:apps/presentation/controlers/home_controler.dart';
import 'package:apps/presentation/controlers/products_controler.dart';
import 'package:apps/presentation/widgets/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    HomeControler categoriesControler = Get.find<HomeControler>();
    ProductsControler productControler = Get.put(ProductsControler());
    productControler.getProducts(categoriesControler.selectedCategory.value);
    return Scaffold(
        appBar: AppBar(
          title: Text("Products"),
        ),
        body: Container(
          child: Obx(() => ListView.builder(
                itemCount: productControler.products.length,
                itemBuilder: (BuildContext context, int index) {
                  return textWidget(
                      productControler.products[index].title, null);
                },
              )),
        ));
  }
}
