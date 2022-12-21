import 'package:flutter/material.dart';

enum ProductTypeEnum {Downloadable, Deliverable}

class radioButtonField extends StatelessWidget {
  radioButtonField({Key?key, 
    required this.title,
    required this.value,
    required this.selectedTypeEnum,
    required this.onChanged,
    }): super(key: key);

    String title;
    ProductTypeEnum value;
    ProductTypeEnum? selectedTypeEnum;
    Function(ProductTypeEnum?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Expanded(
                  child: RadioListTile(
                    value: value, 
                    contentPadding: EdgeInsets.all(0.0),
                    tileColor: Colors.deepPurple.shade50,
                    groupValue: selectedTypeEnum, 
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0) 
                      ),
                    title: Text(title),
                    dense: true,
                    onChanged: onChanged
                    ,),
                  );
  }
}