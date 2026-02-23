import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/product.dart';

class testScreen extends StatelessWidget {
  testScreen({super.key});

  final nameCtrl = TextEditingController();
  final descCtrl = TextEditingController();
  final priceCtrl = TextEditingController();
  // final products = Products();

  @override
  Widget build(BuildContext context) {
    // var prod = products.items;
    return Scaffold(
      appBar: AppBar(
        title: Text("MAD Shopping"),
        actions: [IconButton(onPressed:()=> showAdd(context), icon: Icon(Icons.add))],
      ),
      body: SafeArea(
        child: Consumer<Products>(
          builder: (context, prod, _) => ListView.builder(
            itemCount: prod.items.length,
            itemBuilder: (_, index) {
              var data = prod.items[index];
              return Card(child: ListTile(
                title: Text(data.name),
                trailing: IconButton(onPressed:()=> isFavorite(data.id, context), icon: data.isFave == false? Icon(Icons.favorite_outline) : Icon(Icons.favorite, color: Colors.red,)),
                ));
            },
          ),
        ),
      ),
    );
  }

  void showAdd(BuildContext ctx) {
    showDialog(
      context: ctx,
      builder: (_) {
        return AlertDialog(
          title: Text("Add Product"),
          content: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisSize: .min,
              children: [
                TextField(
                  controller: nameCtrl,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Name"),
                  ),
                ),
                TextField(
                  controller: descCtrl,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Description"),
                  ),
                ),
                TextField(
                  controller: priceCtrl,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Price"),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(onPressed: null, child: Text("Cancel")),
            ElevatedButton(onPressed: ()=>addProd(ctx), child: Text("Add")),
          ],
        );
      },
    );
  }

  void addProd(BuildContext ctx) {
    var item = Product(
      id: 10,
      name: nameCtrl.text,
      description: descCtrl.text,
      price: double.parse(priceCtrl.text),
    );
    // products.add(item);
    var prod = Provider.of<Products>(ctx, listen: false);
    prod.add(item);
    Navigator.of(ctx).pop();
  }

  void isFavorite(int id, BuildContext ctx) {
    var prod = Provider.of<Products>(ctx, listen: false);
    prod.toggleID(id);
  }
}
