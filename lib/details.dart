import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:test/product.dart';

class detailScreen extends StatelessWidget {
  const detailScreen({super.key, required this.prod});
  final Product prod;
  @override
  Widget build(BuildContext context) {
    final nameCtrl = TextEditingController();
    final descCtrl = TextEditingController();
    final priceCtrl = TextEditingController();
    nameCtrl.text = prod.name;
    descCtrl.text = prod.description;
    priceCtrl.text = prod.price.toString();
    return Consumer<Products>(
      child:  Padding(
          padding: .all(10),
          child: SafeArea(
            child: ListView(
              children: [
                TextField(
                  controller: nameCtrl,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Name"),
                  ),
                ),
                Gap(10),
                TextField(
                  controller: descCtrl,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Description"),
                  ),
                ),
                Gap(10),
                TextField(
                  controller: priceCtrl,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Price"),
                  ),
                ),
                Gap(10),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text("Update"),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(
          title: Text("Product Details"),
          actions: [
            IconButton(
              onPressed: () => toggleFav(prod.id, context),
              icon: Icon(
                prod.isFave == false ? Icons.favorite_outline : Icons.favorite,
                color: Colors.red,
              ),
            ),
          ],
        ),
        body: child
      ),
    );
  }

  void toggleFav(int id, BuildContext ctx) {
    var prod = Provider.of<Products>(ctx, listen: false);
    prod.toggleID(id);
  }
}
