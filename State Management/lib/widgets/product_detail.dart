import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/all_product.dart';

class ProductDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)?.settings.arguments as String;
    final product = Provider.of<Products>(context).findById(productId);
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: Card(
        // color: Colors.green,
        child: Container(
          color: Colors.white,
          height: 4000,
          child: Column(
            children: [
              Container(
                  padding: EdgeInsets.all(10),
                  alignment: Alignment.topLeft,
                  child: Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Image.network(
                        product.UrlImg,
                        // height: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
                  )),
              Container(
                padding: EdgeInsets.all(10),
                alignment: Alignment.topLeft,
                child: Text(
                  "${product.title}",
                  style: TextStyle(
                      fontFamily: "HappyMonkey",
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                  maxLines: 1,
                  // textAlign: Alignment.topLeft,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                alignment: Alignment.topRight,
                child: Text(
                  product.price,
                  style: TextStyle(
                      fontFamily: "HappyMonkey",
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                  maxLines: 1,
                  // textAlign: Alignment.topLeft,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                alignment: Alignment.topLeft,
                child: Text("Laptop",
                    style: TextStyle(
                        fontFamily: "HappyMonkey",
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 25),
                alignment: Alignment.topLeft,
                child: Flexible(
                  child: Text(
                    "Lorem ipsum, atau ringkasnya lipsum, adalah teks standar yang ditempatkan untuk mendemostrasikan elemen grafis atau presentasi visual seperti font, tipografi, dan tata letak",
                    style: TextStyle(
                        fontFamily: "HappyMonkey",
                        color: Colors.grey,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(54, 54, 78, 1),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: IconButton(
                  icon: Icon(Icons.shopping_cart),
                  onPressed: () {},
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TextAlignt {}
