class InventoryModel{
  static List<String> Category = [
    "DIY With BWS",
    "BWS Special",
    "Waffles",
    "Mini Pancakes",
    "Waffle Cakes",
    "Beverages",
    "Mini Waffles",
  ];
}

class SubCategory{
  String? name;
  String? items;

  SubCategory(this.name,this.items);

}

List<SubCategory> subCategory = [
  SubCategory("Double Trouble Combo of 2", "2 items",),
  SubCategory("Best Seller Combo of 3", "2 items",),
  SubCategory("Family Feast Combo of 4", "1 items",),
];

List<String> addon = [
  "Extra cream",
  "butter",
  "salt",
  "spice",
];

class Item{
  String? Name;
  String price;

  Item(this.Name,this.price);

}

List<Item> item1 = [
  Item("Triple Chocolate Waffle + Belgian Chocolate Shake", "327",),
  Item("Naked Nutella Waffle + Naked Nutella Pancake", "329",),
];

List<Item> item2 = [
  Item("Nutella Fix - Combo of 3", "548",),
  Item("Triple Batter Bliss (Combo of 3)", "450",),
];

List<Item> item3 = [
  Item("Chocomania Club - Combo of 4", "666",),
];

class AddOnCategory {
  String? name;
  String? items;
  
  AddOnCategory(this.name,this.items);
}

List<AddOnCategory> addOnCategory = [
  AddOnCategory("Category1", "2 items"),
  AddOnCategory("Category2", "2 items"),
  AddOnCategory("Category3", "2 items"),
  AddOnCategory("Category4", "2 items")
];

class AddOnItems {
  String? Name;
  String price;
  
  AddOnItems(this.Name,this.price);
}

List<AddOnItems> addOnItems = [
  AddOnItems("Bananas", "Rs. 0"),
  AddOnItems("Chocolate Sprinkles", "Rs. 9.52")
];

List<String> categories = [
  "DIY With BWS",
  "BWS Special",
  "Waffles",
  "Mini Pancakes",
  "Waffle Cakes",
  "Beverages"
];

List<String> parentCategories = [
  "Category",
  "Products",
];