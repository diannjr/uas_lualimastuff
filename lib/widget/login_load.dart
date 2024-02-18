import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lualimastuff_uas/screens/home.dart';
import 'package:lualimastuff_uas/screens/login.dart';
import 'package:lualimastuff_uas/widget/error.dart';
import '../bloc/login_bloc.dart';
import 'loading.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        if (state is LoginInitial) {
          return LoginScreen();
        } else if (state is LoginLoading) {
          return LoadingIndicator();
        } else if (state is LoginSuccess) {
          return const HomeScreen();
        } else if (state is LoginFailure) {
          return ErrorMessage(message: state.error);
        } else {
          return Container();
        }
      },
    );
  }
}
