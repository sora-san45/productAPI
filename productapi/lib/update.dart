import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:productapi/services/api.dart';

import 'edit.dart';
import 'model/product.dart';

class updateScreen extends StatelessWidget {
  const updateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: FutureBuilder(
            future: Api.readProduct(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return CircularProgressIndicator();
              } else {
                List<Product> pdata = snapshot.data;
                return ListView.builder(
                    itemCount: pdata.length,
                    itemBuilder: (BuildContext context, int i) {
                      return ListTile(
                        leading: Icon(Icons.edit),
                        title: Text("${pdata[i].name}"),
                        subtitle: Text("${pdata[i].desc}"),
                        trailing: Text("${pdata[i].price}"),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => editProduct(
                                        data: pdata[i],
                                      )));
                        },
                      );
                    });
              }
            }));
  }
}
