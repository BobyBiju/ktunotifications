import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:ktuapiintegration/EasyJsonParse/Notifications.dart';
import 'package:ktuapiintegration/EasyJsonParse/Services.dart';

class JsonParseDemo extends StatefulWidget {

  @override
  _JsonParseDemoState createState() => _JsonParseDemoState();
}

class _JsonParseDemoState extends State<JsonParseDemo> {
  Future<Notifications> _notifications;

  @override
  void initState() {
    _notifications=Services().getNotifications();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ktu Parse Demo"),
      ),
      body: Container(
        child: FutureBuilder<Notifications>(
          future: _notifications,
          builder: (context,snapshot){
            if(snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.notifications.length,
                  itemBuilder: (context, index) {
                    var notification= snapshot.data.notifications[index];
                return ListTile(
                  title: Text(notification.title),
                  subtitle: Text(notification.description),

                );
              });
            }else{return Center(child: CircularProgressIndicator());}
          },

        ),


      ),
    );
  }
}
