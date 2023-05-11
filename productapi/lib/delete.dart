import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:productapi/services/api.dart';

import 'model/product.dart';

class deleteData extends StatefulWidget {
  const deleteData({super.key});

  @override
  State<deleteData> createState() => _deleteDataState();
}

class _deleteDataState extends State<deleteData> {
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
                        leading: IconButton(icon: Icon(Icons.delete),
                        onPressed: () async{
                          await Api.deleteProduct(pdata[i].id);
                          pdata.removeAt(i);
                          setState(() {});
                        },
                        ),
                        title: Text("${pdata[i].name}"),
                        subtitle: Text("${pdata[i].desc}"),
                        trailing: Text("${pdata[i].price}"),
                      );
                    });
              }
            }));
    ;
  }
}
