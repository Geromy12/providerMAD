import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/cart.dart';
import 'package:test/product.dart';
import 'package:test/testScreen.dart';

void main(){
  runApp(test());
}


class test extends StatelessWidget {
  const test({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=> Products()),
        ChangeNotifierProvider(create: (context) => Cart()),
      ],
      child: MaterialApp(home: testScreen()),
    );
  }
}

// class test extends StatelessWidget {
//   const test({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) => Products(),
//       child: MaterialApp(
//         home: testScreen(),
//       ),
//     );
//   }
// }