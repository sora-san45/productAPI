import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:productapi/services/api.dart';

import 'model/product.dart';

class editProduct extends StatefulWidget {
  final Product data;
  const editProduct({super.key, required this.data});

  @override
  State<editProduct> createState() => _editProductState();
}

class _editProductState extends State<editProduct> {
  var nameController = TextEditingController();
  var descController = TextEditingController();
  var priceController = TextEditingController();
  @override
  void initState() {
    super.initState();
    nameController.text = widget.data.name.toString();
    descController.text = widget.data.desc.toString();
    priceController.text = widget.data.price.toString();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(children: [
          TextField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: "name",
              )),
          TextField(
              controller: priceController,
              decoration: InputDecoration(
                hintText: "price",
              )),
          TextField(
              controller: descController,
              decoration: InputDecoration(
                hintText: "desc",
              )),
          SizedBox(height: 20),
          ElevatedButton(
              onPressed: () {
                Api.updateProduct(widget.data.id, {
                  "pname": nameController.text,
                  "pprice": priceController.text,
                  "pdesc": descController.text,
                  "id": widget.data.id
                });
              },
              child: Text("Update"))
        ]),
      ),
    );
  }
}
