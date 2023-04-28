import 'dart:io';

import 'package:amazon_clone/Commons/Widgets/Custom_buttom.dart';
import 'package:amazon_clone/Commons/Widgets/Custom_textfeild.dart';
import 'package:amazon_clone/Commons/Widgets/utils.dart';
import 'package:amazon_clone/features/Admin/services/admin_services.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../constants/global_variables.dart';

class AddProductScreen extends StatefulWidget {
  static const String routeName = 'add-posts';
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  TextEditingController productNameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  List<File> images = [];
  final _addProductFormKey = GlobalKey<FormState>();
  final AdminServices adminServices = AdminServices();

  @override
  void dispose() {
    super.dispose();
    productNameController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    quantityController.dispose();
  }

  String category = 'Mobiles';
  List<String> productCategories = [
    'Mobiles',
    'Essentials',
    'Appliances',
    'Books',
    'Fashion',
  ];

  void sellProduct() {
    if (_addProductFormKey.currentState!.validate() && images.isNotEmpty) {
      adminServices.sellProduct(
        context: context,
        name: productNameController.text,
        description: descriptionController.text,
        price: double.parse(priceController.text),
        quantity: double.parse(quantityController.text),
        category: category,
        images: images,
      );
    }
  }

  void selectImages() async {
    var res = await pichImages();
    setState(() {
      images = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          title: Text(
            'Add Product',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _addProductFormKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                20.heightBox,
                images.isNotEmpty
                    ? CarouselSlider(
                        items: images.map((i) {
                          return Builder(
                            builder: (BuildContext context) => Image.file(
                              i,
                              fit: BoxFit.cover,
                              height: 200,
                            ),
                          );
                        }).toList(),
                        options: CarouselOptions(
                          viewportFraction: 1,
                          height: 200,
                        ),
                      )
                    : GestureDetector(
                        onTap: selectImages,
                        child: DottedBorder(
                          strokeCap: StrokeCap.round,
                          dashPattern: [10, 4],
                          borderType: BorderType.RRect,
                          radius: Radius.circular(10),
                          child: Container(
                            width: double.infinity,
                            height: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.folder_open,
                                  size: 40,
                                ),
                                15.heightBox,
                                'Select Product Images'
                                    .text
                                    .color(Colors.grey.shade400)
                                    .make()
                              ],
                            ),
                          ),
                        ),
                      ),
                30.heightBox,
                CustomTextField(
                  controller: productNameController,
                  hintText: 'Product Name',
                ),
                10.heightBox,
                CustomTextField(
                  controller: descriptionController,
                  hintText: 'Description',
                  maxLines: 7,
                ),
                10.heightBox,
                CustomTextField(
                  controller: priceController,
                  hintText: 'Price',
                ),
                10.heightBox,
                CustomTextField(
                  controller: quantityController,
                  hintText: 'Quantity',
                ),
                10.heightBox,
                SizedBox(
                  width: double.infinity,
                  child: DropdownButton(
                    items: productCategories.map((String items) {
                      return DropdownMenuItem(
                        child: Text(items),
                        value: items,
                      );
                    }).toList(),
                    onChanged: (String? newVal) {
                      setState(() {
                        category = newVal!;
                      });
                    },
                    value: category,
                    icon: const Icon(Icons.keyboard_arrow_down),
                  ),
                ),
                10.heightBox,
                CustomButtom(
                  text: 'Sell',
                  onTap: sellProduct,
                ),
                10.heightBox,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
