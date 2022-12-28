import 'package:amazon_clone_flutter/constants/loader.dart';
import 'package:amazon_clone_flutter/features/account/widgets/single_product.dart';
import 'package:amazon_clone_flutter/features/admin/screens/add_product_screen.dart';
import 'package:amazon_clone_flutter/features/admin/services/admin_services.dart';
import 'package:amazon_clone_flutter/models/product.dart';
import 'package:amazon_clone_flutter/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class ProductssScreen extends StatefulWidget {
  const ProductssScreen({super.key});

  @override
  State<ProductssScreen> createState() => _ProductssScreenState();
}

class _ProductssScreenState extends State<ProductssScreen> {
  List<Product>? products;
  final AdminServices adminServices = AdminServices();
  @override
  void initState() {
    fetchAllProducts();
    super.initState();
  }

  fetchAllProducts() async {
    products = await adminServices.fetchAllProducts(context);
    setState(() {});
  }

  void deleteProduct(Product product, int index) {
    adminServices.deleteProduct(
        context: context,
        product: product,
        onSuccess: (() {
          products!.removeAt(index);
          setState(() {});
        }));
  }

  void navigateToAddProduct() {
    Navigator.pushNamed(context, AddProductScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return products == null
        ? const Loader()
        : Scaffold(
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            body: GridView.builder(
                itemCount: products!.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemBuilder: ((context, index) {
                  final productData = products![index];
                  return Column(
                    children: [
                      SizedBox(
                        height: 140,
                        child: SingleProduct(
                          image: productData.images[0],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: CustomText(
                              text: productData.name,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                          ),
                          IconButton(
                              onPressed: () =>
                                  deleteProduct(productData, index),
                              icon: const Icon(Icons.delete))
                        ],
                      )
                    ],
                  );
                })),
            floatingActionButton: FloatingActionButton(
              backgroundColor: const Color.fromARGB(255, 29, 201, 192),
              onPressed: navigateToAddProduct,
              tooltip: "Add Products",
              child: const Icon(Icons.add),
            ),
          );
  }
}
