

import 'dart:convert';

CategoryModel categoryModelFromJson(String str) => CategoryModel.fromJson(json.decode(str));



class CategoryModel {
   CategoryModel({
        required this.categories,
    });

    List<Category> categories;

   

    factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        categories: List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
    );

   
}

class Category {
    String name;
   
    List<String> subcategory;

    Category({
        required this.name,
       
        required this.subcategory,
    });

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        name: json["name"],
        subcategory: List<String>.from(json["subcateory"].map((x) => x)),
        
    );

   
}
