import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter_form/Modals/product_modal.dart';
import 'package:matcher/matcher.dart';

class details extends StatelessWidget {
   details({
    Key?key,
    required this.ProductDetails
    }): super(key: key);

  productdetails ProductDetails;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text("Product List"),
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
          ),
      ),
      body: Container(
        child: ListView(
          children: [
            ListTile(
              leading: IconButton(
                onPressed: (() {}), 
                icon: Icon(Icons.shopping_bag_outlined),
                color: Colors.deepPurple,
                ),
              title: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductDetails.istopProduct?(const Chip(
                    label: Text("Top Product"),
                    backgroundColor: Colors.deepPurple,
                    labelStyle: TextStyle(color: Colors.white)
                    )) : Text(""),
                    Text(
                      ProductDetails.productName,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18.0
                      ),
                      ),
                    Text(ProductDetails.product_details,
                    style: const TextStyle(
                        fontWeight: FontWeight.normal, fontSize: 14.0
                      ),
                    ),
                    Row(
                      children: [
                        OutlinedButton(
                          onPressed: (){}, 
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.purple
                          ),
                          child: Text(
                            ProductDetails.productSize,
                            style: const TextStyle(
                              fontSize: 14.0, fontWeight: FontWeight.bold
                            ),
                          )
                        ),
                        const SizedBox( width: 10.0,),
                        OutlinedButton(
                          onPressed: (){}, 
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.purple
                          ),
                          child: Text(
                            ProductDetails.productEnum as String,
                            style: const TextStyle(
                              fontSize: 14.0, fontWeight: FontWeight.bold
                            ),
                          )
                        ),
                      ],
                    )
                ],
              )

            )
          ],
        ),
      )
    );
  }
}