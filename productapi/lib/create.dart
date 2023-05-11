import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:productapi/services/api.dart';

class CreateData extends StatefulWidget {
  const CreateData({super.key});

  @override
  State<CreateData> createState() => _CreateDataState();
}

class _CreateDataState extends State<CreateData> {
  var nameController = TextEditingController();
  var priceController = TextEditingController();
  var descController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: "Name",
              ),
            ),
            TextField(
              controller: priceController,
              decoration: InputDecoration(
                hintText: "Price",
              ),
            ),
            TextField(
              controller: descController,
              decoration: InputDecoration(
                hintText: "Description",
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(
                onPressed: () {
                  var data = {
                    "pname": nameController.text,
                    "pprice": priceController.text,
                    "pdesc": descController.text
                  };
                  Api.addProduct(data);
                },
                child: Text("Create data"))
          ],
        ),
      ),
    );
  }
}
