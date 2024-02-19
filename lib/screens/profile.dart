import 'package:flutter/material.dart';
import 'package:lualimastuff_uas/screens/root.dart';
import 'package:lualimastuff_uas/widget/login_load.dart';

class ProfileScreen extends StatelessWidget {
  final String sessionToken;

  ProfileScreen({required this.sessionToken});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const ProjectRoot(),
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Color.fromARGB(255, 118, 36, 189),
                Color.fromARGB(255, 118, 36, 189),
              ]),
            ),
            child: Padding(
              padding: EdgeInsets.only(top: 60.0, left: 22),
              child: Text(
                'Copyright by\n221MC - STTB\nDiana Sari - 21552011445\nMustika Robiatul A - 21552011427',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 200.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                color: Colors.white,
              ),
              height: double.infinity,
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.only(left: 18.0, right: 18),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text('Session Token: $sessionToken')],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
