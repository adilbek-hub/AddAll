import 'package:add_all/add/model/product_model.dart';
import 'package:add_all/add_product/add_product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  Stream<QuerySnapshot> readTodo() {
    final db = FirebaseFirestore.instance;
    return db.collection('product').snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('HomeView'),
      ),
      body: StreamBuilder(
        stream: readTodo(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child: CupertinoActivityIndicator(
              radius: 25,
            ));
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else if (snapshot.hasData) {
            final List<Product> product = snapshot.data!.docs
                .map((e) => Product.fromMap(e.data() as Map<String, dynamic>))
                .toList();
            return ListView.builder(
                itemCount: product.length,
                itemBuilder: (context, index) {
                  final products = product[index];
                  return Card(
                    child: Column(
                      children: [
                        products.image != null
                            ? SizedBox(
                                height: 200,
                                child: PageView.builder(
                                    itemCount: products.image!.length,
                                    itemBuilder: (context, index) {
                                      final images = products.image![index];
                                      return Image.network(images);
                                    }),
                              )
                            : const SizedBox(),
                        const SizedBox(height: 30),
                        ListTile(
                          title: Text(products.title),
                          leading: Text(products.description),
                          subtitle: Text(products.dateTime),
                          trailing: Text(products.address),
                        )
                      ],
                    ),
                  );
                });
          } else {
            return const Text('Белгисиз ката бар');
          }
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.pushNamed(context, 'pageView');
      }),
    );
  }
}
