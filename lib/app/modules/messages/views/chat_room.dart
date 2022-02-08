import 'dart:async';

import 'package:biponi_vendor/app/modules/messages/controllers/messages_controller.dart';
import 'package:biponi_vendor/app/services/auth_service.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:biponi_vendor/app/modules/messages/views/full_image.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart' show DateFormat;

final ChatsRef = FirebaseFirestore.instance.collection('ChatRooms');
final ChatsUserRef = FirebaseFirestore.instance.collection('ChatRoomUsers');

class ChatRoom extends StatefulWidget {
  final String? messaseid;
  final String? toUserId;
  final List<dynamic>? ids;
  final String? toUsername;
  final String? toUserphoto;
  final String? fromusername;
  final String? fromuserphoto;

  ChatRoom({this.messaseid, this.toUserId, this.ids, this.toUsername, this.toUserphoto, this.fromusername, this.fromuserphoto});
  @override
  _ChatRoomState createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  final TextEditingController _textMessageController = TextEditingController();
  bool _isComposing = false;

  final MessagesController _messagesController = Get.put(MessagesController());

  @override
  Widget build(BuildContext context) {
    var currentUser = Get.find<AuthService>().user;

    return Container(
      // color: Colors.white,
      child: SafeArea(
        top: false,
        child: Scaffold(
          //  backgroundColor: Colors.white,
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Get.theme.hintColor),
              onPressed: () {
                setState(() {
                  {
                    Navigator.pop(context);
                  }
                });
              },
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            title: Text(
              widget.toUsername!,
              style: TextStyle(
                color: Get.theme.accentColor,
              ),
            ),
          ),
          body: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Container(
                    child: StreamBuilder(
                        stream: ChatsRef.doc(widget.messaseid).collection("messages").orderBy("timestamp", descending: true).snapshots(),
                        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.hasData) {
                            final list = snapshot.data!.docs;
                            return ListView.builder(
                                itemCount: list.length,
                                reverse: true,
                                padding: EdgeInsets.only(top: 15),
                                itemBuilder: (BuildContext contex, int index) {
                                  if (Uri.parse(list[index]["text"]).isAbsolute) {
                                    return Padding(
                                      padding: EdgeInsets.only(
                                          left: list[index]["senderId"] == currentUser.value.vendor!.id ? 50 : 24,
                                          right: list[index]["senderId"] == currentUser.value.vendor!.id ? 24 : 50,
                                          bottom: 16),
                                      child: Column(
                                        crossAxisAlignment: list[index]["senderId"] == currentUser.value.vendor!.id ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              Get.to(ShowFullImage(list[index]["text"], list[index]["text"]), fullscreenDialog: true, transition: Transition.zoom);
                                            },
                                            child: Hero(
                                              tag: list[index]["text"],
                                              child: Container(
                                                  decoration: BoxDecoration(
                                                      color: Get.theme.focusColor.withOpacity(0.2),
                                                      borderRadius: list[index]["senderId"] == currentUser.value.vendor!.id
                                                          ? BorderRadius.only(topLeft: Radius.circular(23), topRight: Radius.circular(23), bottomLeft: Radius.circular(23))
                                                          : BorderRadius.only(topLeft: Radius.circular(23), topRight: Radius.circular(23), bottomRight: Radius.circular(23))),
                                                  //  margin: EdgeInsets.symmetric(vertical: 16),
                                                  alignment: list[index]["senderId"] == currentUser.value.vendor!.id ? Alignment.centerRight : Alignment.centerLeft,
                                                  height: 150,
                                                  width: 400,
                                                  child: Container(
                                                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                                                    child: CachedNetworkImage(
                                                      width: double.infinity,
                                                      imageUrl: list[index]["text"],
                                                      fit: BoxFit.cover,
                                                      placeholder: (context, url) => Image.asset(
                                                        'assets/images/loading.gif',
                                                        fit: BoxFit.cover,
                                                      ),
                                                      errorWidget: (context, url, error) => Icon(Icons.error),
                                                    ),
                                                  )),
                                            ),
                                          ),
                                          Text(
                                            DateFormat.jm().format(list[index]["timestamp"].toDate()) + ' ' + DateFormat.yMMMd().format(list[index]["timestamp"].toDate()),
                                            overflow: TextOverflow.fade,
                                            softWrap: false,
                                            style: Get.textTheme.caption,
                                          )
                                        ],
                                      ),
                                    );
                                  } else {
                                    return Padding(
                                      padding: EdgeInsets.only(
                                          left: list[index]["senderId"] == currentUser.value.vendor!.id ? 50 : 24,
                                          right: list[index]["senderId"] == currentUser.value.vendor!.id ? 24 : 50,
                                          bottom: 16),
                                      child: Column(
                                        crossAxisAlignment: list[index]["senderId"] == currentUser.value.vendor!.id ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context).size.width,
                                            alignment: list[index]["senderId"] == currentUser.value.vendor!.id ? Alignment.centerRight : Alignment.centerLeft,
                                            child: Container(
                                              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                                              decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                      colors: list[index]["senderId"] == currentUser.value.vendor!.id
                                                          ? [const Color(0xff007EF4), const Color(0xff2A75BC)]
                                                          : [
                                                              Get.theme.focusColor.withOpacity(0.2),
                                                              Get.theme.focusColor.withOpacity(0.2),
                                                            ]),
                                                  borderRadius: list[index]["senderId"] == currentUser.value.vendor!.id
                                                      ? BorderRadius.only(topLeft: Radius.circular(23), topRight: Radius.circular(23), bottomLeft: Radius.circular(23))
                                                      : BorderRadius.only(topLeft: Radius.circular(23), topRight: Radius.circular(23), bottomRight: Radius.circular(23))),
                                              child: Text(
                                                list[index]["text"],
                                                style: TextStyle(
                                                  color: list[index]["senderId"] == currentUser.value.vendor!.id ? Colors.white : Get.theme.textTheme.bodyText1!.color,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Text(
                                            DateFormat.jm().format(list[index]["timestamp"].toDate()) + ' ' + DateFormat.yMMMd().format(list[index]["timestamp"].toDate()),
                                            overflow: TextOverflow.fade,
                                            softWrap: false,
                                            style: Get.textTheme.caption,
                                          )
                                        ],
                                      ),
                                    );
                                  }
                                });
                          } else {
                            return Center(child: CircularProgressIndicator());
                          }
                        }),
                  ),
                ),
                _buildMessageComposer(currentUser)
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildMessageComposer(currentUser) {
    return Container(
      decoration: BoxDecoration(
        color: Get.theme.cardColor,
        boxShadow: [BoxShadow(color: Theme.of(context).hintColor.withOpacity(0.10), offset: Offset(0, -4), blurRadius: 10)],
      ),
      child: TextField(
        controller: _messagesController.chatTextController,
        style: Get.textTheme.bodyText1,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(20),
          hintText: "Type to start chat".tr,
          hintStyle: TextStyle(color: Get.theme.focusColor.withOpacity(0.8)),
          prefixIcon: Wrap(
            children: [
              SizedBox(width: 10),
              IconButton(
                padding: EdgeInsets.zero,
                onPressed: () async {
                  var imageUrl = await _messagesController.getImage(ImageSource.gallery);
                  // if (imageUrl != null && imageUrl.trim() != '') {
                  //   await _messagesController.addMessage(
                  //       _messagesController.message.value, imageUrl);
                  //
                  //
                  // }
                  if (imageUrl != null && imageUrl.trim() != '') {
                    _handleSubmitted(imageUrl, currentUser);
                  }
                  Timer(Duration(milliseconds: 100), () {
                    _messagesController.chatTextController.clear();
                  });
                },
                icon: Icon(
                  Icons.photo_outlined,
                  color: Get.theme.accentColor,
                  size: 30,
                ),
              ),
              IconButton(
                padding: EdgeInsets.zero,
                onPressed: () async {
                  var imageUrl = await _messagesController.getImage(ImageSource.camera);
                  // if (imageUrl != null && imageUrl.trim() != '') {
                  //   await _messagesController.addMessage(
                  //       _messagesController.message.value, imageUrl);
                  // }

                  if (imageUrl != null && imageUrl.trim() != '') {
                    _handleSubmitted(imageUrl, currentUser);
                  }
                  Timer(Duration(milliseconds: 100), () {
                    _messagesController.chatTextController.clear();
                  });
                },
                icon: Icon(
                  Icons.camera_alt_outlined,
                  color: Get.theme.accentColor,
                  size: 30,
                ),
              ),
            ],
          ),
          suffixIcon: IconButton(
            padding: EdgeInsetsDirectional.only(end: 20, start: 10),
            onPressed: _messagesController.chatTextController.text != null ? () => _handleSubmitted(_messagesController.chatTextController.text, currentUser) : null,

            //     () {
            //
            //   _messagesController.addMessage(_messagesController.message.value,
            //       _messagesController.chatTextController.text);
            //   Timer(Duration(milliseconds: 100), () {
            //     _messagesController.chatTextController.clear();
            //   });
            // },
            icon: Icon(
              Icons.send_outlined,
              color: Get.theme.accentColor,
              size: 30,
            ),
          ),
          border: UnderlineInputBorder(borderSide: BorderSide.none),
          enabledBorder: UnderlineInputBorder(borderSide: BorderSide.none),
          focusedBorder: UnderlineInputBorder(borderSide: BorderSide.none),
        ),
      ),
    );
  }

  void _handleSubmitted(String text, currentUser) {
    setState(() {
      _isComposing = false;
    });

    sendChatMessages(text, currentUser);
    Timer(Duration(milliseconds: 100), () {
      _messagesController.chatTextController.clear();
    });
  }

  void sendChatMessages(String text, currentUser) {
    ChatsUserRef.doc(widget.messaseid).set({
      'id': widget.messaseid,
      'senderId': currentUser.value.vendor!.id,
      'toUserId': widget.toUserId,
      'usersid': widget.ids,
      'text': text,
      'toUserphoto': widget.toUserphoto,
      'fromuserphoto': widget.fromuserphoto,
      'tousername': widget.toUsername,
      'fromusername': widget.fromusername,
      'timestamp': Timestamp.fromDate(DateTime.now())
    });

    ChatsRef.doc(widget.messaseid).collection("messages").add({
      'senderId': currentUser.value.vendor!.id,
      'sendername': currentUser.value.vendor!.name,
      'toUserId': widget.toUserId,
      'text': text,
      'imageUrl': currentUser.value.vendor!.avatar ?? '',
      'timestamp': Timestamp.fromDate(DateTime.now())
    });
  }
}
