import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/product.dart';

class Api {
  static const baseUrl = "http://192.168.188.241/api/";
  static addProduct(Map pdata) async {
    print(pdata);
    var url = Uri.parse("${baseUrl}add_product");
    try {
      var res = await http.post(url, body: pdata);
      if (res.statusCode == 200) {
        var data = jsonDecode(res.body.toString());
        print(data);
      } else {
        print("Failed");
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static readProduct() async {
    List<Product> products = [];
    var url = Uri.parse("${baseUrl}get_product");
    try {
      final res = await http.get(url);
      if (res.statusCode == 200) {
        var data = jsonDecode(res.body.toString());
        data["products"].forEach((value) => {
              products.add(
                Product(
                    name: value['pname'],
                    price: value["pprice"],
                    desc: value["pdesc"],
                    id: value["id"].toString()),
              ),
            });
        return products;
      } else {
        return [];
      }
    } catch (e) {
      print(e.toString());
    }
  }

  static updateProduct(id, body) async {
    var url = Uri.parse("${baseUrl}update_product/$id");
    final res = await http.put(url, body: body);
    if (res.statusCode == 200) {
      print(jsonDecode(res.body));
    } else {
      print("failed to update");
    }
  }

  static deleteProduct(id) async {
    var url = Uri.parse("${baseUrl}delete_product/$id");
    final res = await http.post(url);
    if (res.statusCode == 204) {
      print(jsonDecode(res.body.toString()));
    } else {
      print("failed to delete");
    }
  }
}
