import 'dart:io';

import 'package:amazon_clone_flutter/constants/error_handling.dart';
import 'package:amazon_clone_flutter/constants/global_variables.dart';
import 'package:amazon_clone_flutter/constants/utils.dart';
import 'package:amazon_clone_flutter/models/product.dart';
import 'package:amazon_clone_flutter/providers/user_provider.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class AdminServices {
  void sellProduct({
    required BuildContext context,
    required String name,
    required String description,
    required double price,
    required double quantity,
    required String category,
    required List<File> images,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      final cloudinary = CloudinaryPublic('dsug1a9bd', 'yh7f04f2');
      List<String> imagesUrls = [];
      for (int i = 0; i < images.length; i++) {
        CloudinaryResponse res = await cloudinary.uploadFile(
          CloudinaryFile.fromFile(images[i].path, folder: name),
        );
        imagesUrls.add(res.secureUrl);
        Product product = Product(
          name: name,
          description: description,
          quantity: quantity,
          price: price,
          images: imagesUrls,
          category: category,
        );
        http.Response response = await http.post(
          Uri.parse("$uri/admin/add-product"),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
            'x-auth-token': userProvider.user.token,
          },
          body: product.toJson(),
        );
        httpErrorHandle(
            response: response,
            context: context,
            onSuccess: () {
              showSnackBar(context, "Product Added Successfully!");
              Navigator.pop(context);
            });
      }
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  // get all the products
  void getAllProducts() {}
}
