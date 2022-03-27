import 'dart:convert';
import 'dart:io';

import 'package:biponi_vendor/app/providers/customExceptions.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

class APIManager {
  Future<dynamic> postAPICallWithHeader(String url, Map param, Map<String, String> headerData) async {
    print("Calling API: $url");
    print("Calling parameters: $param");

    var responseJson;
    try {
      final response = await http.post(Uri.parse(url), body: param, headers: headerData);
    print(response.body);
      responseJson = _response(response);
      print(responseJson);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> postAPICall(String url, Map param) async {
    print("Calling API: $url");
    print("Calling parameters: $param");

    var responseJson;
    try {
      final response = await http.post(Uri.parse(url), body: param);
      responseJson = _response(response);
      print(responseJson);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> multipartPostAPI(String url, Map<String, String> param, var images, Map<String, String> headerData) async {
    print("Calling API: $url");
    print("Calling parameters: $param");

    var responseJson;
    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.fields.addAll(param);

      print('fgdf');

      for (var item in images) {
        String fileName = item.path.split("/").last;
        var stream = http.ByteStream(item.openRead());

        stream.cast();

        print(stream);
        // get file length

        var length = await item.length(); //imageFile is your image file

        // multipart that takes file
        var multipartFileSign = await http.MultipartFile('files[]', stream, length, filename: fileName);

        request.files.add(await multipartFileSign);
      }

      request.headers.addAll(headerData);
      print('fngdfkngdf');
      http.StreamedResponse streamedResponse = await request.send();

      var response = await http.Response.fromStream(streamedResponse);

      print(response.statusCode);
      responseJson = _response(response);
      print(responseJson);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }


  Future<dynamic> multipartPostSignupAPI(String url, Map<String, String> param, var profile, var nidFront, var nidBack, var logo,var banner, var license, Map<String, String> headerData) async {
    print("Calling API: $url");
    print("Calling parameters: $param");

    var responseJson;
    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.fields.addAll(param);
      ///avatar
      String fileName1 = profile.path.split("/").last;
      var stream1 = http.ByteStream(profile.openRead());

      stream1.cast();

      print(stream1);
      // get file length

      var length1 = await profile.length(); //imageFile is your image file

      // multipart that takes file
      var multipartFileSign1 = await http.MultipartFile('avatar', stream1, length1, filename: fileName1);

      request.files.add(await multipartFileSign1);



      ///nid front
      String fileName2 = nidFront.path.split("/").last;
      var stream2 = http.ByteStream(nidFront.openRead());

      stream2.cast();

      print(stream2);
      // get file length

      var length2 = await nidFront.length(); //imageFile is your image file

      // multipart that takes file
      var multipartFileSign2 = await http.MultipartFile('nid_front_side', stream2, length2, filename: fileName2);

      request.files.add(await multipartFileSign2);


      ///nid back
      String fileName3 = nidBack.path.split("/").last;
      var stream3 = http.ByteStream(nidBack.openRead());

      stream3.cast();

      print(stream3);
      // get file length

      var length3 = await nidBack.length(); //imageFile is your image file

      // multipart that takes file
      var multipartFileSign3 = await http.MultipartFile('nid_back_side', stream3, length3, filename: fileName3);

      request.files.add(await multipartFileSign3);


      ///logo
      String fileName4 = logo.path.split("/").last;
      var stream4 = http.ByteStream(logo.openRead());

      stream4.cast();

      print(stream4);
      // get file length

      var length4 = await logo.length(); //imageFile is your image file

      // multipart that takes file
      var multipartFileSign4 = await http.MultipartFile('shop_logo', stream4, length4, filename: fileName4);

      request.files.add(await multipartFileSign4);


      ///banner
      String fileName5 = license.path.split("/").last;
      var stream5 = http.ByteStream(banner.openRead());

      stream5.cast();

      print(stream5);
      // get file length

      var length5 = await banner.length(); //imageFile is your image file

      // multipart that takes file
      var multipartFileSign5 = await http.MultipartFile('shop_banner', stream5, length5, filename: fileName5);

      request.files.add(await multipartFileSign5);


      ///license
      String fileName6 = license.path.split("/").last;
      var stream6 = http.ByteStream(license.openRead());

      stream6.cast();

      print(stream6);
      // get file length

      var length6 = await license.length(); //imageFile is your image file

      // multipart that takes file
      var multipartFileSign6 = await http.MultipartFile('trade_license', stream6, length6, filename: fileName6);

      request.files.add(await multipartFileSign6);



      request.headers.addAll(headerData);
      print('fngdfkngdf');
      http.StreamedResponse streamedResponse = await request.send();

      var response = await http.Response.fromStream(streamedResponse);

      print(response.statusCode);
      responseJson = _response(response);
      print(responseJson);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  ///AddProduct Api
  // Future<dynamic> multipartPostAddProductAPI(String url, Map<String, String> param, var defaultImage, var galleryImage, Map<String, String> headerData) async {
  //   print("Calling API: $url");
  //   print("Calling parameters: $param");
  //
  //   var responseJson;
  //   try {
  //     var request = http.MultipartRequest('POST', Uri.parse(url));
  //     request.fields.addAll(param);
  //
  //     ///defaultProductImage
  //     String fileName1 = defaultImage.path.split("/").last;
  //     var stream1 = http.ByteStream(defaultImage.openRead());
  //
  //     stream1.cast();
  //
  //     print(stream1);
  //     // get file length
  //
  //     var length1 = await defaultImage.length(); //imageFile is your image file
  //
  //     // multipart that takes file
  //     var multipartFileSign1 = await http.MultipartFile('default_image', stream1, length1, filename: fileName1);
  //
  //     request.files.add(await multipartFileSign1);
  //
  //     ///productImageGallery
  //     String fileName2 = galleryImage.path.split("/").last;
  //     var stream2 = http.ByteStream(galleryImage.openRead());
  //
  //     stream2.cast();
  //
  //     print(stream2);
  //     // get file length
  //
  //     var length2 = await galleryImage.length(); //imageFile is your image file
  //
  //     // multipart that takes file
  //     var multipartFileSign2 = await http.MultipartFile('gallery_images', stream2, length2, filename: fileName2);
  //
  //     request.files.add(await multipartFileSign2);
  //
  //
  //     request.headers.addAll(headerData);
  //     print('fngdfkngdf');
  //     http.StreamedResponse streamedResponse = await request.send();
  //
  //     var response = await http.Response.fromStream(streamedResponse);
  //
  //     print(response.statusCode);
  //     responseJson = _response(response);
  //     print(responseJson);
  //   } on SocketException {
  //     throw FetchDataException('No Internet connection');
  //   }
  //   return responseJson;
  // }

  Future<dynamic> get(String url) async {
    print("Calling API: $url");
    var responseJson;
    try {
      final response = await http.get(Uri.parse(url));
      print(response.body);
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> getWithHeader(String url, Map<String, String> headerData) async {
    print("Calling API: $url");
    var responseJson;
    try {
      final response = await http.get(Uri.parse(url), headers: headerData);
      print(response.body);
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  dynamic _response(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException('Error occurred while communicating with Server with StatusCode: ${response.statusCode}');
    }
  }
}
