import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:serialization_flutter/user.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  User userObject = User('Ankit', 1234567890, 'Charkhi');
  String getjson = "{'name':'Summit','number':9876641230,'address':'Kitlana'}";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Json serialization desn'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: () {
              //Seriallization
              Map<String, dynamic> tojson=userObject.toJson();
             var json=jsonEncode(tojson);
              debugPrint(json);
              //debugPrint(json.toString());
              //debugPrint(tojson.toString());
            }, child: const Text('Seriallization')),
            const SizedBox(height: 40),
            ElevatedButton(
                onPressed: () async{
                  //Deserializations
                  var decode=jsonDecode(getjson);
                  Map<String, dynamic> mason=decode;
                  User newUser=User.fromJson(mason);
                  debugPrint(newUser.toString());

                }, child: const Text('Deseriallization')),
          ],
        ),
      ),
    );
  }
}
