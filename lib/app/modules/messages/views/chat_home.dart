import 'package:biponi_vendor/app/commons/common_widgets.dart';
import 'package:biponi_vendor/app/modules/messages/controllers/messages_controller.dart';
import 'package:biponi_vendor/app/modules/messages/views/chat_room.dart';
import 'package:biponi_vendor/app/services/auth_service.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'package:timeago/timeago.dart' as timeago;

final DateTime timestamp = DateTime.now();
final ChatsRef = FirebaseFirestore.instance.collection('ChatRooms');
final ChatsUserRef = FirebaseFirestore.instance.collection('ChatRoomUsers');

class MessagesView extends GetView<MessagesController> {
  @override
  Widget build(BuildContext context) {
    var currentUser = Get.find<AuthService>().user;

    return Scaffold(
      appBar: CommonWidgets.defaultAppBar(context),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                  height: MediaQuery.of(context).size.height,
                  child: StreamBuilder(
                      stream: ChatsUserRef.orderBy("timestamp", descending: true).snapshots(),
                      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasError) {
                          return Text("No Message Found!");
                        }
                        if (snapshot.hasData) {
                          final list = snapshot.data!.docs;
                          return ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: list.length,
                              itemBuilder: (BuildContext context, int index) {
                                if (list[index]["usersid"].contains(currentUser.value.vendor!.id.toString())) {
                                  return Padding(
                                    padding: const EdgeInsets.only(left: 8.0, right: 8),
                                    child: Container(
                                      height: 80.0,
                                      width: MediaQuery.of(context).size.width,

                                      // margin: EdgeInsets.all(10.0),
                                      //color: Colors.white,
                                      child: GestureDetector(
                                        onTap: () {
                                          if (list[index]["toUserId"] == currentUser.value.vendor!.id) {
                                            Get.to(ChatRoom(
                                              messaseid: list[index]["id"],
                                              toUserId: list[index]["senderId"],
                                              ids: gettotalTripmembersId(list[index]["usersid"]),
                                              toUsername: list[index]["fromusername"],
                                              toUserphoto: list[index]["fromuserphoto"],
                                              fromusername: list[index]["tousername"],
                                              fromuserphoto: list[index]["toUserphoto"],
                                            ));
                                          } else {
                                            Get.to(ChatRoom(
                                              messaseid: list[index]["id"],
                                              toUserId: list[index]["toUserId"],
                                              ids: gettotalTripmembersId(list[index]["usersid"]),
                                              toUsername: list[index]["tousername"],
                                              toUserphoto: list[index]["toUserphoto"],
                                              fromusername: list[index]["fromusername"],
                                              fromuserphoto: list[index]["fromuserphoto"],
                                            ));
                                          }
                                        },

                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: ListTile(
                                            leading: Container(
                                              height: Get.size.width * .15,
                                              width: Get.size.width * .15,
                                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.circular(50),
                                                child: list[index]["senderId"] == currentUser.value.vendor!.id
                                                    ? CachedNetworkImage(
                                                        imageUrl: list[index]["toUserphoto"],
                                                        placeholder: (context, url) => Padding(
                                                          padding: const EdgeInsets.all(5.0),
                                                          child: Image(
                                                            image: AssetImage('assets/images/user.png'),
                                                          ),
                                                        ),
                                                        errorWidget: (context, url, error) => Padding(
                                                          padding: const EdgeInsets.all(5.0),
                                                          child: Image(
                                                            image: AssetImage('assets/images/user.png'),
                                                          ),
                                                        ),
                                                      )
                                                    : CachedNetworkImage(
                                                        imageUrl: list[index]["fromuserphoto"],
                                                        placeholder: (context, url) => Padding(
                                                          padding: const EdgeInsets.all(5.0),
                                                          child: Image(
                                                            image: AssetImage('assets/images/user.png'),
                                                          ),
                                                        ),
                                                        errorWidget: (context, url, error) => Padding(
                                                          padding: const EdgeInsets.all(5.0),
                                                          child: Image(
                                                            image: AssetImage('assets/images/user.png'),
                                                          ),
                                                        ),
                                                      ),
                                              ),
                                            ),
                                            title: Text(
                                              list[index]["senderId"] == currentUser.value.vendor!.id ? list[index]["tousername"] : list[index]["fromusername"],
                                              style: TextStyle(color: Get.theme.textTheme.bodyText1!.color, fontWeight: FontWeight.bold),
                                            ),
                                            subtitle: Uri.parse(list[index]["text"]).isAbsolute
                                                ? Text(
                                                    list[index]["senderId"] == currentUser.value.vendor!.id ? "You: " + "Photo" : "Photo",
                                                    style: Get.textTheme.bodyText1,
                                                  )
                                                : Text(
                                                    list[index]["senderId"] == currentUser.value.vendor!.id
                                                        ? list[index]["text"].toString().length > 15
                                                            ? "You: " + list[index]["text"].toString().substring(0, 10) + "..."
                                                            : "You: " + list[index]["text"].toString()
                                                        : list[index]["text"].toString().length > 15
                                                            ? list[index]["text"].toString().substring(0, 10) + "..."
                                                            : list[index]["text"].toString(),
                                                    style: Get.textTheme.bodyText1,
                                                  ),
                                            trailing: Column(
                                              crossAxisAlignment: CrossAxisAlignment.end,
                                              children: [
                                                Text(
                                                  timeago.format(list[index]["timestamp"].toDate()),
                                                  style: TextStyle(color: Get.theme.hintColor, fontWeight: FontWeight.normal),
                                                ),
                                                // Container(
                                                //   height: 16,
                                                //   width: 16,
                                                //   decoration: BoxDecoration(
                                                //     color: Color(0xFFFF4848),
                                                //     shape: BoxShape.circle,
                                                //     border: Border.all(width: 1.5, color: Colors.white),
                                                //   ),
                                                //   child: Center(
                                                //     child: Text(
                                                //       "3",
                                                //       style: TextStyle(
                                                //         fontSize: 10,
                                                //         height: 1,
                                                //         fontWeight: FontWeight.w600,
                                                //         color: Colors.white,
                                                //       ),
                                                //     ),
                                                //   ),
                                                // ),
                                              ],
                                            ),
                                          ),
                                        ),

                                        // child: ListTile(
                                        //   leading: list[index]["toUserphoto"] != null
                                        //       ? Container(
                                        //           width: 60,
                                        //           height: 70,
                                        //           child: CircleAvatar(
                                        //             radius: 60,
                                        //             backgroundImage: list[index]["senderId"] == currentUser.value.vendor!.id
                                        //                 ? CachedNetworkImageProvider(list[index]["toUserphoto"])
                                        //                 : CachedNetworkImageProvider(list[index]["fromuserphoto"]),
                                        //             backgroundColor: Colors.grey,
                                        //           ),
                                        //         )
                                        //       : Wrap(),
                                        //   title: Text(
                                        //     list[index]["senderId"] == currentUser.value.vendor!.id ? list[index]["tousername"] : list[index]["fromusername"],
                                        //     style: Get.textTheme.bodyText1,
                                        //   ),
                                        //   subtitle: Row(
                                        //     crossAxisAlignment: CrossAxisAlignment.start,
                                        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        //     children: <Widget>[
                                        //       Uri.parse(list[index]["text"]).isAbsolute
                                        //           ? Text(
                                        //               list[index]["senderId"] == currentUser.value.vendor!.id ? "You: " + "Photo" : "Photo",
                                        //               style: Get.textTheme.bodyText1,
                                        //             )
                                        //           : Text(
                                        //               list[index]["senderId"] == currentUser.value.vendor!.id
                                        //                   ? list[index]["text"].toString().length > 15
                                        //                       ? "You: " + list[index]["text"].toString().substring(0, 10) + "..."
                                        //                       : "You: " + list[index]["text"].toString()
                                        //                   : list[index]["text"].toString().length > 15
                                        //                       ? list[index]["text"].toString().substring(0, 10) + "..."
                                        //                       : list[index]["text"].toString(),
                                        //               style: Get.textTheme.bodyText1,
                                        //             ),
                                        //       Padding(
                                        //         padding: const EdgeInsets.only(left: 8.0, right: 8),
                                        //         child: Text(
                                        //           timeago.format(list[index]["timestamp"].toDate()),
                                        //           overflow: TextOverflow.ellipsis,
                                        //           style: Get.textTheme.bodyText1,
                                        //         ),
                                        //       ),
                                        //     ],
                                        //   ),
                                        // ),
                                      ),
                                    ),
                                  );
                                } else {
                                  return Wrap();
                                }
                              });
                        } else {
                          return Center(child: CircularProgressIndicator());
                        }
                      })),
            ),
          ],
        ),
      ),
    );
  }

  gettotalTripmembersId(List<dynamic> trip) {
    List<dynamic> userid = [];
//print(count);
    if (trip.isNotEmpty) {
      // print(tripmember[currentUserId]["id"]);
      userid = trip;
    }

    return userid;
  }
}
