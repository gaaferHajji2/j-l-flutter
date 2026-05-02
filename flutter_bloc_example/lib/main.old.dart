import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/add_todo_page.dart';
import 'package:flutter_bloc_example/cubit/todo_cubit.dart';
import 'package:flutter_bloc_example/todo_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // return BlocProvider(
    // return MultiBlocProvider(
    //   providers: [
    //     BlocProvider(create: (_) => CounterCubit()),
    //     BlocProvider(create: (_) => CounterBloc()),
    //   ],
    //   child: MaterialApp(
    //     title: 'Flutter Demo',
    //     debugShowCheckedModeBanner: false,
    //     theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
    //     home: const MyHomePage(title: 'Flutter Demo Home Page'),
    //   ),
    // );

    return BlocProvider(
      create: (context) => TodoCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
        initialRoute: '/',
        routes: {'/': (_) => TodoList(), '/add-todo': (_) => AddTodoPage()},
      ),
    );
  }
}
