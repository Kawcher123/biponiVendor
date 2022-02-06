import 'package:biponi_vendor/app/modules/add_products/widget/images.dart';
import 'package:biponi_vendor/app/modules/add_products/widget/inventory.dart';
import 'package:biponi_vendor/app/modules/add_products/widget/price.dart';
import 'package:biponi_vendor/app/modules/add_products/widget/seo.dart';
import 'package:biponi_vendor/app/modules/add_products/widget/specification.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'general.dart';
class DigitalProduct extends StatelessWidget {
  DigitalProduct({Key? key}) : super(key: key);

  final _size=Get.size;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          GestureDetector(
            onTap: ()
            {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>General()));
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: Container(
                  height: _size.width*.15,
                  width: _size.width,
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'General',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(Icons.arrow_forward),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: ()
            {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Price()));
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: Container(
                  height: _size.width*.15,
                  width: _size.width,
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Price',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(Icons.arrow_forward),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: ()
            {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Inventory()));
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: Container(
                  height: _size.width*.15,
                  width: _size.width,
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Inventory',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(Icons.arrow_forward),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: ()
            {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Images()));
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: Container(
                  height: _size.width*.15,
                  width: _size.width,
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Images',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(Icons.arrow_forward),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: ()
            {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Seo()));
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: Container(
                  height: _size.width*.15,
                  width: _size.width,
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Seo',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(Icons.arrow_forward),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: Container(

                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column (
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Sale Option',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8,),

                            DropdownSearch<String>(
                                mode: Mode.MENU,
                                showFavoriteItems: true,
                                items: [ 'Digital','Downloadable'],
                                onChanged: print,
                                selectedItem: ""),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),

    );
  }

}
