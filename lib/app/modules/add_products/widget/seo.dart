import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
class Seo extends StatelessWidget {
  Seo({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Seo',
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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column (
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Slug',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 8,),
                          TextField(
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                            onChanged: (input){},
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
                            'Meta Title',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 8,),
                          TextField(
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                            onChanged: (input){},
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
                            'Meta Keyword',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 8,),
                          TextField(
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                            onChanged: (input){},
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
                            'Meta Description',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 8,),
                          TextField(
                            minLines: 4,
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                            onChanged: (input){},
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
