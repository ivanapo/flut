import 'package:flutter/material.dart';

class DataList {
  String? category;
  List<DataList>? subCategories;

  DataList({this.category, this.subCategories});
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expandable ListView Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ExpandableListView(),
    );
  }
}

class ExpandableListView extends StatelessWidget {
  final List<DataList> dataList = [
    DataList(
      category: 'Mobiles',
      subCategories: [
        DataList(
          category: 'BlackView',
          subCategories: [
            DataList(
              category: 'BlackView A50',
              subCategories: [],
            ),
            DataList(
              category: 'BlackView A55 Pro',
              subCategories: [],
            ),
            DataList(
              category: 'BlackView A95',
              subCategories: [],
            ),
            DataList(
              category: 'BlackView A100',
              subCategories: [],
            ),
          ],
        ),
        DataList(
          category: 'Samsung',
          subCategories: [],
        ),
        DataList(
          category: 'Apple',
          subCategories: [
            DataList(
              category: 'Apple iPhone 5',
              subCategories: [],
            ),
            DataList(
              category: 'Apple iPhone 6',
              subCategories: [],
            ),
            DataList(
              category: 'Apple iPhone 6s',
              subCategories: [],
            ),
          ],
        ),
      ],
    ),
    DataList(
      category: 'Laptops',
      subCategories: [
        DataList(
          category: 'Asus',
          subCategories: [],
        ),
        DataList(
          category: 'Dell',
          subCategories: [],
        ),
        DataList(
          category: 'HP',
          subCategories: [],
        ),
      ],
    ),
    DataList(
      category: 'Appliances',
      subCategories: [
        DataList(
          category: 'Washing Machine',
          subCategories: [],
        ),
        DataList(
          category: 'AC',
          subCategories: [],
        ),
        DataList(
          category: 'Home Appliances',
          subCategories: [
            DataList(
              category: 'Water Purifier',
              subCategories: [],
            ),
            DataList(
              category: 'Inverter',
              subCategories: [],
            ),
            DataList(
              category: 'Vacuum Cleaner',
              subCategories: [],
            ),
          ],
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expandable ListView Example'),
      ),
      body: ListView.builder(
        itemCount: dataList.length,
        itemBuilder: (BuildContext context, int index) {
          return ExpansionTile(
            title: Text(dataList[index].category!),
            children: dataList[index].subCategories!
                .map((subCategory) => ExpansionTile(
                      title: Text(subCategory.category!),
                      children: subCategory.subCategories!
                          .map((item) => ListTile(
                                title: Text(item.category!),
                              ))
                          .toList(),
                    ))
                .toList(),
          );
        },
      ),
    );
  }
}
