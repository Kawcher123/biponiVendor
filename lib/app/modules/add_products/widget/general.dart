import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
class General extends StatefulWidget {
   General({Key? key}) : super(key: key);

  @override
  State<General> createState() => _GeneralState();
}

class _GeneralState extends State<General> {

  bool status = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'General',
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading:IconButton(
          onPressed: (){
            Get.back();
            },
          icon: Icon(Icons.arrow_back,color: Colors.black,),
        ),
      centerTitle: true,
    ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
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
                            'Title',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 8,),
                          TextFormField(
                            //controller: _title,
                            keyboardType: TextInputType.text,
                            validator: (input){},
                            onChanged: (input){},
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Weight',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 8,),
                          TextFormField(
                            keyboardType: TextInputType.text,
                            validator: (input){},
                            onChanged: (input){},
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Short Description',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 8,),
                          TextFormField(
                            keyboardType: TextInputType.text,
                            validator: (input){},
                            onChanged: (input){},
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          ),


                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Description',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 8,),
                          TextFormField(
                            //maxLength: 3,
                            maxLines: 3,
                            keyboardType: TextInputType.text,
                            validator: (input){},
                            onChanged: (input){},
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Brand',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 8,),
                          DropdownSearch<String>(
                              mode: Mode.MENU,
                              showFavoriteItems: true,
                              showSearchBox: true,
                              items: [ 'Walton','Yamaha', 'Minister'],
                              popupItemDisabled: (String s) => s.startsWith('I'),
                              onChanged: (input){},
                              selectedItem: ""),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Category',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 8,),
                          DropdownSearch<String>(
                              mode: Mode.MENU,
                              showFavoriteItems: true,
                              showSearchBox: true,
                              items: [ 'Primary Category','Automotive & Motorbike', 'Laptops'],
                              popupItemDisabled: (String s) => s.startsWith('I'),
                              onChanged: (input){},
                              selectedItem: ""),


                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column (
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Seller',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 8,),
                          DropdownSearch<String>(
                              mode: Mode.MENU,
                              showFavoriteItems: true,
                              showSearchBox: true,
                              items: [ 'Agora','Yamaha', 'Apex','Ryans','Startech'],
                              popupItemDisabled: (String s) => s.startsWith('I'),
                              onChanged: (input){},
                              selectedItem: ""),

                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Status',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                            ),
                          ),
                          FlutterSwitch(
                            width: 80,
                            height: 40,
                            valueFontSize: 20.0,
                            toggleSize: 45.0,
                            value: status,
                            borderRadius: 20.0,
                            padding: 8.0,
                            showOnOff: false,
                            activeColor: Colors.greenAccent,
                            onToggle: (val) {
                              setState(() {
                                status = val;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
