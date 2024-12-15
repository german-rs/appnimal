import 'package:flutter/material.dart';

class CustomAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final bool mostrarIconoRetroceso;

  const CustomAppBarWidget({
    super.key,
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
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.menu, color: Colors.white),
            ),
      actions: const [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(Icons.search, color: Colors.white),
        ),
      ],
      backgroundColor: const Color(0xFF395253),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
