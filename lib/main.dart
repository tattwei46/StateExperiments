import 'package:flutter/material.dart';
import 'package:inherited/class1.dart';
import 'package:inherited/class2.dart';
import 'package:inherited/count_bloc_provider.dart';
import 'package:inherited/counter_block.dart';
import 'package:inherited/counter_model.dart';
import 'package:inherited/mycounter.dart';
import 'package:random_pk/random_pk.dart';
import 'package:scoped_model/scoped_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage();

  @override
  HomePageState createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var myCounter = new MyCounter(0);
    CounterBloc bloc = CounterBloc();
    return CountBlocProvider(
      bloc: bloc,
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              "Default",
            ),
          ),
          body: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Class1(),
              Class2(),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
              ),
              RandomContainer(
                changeOnRedraw: false,
                height: 100.0,
                width: 100.0,
              ),
            ],
          )),
          floatingActionButton: FloatingActionButton(
            child: RandomContainer(
              child: Icon(Icons.add),
            ),
            onPressed: () {
              bloc.add.add(myCounter);
            },
          )),
    );
  }
}
