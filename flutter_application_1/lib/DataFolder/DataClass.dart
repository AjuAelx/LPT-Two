class DataClass {
  // int success;
  List<DataItems> dataItems;

  DataClass({this.dataItems});

  DataClass.fromJson(Map<String, dynamic> json) {
    // this.success =
    this.dataItems = (json['data'] as List) != null
        ? (json['data'] as List).map((i) => DataItems.fromJson(i)).toList()
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['data'] = this.dataItems != null
        ? this.dataItems.map((i) => i.toJson()).toList()
        : null;
    return data;
  }
}

class DataItems {
  String image;
  String id;

  DataItems({this.image, this.id});
  DataItems.fromJson(Map<String, dynamic> json) {
    this.image = json['photo'];
    this.id = json['_id'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['photo'] = this.image;
    data['_id'] = this.id;
    return data;
  }
}
