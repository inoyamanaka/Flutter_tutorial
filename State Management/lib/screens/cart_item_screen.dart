import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_application_1/providers/cart.dart';
import 'package:provider/provider.dart';

class CartItemScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartData = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Daftar Belanjaan",
          )),
      body: Center(
        child: Consumer<Cart>(
          builder: (context, value, child) {
            return Column(
              children: [
                Container(
                    height: 100,
                    width: 500,
                    color: Colors.green,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "\$" + value.total_harga.toString(),
                        style: TextStyle(
                          fontSize: 30,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    )),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return ListTile(
                        title:
                            Text(cartData.items.values.toList()[index].title),
                        subtitle: Text(
                            "Quantity : ${cartData.items.values.toList()[index].qty}"),
                        trailing: Text(
                            "\$ ${cartData.items.values.toList()[index].qty * cartData.items.values.toList()[index].price}"),
                      );
                    },
                    itemCount: cartData.items.length,
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
