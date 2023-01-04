import 'package:amazon_clone_flutter/common/widgets/custom_textfield.dart';
import 'package:amazon_clone_flutter/constants/global_variables.dart';
import 'package:amazon_clone_flutter/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:pay/pay.dart';

class AddressScreen extends StatefulWidget {
  static const String routeName = "/address-screen";
  final String totalAmount;
  const AddressScreen({super.key, required this.totalAmount});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController flatBuildingController = TextEditingController();
  final TextEditingController areaController = TextEditingController();
  final TextEditingController pincodeController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  List<PaymentItem> paymentItems = [];

  void onApplePayResult(res) {}
  void onGooglePayResult(res) {}

  @override
  Widget build(BuildContext context) {
    // final address = context.watch<UserProvider>().user.address;
    const address = "101 Fake Street";
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          title: const CustomText(text: "Addres Box"),
          centerTitle: true,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                if (address.isNotEmpty)
                  Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black12,
                          ),
                        ),
                        child: const CustomText(
                          text: address,
                          fontSize: 18.0,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const CustomText(
                        text: 'OR',
                        fontSize: 18.0,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                CustomTextField(
                  controller: flatBuildingController,
                  hintText: 'Flat, House No, Building',
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  controller: areaController,
                  hintText: 'Area, Street',
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  controller: pincodeController,
                  hintText: 'Pincode',
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  controller: cityController,
                  hintText: 'Town/City',
                ),
                ApplePayButton(
                  height: 50,
                  margin: const EdgeInsets.only(top: 15),
                  style: ApplePayButtonStyle.white,
                  width: double.infinity,
                  paymentConfigurationAsset: 'applepay.json',
                  onPaymentResult: onApplePayResult,
                  paymentItems: paymentItems,
                ),
                const SizedBox(
                  height: 10,
                ),
                GooglePayButton(
                  height: 50,
                  margin: const EdgeInsets.only(top: 15),
                  type: GooglePayButtonType.buy,
                  width: double.infinity,
                  paymentConfigurationAsset: 'gpay.json',
                  onPaymentResult: onGooglePayResult,
                  paymentItems: paymentItems,
                  loadingIndicator: const Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
