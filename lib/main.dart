import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture_tdd/features/crud_feature/presentation/bloc/customer_bloc.dart';
import 'package:flutter_clean_architecture_tdd/features/crud_feature/presentation/pages/customer_screen.dart';
import 'package:flutter_clean_architecture_tdd/locator.dart';

void main() async {
  await setUp();
  runApp(MultiBlocProvider(
      providers: [
        BlocProvider<CustomerBloc>(create: (_) => getIt<CustomerBloc>()),
      ],
      child: MaterialApp(
        title: 'CRUD Code Test',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyApp(),
      )));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CustomerBloc>(context).add(GetAllCustomersEvent());
  }

  @override
  Widget build(BuildContext context) {
    return CustomerScreen();
  }
}
