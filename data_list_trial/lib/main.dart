import 'package:flutter/material.dart';
import 'dataModel.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Menu> data = [];

  @override
  void initState() {
    dataList.forEach((element) {
      data.add(Menu.fromJson(element));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Expandable ListView'),
        ),
        body: ListView.builder(
          itemCount: data.length,
          itemBuilder: (BuildContext context, int index) =>
              _buildList(data[index]),
        ),
      ),
    );
  }


  Widget _buildList(Menu list) {
    if (list.subMenu.isEmpty) {
      return Builder(
        builder: (context) {
          return ListTile(
            leading: SizedBox(),
            title: Text(list.name),
          );
        },
      );
    }
    return ExpansionTile(
      title: Text(
        list.name,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      children: list.subMenu.map((subMenu) => _buildList(subMenu)).toList(),
    );
  }
}
