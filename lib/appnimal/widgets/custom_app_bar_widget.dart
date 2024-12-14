import 'package:flutter/material.dart';

class CustomAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  final bool mostrarIconoRetroceso;

  const CustomAppBarWidget({
    super.key,
    required this.title,
    this.mostrarIconoRetroceso = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: mostrarIconoRetroceso
          ? IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          : const Padding(
              padding: EdgeInsets.all(8.0), // Padding para el ícono de menú.
              child: Icon(Icons.menu,
                  color: Colors.white), // Ícono de color blanco.
            ),
      actions: const [
        Padding(
          padding: EdgeInsets.all(8.0), // Padding para el ícono de lupa.
          child:
              Icon(Icons.search, color: Colors.white), // Ícono de color blanco.
        ),
      ],
      backgroundColor: const Color(0xFF395253), // Color de fondo del AppBar.
      title: Text(title, style: const TextStyle(color: Colors.white)),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
