import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lualimastuff_uas/bloc/login_bloc.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(25),
      child: Row(
        children: [
          Icon(
            Icons.sort,
            size: 30,
            color: Color.fromARGB(255, 133, 15, 176),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 20,
            ),
            child: Text(
              'LUALIMA',
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 133, 15, 176),
              ),
            ),
          ),
          Spacer(),
          Badge(
            child: InkWell(
              onTap: () {
                context.read<LoginBloc>().add(const ProsesLogout());
              },
              child: Icon(
                Icons.logout,
                color: Color.fromARGB(255, 133, 15, 176),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
