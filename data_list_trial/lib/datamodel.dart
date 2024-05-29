List<Map<String, dynamic>> dataList = [
  {
    "name": "Mobiles",
    "subMenu": [
      {
        "name": "Blackview",
        "subMenu": [
          {"name": "A50"},
          {"name": "A55 Pro"},
          {"name": "A95"},
          {"name": "A100"}
        ]
      },
      {
        "name": "Samsung",
        "subMenu": [{"name": ""}]
      },
      {
        "name": "Apple",
        "subMenu": [
          {"name": "Iphone 5"},
          {"name": "Iphone 6"},
          {"name": "Iphone 6s"},
        ]
      },
    ]
  },
  {
    "name": "Laptops",
    "subMenu": [
      {
        "name": "Asus",
        "subMenu": [
          {"name": ""}
        ]
      },
      {
        "name": "Dell",
        "subMenu": [
          {"name": ""}
        ]
      },
      {
        "name": "HP",
        "subMenu": [
          {"name": ""}
        ]
      },
    ]
  },
  {
    "name": "Appliances",
    "subMenu": [
      {
        "name": "Washing Machine",
        "subMenu": [
          {"name": ""}
        ]
      },
      {
        "name": "AC",
        "subMenu": [
          {"name": ""}
        ]
      },
      {
        "name": "Home Appliances",
        "subMenu": [
          {"name": "Water Purifier"},
          {"name": "Inverter"},
          {"name": "Vacuum Cleaner"},
        ]
      },
    ]
  }
];

class Menu {
  String name;
  List<Menu> subMenu = [];

  Menu({required this.name, required this.subMenu});

  Menu.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        subMenu = json['subMenu'] != null
            ? List<Menu>.from(json['subMenu'].map((x) => Menu.fromJson(x)))
            : [];
}
