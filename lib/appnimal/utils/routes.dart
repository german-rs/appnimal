import 'package:flutter/material.dart';
import '../screens/detalle_screen.dart';
import '../models/item_model.dart';

Route createRoute(ItemModel item) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => DetalleScreen(
      title: item.title,
      imagePath: item.detailImage,
      description: item.description,
    ),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      var offsetAnimation = animation.drive(tween);

      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
  );
}
