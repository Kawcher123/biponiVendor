import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowFullImage extends StatelessWidget {
  final Size _size = Get.size;
  String imageUrl;
  String tag;

  ShowFullImage(this.imageUrl, this.tag);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.back();
          },
          child: Icon(
            CupertinoIcons.clear,
            size: 30.0,
            color: Colors.white,
          ),
        ),
        body: Container(
          height: _size.height,
          width: _size.width,
          child: Hero(
            tag: tag,
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              placeholder: (context, url) => Image.asset(
                'assets/img/loading.gif',
                fit: BoxFit.cover,
              ),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
        ),
      ),
    );
  }
}
