import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
class Price extends StatelessWidget {
  Price({Key? key}) : super(key: key);
  TextEditingController _title=TextEditingController();
  TextEditingController _weight=TextEditingController();
  TextEditingController _shortdescription=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Price',
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
        ) ,
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
                    // Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: Text(
                    //     'Price',
                    //     style: TextStyle(
                    //       fontSize: 16,
                    //       color: Colors.black,
                    //       fontWeight: FontWeight.bold,
                    //     ),
                    //   ),
                    // ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column (
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Price',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 8,),
                          TextField(
                            controller: _title,
                            keyboardType: TextInputType.text,
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
                            'Special Price',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 8,),
                          TextField(
                            controller: _weight,
                            keyboardType: TextInputType.text,
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
                            'Special Price Type',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 8,),
                          DropdownSearch<String>(
                              mode: Mode.MENU,
                              showFavoriteItems: true,
                              items: [ 'Fixed','Percent'],
                              popupItemDisabled: (String s) => s.startsWith('I'),
                              onChanged: print,
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
                            'Special Price Start',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 8,),
                          TextField(
                            controller: _shortdescription,
                            keyboardType: TextInputType.text,
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
                            'Special Price End',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 8,),
                          TextField(
                            controller: _shortdescription,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),

                            ),
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
