import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/item_model.dart';

Future<List<ItemModel>> loadItems() async {
  final String response =
      await rootBundle.loadString('lib/appnimal/data/items.json');
  final data = json.decode(response) as List;
  return data.map((item) => ItemModel.fromJson(item)).toList();
}
