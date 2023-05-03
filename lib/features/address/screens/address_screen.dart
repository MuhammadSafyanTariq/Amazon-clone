import 'dart:io';

import 'package:amazon_clone/Commons/Widgets/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:pay/pay.dart';
import '../../../Commons/Widgets/Custom_textfeild.dart';
import '../../../constants/global_variables.dart';
import '../../../provider/user_provider.dart';

class AddressScreen extends StatefulWidget {
  static const String routeName = '/address';
  final String totalAmount;
  const AddressScreen({
    super.key,
    required this.totalAmount,
  });

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  String addressTOBeUsed = '';
  TextEditingController flatBuildingController = TextEditingController();
  TextEditingController areaController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  final _addressKey = GlobalKey<FormState>();
  List<PaymentItem> paymentItems = [];

  void payPressed(String AddressFromProvider) {
    addressTOBeUsed = '';
    bool isForm = flatBuildingController.text.isNotEmpty ||
        areaController.text.isNotEmpty ||
        pincodeController.text.isNotEmpty ||
        cityController.text.isNotEmpty;

    if (isForm) {
      if (_addressKey.currentState!.validate()) {
        addressTOBeUsed =
            '${flatBuildingController.text} ${areaController.text} ${cityController.text} - ${pincodeController.text}';
      } else {
        showSnackBar(context: context, text: 'Please enter all feilds');
        return;
        // throw Exception('Please Enter complete address');
      }
    } else if (AddressFromProvider.isNotEmpty) {
      addressTOBeUsed = AddressFromProvider;
    } else {
      showSnackBar(context: context, text: 'ERROR');
    }
    print(addressTOBeUsed);
  }

  @override
  void initState() {
    super.initState();

    paymentItems.add(
      PaymentItem(
        amount: widget.totalAmount,
        label: 'Total Amount',
        status: PaymentItemStatus.final_price,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    flatBuildingController.dispose();
    areaController.dispose();
    pincodeController.dispose();
    cityController.dispose();
  }

  void onApplepayResult(res) {}
  void onGooglepayResult(res) {}

  @override
  Widget build(BuildContext context) {
    var address = context.watch<UserProvider>().user.address;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              if (address.isNotEmpty)
                Column(
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black12,
                        ),
                      ),
                      child: Text(
                        address,
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    20.heightBox,
                    Text(
                      'OR',
                      style: TextStyle(fontSize: 18),
                    ),
                    20.heightBox,
                  ],
                ),
              Form(
                key: _addressKey,
                child: Column(
                  children: [
                    CustomTextField(
                      controller: flatBuildingController,
                      hintText: 'Flat, House Number, Building',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      controller: areaController,
                      hintText: 'Area, Streat',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      controller: pincodeController,
                      hintText: 'Pincode',
                    ),
                    CustomTextField(
                      controller: cityController,
                      hintText: 'Town/City,',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              10.heightBox,
              if (Platform.isIOS)
                ApplePayButton(
                  paymentConfigurationAsset: 'applepay.json',
                  onPaymentResult: onApplepayResult,
                  paymentItems: paymentItems,
                  width: double.infinity,
                  style: ApplePayButtonStyle.whiteOutline,
                  type: ApplePayButtonType.buy,
                  margin: const EdgeInsets.only(top: 15),
                  onPressed: () => payPressed(address),
                ),
              10.heightBox,
              GooglePayButton(
                onPressed: () => payPressed(address),
                width: double.infinity,
                paymentConfigurationAsset: 'gpay.json',
                onPaymentResult: onGooglepayResult,
                paymentItems: paymentItems,
                type: GooglePayButtonType.buy,
                margin: const EdgeInsets.only(top: 15),
                loadingIndicator: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
