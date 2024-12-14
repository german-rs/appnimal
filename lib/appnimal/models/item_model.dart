import 'dart:convert';
import 'package:flutter/services.dart';

class ItemModel {
  final String imagePath;
  final String title;
  final String detailImage;
  final String description;
  final String audioPath;

  ItemModel({
    required this.imagePath,
    required this.title,
    required this.detailImage,
    required this.description,
    required this.audioPath,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
      imagePath: json['imagePath'],
      title: json['title'],
      detailImage: json['detailImage'],
      description: json['description'],
      audioPath: json['audioPath'],
    );
  }
}

Future<List<ItemModel>> loadItems() async {
  final String response =
      await rootBundle.loadString('lib/appnimal/data/items.json');
  final data = json.decode(response) as List;
  return data.map((item) => ItemModel.fromJson(item)).toList();
}
