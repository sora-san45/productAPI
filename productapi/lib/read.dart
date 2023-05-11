import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:productapi/services/api.dart';

import 'model/product.dart';

class ReadData extends StatelessWidget {
  const ReadData({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: FutureBuilder(
            future: Api.readProduct(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                List<Product> pData = snapshot.data;
                return ListView.builder(
                    itemCount: pData.length,
                    itemBuilder: (BuildContext context, int i) {
                      return ListTile(
                        leading: Icon(Icons.storage),
                        title: Text("${pData[i].name}"),
                        subtitle: Text("${pData[i].desc}"),
                        trailing: Text("${pData[i].price}")
                      );
                    });
              }
            }));
  }
}
