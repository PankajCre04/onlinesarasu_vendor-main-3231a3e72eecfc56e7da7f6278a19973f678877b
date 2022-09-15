import 'package:sooooperbusiness/model/more/inventory/addoncategoryitemdata.dart';

class AddonCategoryData {
  AddonCategoryData(
      {this.min,
      this.max,
      this.addonItems,
      this.id,
      this.name,
      this.description,
      this.type,
      this.restaurantId,
      this.v,
      this.is_active});

  int? min;
  int? max;

  //List<String>? addonItems
  List<AddonItemData>? addonItems;
  String? id;
  String? name;
  String? description;
  String? type;
  String? restaurantId;
  int? v;
  bool? is_active;

  factory AddonCategoryData.fromJson(Map<String, dynamic> json) =>
      AddonCategoryData(
          min: json["min"],
          max: json["max"],
          addonItems: List<AddonItemData>.from(
              json["addon_items"].map((x) => AddonItemData.fromJson(x))),
          id: json["_id"],
          name: json["name"],
          description: json["description"],
          type: json["type"],
          restaurantId: json["_restaurantId"],
          v: json["__v"],
          is_active: json['is_active'] != null ? json['is_active'] : false);

  Map<String, dynamic> toJson() => {
        "min": min,
        "max": max,
        "addon_items": List<dynamic>.from(addonItems!.map((x) => x.toJson())),
        "_id": id,
        "name": name,
        "description": description,
        "type": type,
        "_restaurantId": restaurantId,
        "__v": v,
      };
}
