import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter_form/Modals/product_modal.dart';
import 'package:flutter_form/Widget/textFormField.dart';
import 'package:flutter_form/Widget/radioButtonField.dart';
import 'package:flutter_form/details.dart';


class form extends StatefulWidget {
  const form({super.key});

  @override
  State<form> createState() => _formState();
}

class _formState extends State<form> {

  final _formKey = GlobalKey<FormState>();

  //TextFormField Variable
  final _ProductInputController1 = TextEditingController();
  final _ProductInputController2 = TextEditingController();
  // CheckBox Variable
  bool? _checkbox_Val = false;
  ProductTypeEnum? _productTypeEnum;
  // Spinner Dropdown Variable
  final _ProductsizeList = ["Small", "Medium", "Large", "Xlarge"];
  String _SelectedValue = "Small";

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Form"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        child: ListView(
            children: [
              // Form Icon Start .....
              Row(
                children: [
                  Padding(
                      padding: EdgeInsets.only(left: 30.0, top: 10.0, bottom: 5.0,),
                      child: Container(
                        padding: EdgeInsets.all(10.0),
                        child: Image.network(
                          "https://i.ibb.co/Vjp1ntQ/bunny.png",
                          height: 30.0,
                          width: 30.0,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(width: 3.0, color: Colors.grey),
                          borderRadius: BorderRadius.circular(100)
                        ),
                      ),
                    ),
                ],
              ),
              // Form Icon End......
              // Lead Text Start....
              Padding(
                padding: const EdgeInsets.only(left: 30.0, bottom: 5.0, right: 30.0),
                child: Text(
                        "Product", 
                        style: TextStyle(
                          fontSize: 36.0, 
                          fontStyle: FontStyle.normal, 
                          fontWeight: FontWeight.w500,
                        ),
                      ),
              ),
              // Lead Text End.....
              // Title Text start....
              Padding(
                padding: const EdgeInsets.only(left: 30.0, bottom: 10.0, right: 30.0),
                child: Text(
                        "Add product details in the form below", 
                        style: TextStyle(
                          fontSize: 16.0, 
                          fontStyle: FontStyle.normal, 
                          fontWeight: FontWeight.w300,
                        ),
                      ),
              ),
              // Title Text End....
              //Key value for the form...
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    // Text Form Field Start....
                      Padding(
                        padding: const EdgeInsets.only(left: 30.0, bottom: 10.0, right: 30.0, top: 5.0),
                        child: textformfield(
                          mycontroler: _ProductInputController1,
                          labelText: "Product Name", 
                          prefixicon: Icon(Icons.accessibility_outlined), 
                          prefixcolor: Colors.deepPurple.shade300),
                          
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 30.0, top: 5.0, right: 30.0, bottom: 10.0),
                          child: textformfield(
                            mycontroler: _ProductInputController2,
                            labelText: "Product Description", 
                            prefixicon: Icon(Icons.propane_outlined), 
                            prefixcolor: Colors.deepPurple.shade300),
                          ),
                        // Text Form Field End.......
                        //CheckBox data start...
                        Padding(
                          padding: const EdgeInsets.only(left:30.0, top: 5.0, bottom: 10.0, right: 30.0),
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Padding(padding: EdgeInsets.only(right: 10.0)),
                                  Checkbox(
                                    tristate: true,
                                    activeColor: Colors.amberAccent,
                                    checkColor: Colors.white,
                                    value: _checkbox_Val, 
                                    onChanged: (val) {
                                      setState(() {
                                        _checkbox_Val = val;
                                      });
                                    }),
                                ],
                              ),
                              Column(
                                children: [
                                  Text("TOP product"),
                                ],
                              )
                            ],
                          ),
                        ),
                        //CheckBox data End...
                        // Radio Button Field Start....
                        Padding(
                          padding: EdgeInsets.only(left: 30.0, top: 5.0, right: 30.0, bottom: 10.0),
                          child: Row(
                            children: [
                                radioButtonField(
                                  title: Text('data').toString(), 
                                  value: ProductTypeEnum.Downloadable, 
                                  selectedTypeEnum: _productTypeEnum, 
                                  onChanged: (val) {
                                    setState(() {
                                      _productTypeEnum = val;
                                    });
                                  },
                                  ),
                                SizedBox(width: 5.0,),
                                radioButtonField(
                                  title: Text('data').toString(), 
                                  value: ProductTypeEnum.Deliverable, 
                                  selectedTypeEnum: _productTypeEnum, 
                                  onChanged: (val) {
                                    setState(() {
                                      _productTypeEnum = val;
                                    });
                                  },
                                  ),
                            ],
                          ),
                        ),
                        //Radio Button Field End......
                        // DropDown Spinner Start.....
                        Padding(
                          padding: EdgeInsets.only(left: 30.0, right: 30.0, top: 5.0, bottom: 10.0),
                          child: DropdownButtonFormField(
                              value: _SelectedValue,
                              items: _ProductsizeList.map((e) => DropdownMenuItem(child: Text(e),value: e,)).toList(), 
                              onChanged: (val){
                              setState(() {
                                _SelectedValue = val as String;
                              });
                            },
                            icon: const Icon(
                              Icons.arrow_drop_down_circle,
                              color: Colors.deepPurple,
                            ),
                            dropdownColor: Colors.deepPurple.shade50,
                            decoration: InputDecoration(
                              labelText: "Product Size",
                              prefixIcon: Icon(
                                Icons.accessibility_new_outlined,
                                color: Colors.deepPurple,
                              ),
                              border: UnderlineInputBorder(),
                            ),
                          ),
                        ),
                        SizedBox(height: 10.0,),
                        Padding(
                          padding: const EdgeInsets.only(left: 30.0, right: 30.0, top: 5.0, bottom: 10.0),
                          child: OutlinedButton(
                          style: OutlinedButton.styleFrom(minimumSize: const Size(200, 50)),
                          onPressed: (){
                            if(_formKey.currentState!.validate()){
                              productdetails ProductDetails = productdetails(); 
                              ProductDetails.productName = _ProductInputController1.text;
                              ProductDetails.product_details = _ProductInputController2.text;
                              ProductDetails.istopProduct = _checkbox_Val!;
                              ProductDetails.productEnum = _productTypeEnum!;
                              ProductDetails.productSize = _SelectedValue;

                              Navigator.push(context, MaterialPageRoute(builder: (context){
                                return details(ProductDetails: ProductDetails);
                              }));
                            }
                            
                          }, 
                          child: Text(
                            "Submit Form".toUpperCase(),
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          )),
                        )
                    ],
                )
              )
              
            ],
        )
      ),
    );
  }
}





