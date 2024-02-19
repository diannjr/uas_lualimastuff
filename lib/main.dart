import 'package:lualimastuff_uas/bloc/login_bloc.dart';
import 'package:lualimastuff_uas/providers/cart.dart';
import 'package:lualimastuff_uas/providers/favorite.dart';
import 'package:lualimastuff_uas/repository/login_repository.dart';
import 'package:lualimastuff_uas/screens/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => LoginRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                LoginBloc(loginRepository: context.read<LoginRepository>())
                  ..add(const InitLogin()),
          ),
        ],
        child: MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => FavoriteProvider()),
            ChangeNotifierProvider(create: (context) => CartProvider()),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Lualimastuff',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: const WelcomeScreen(),
          ),
        ),
      ),
    );
  }
}
