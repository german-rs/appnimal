import 'package:flutter/material.dart';
import '../widgets/custom_app_bar_widget.dart'; // Importa el CustomAppBar.
import '../widgets/encabezado_widget.dart'; // Importa el EncabezadoWidget.
import '../widgets/item_widget.dart'; // Importa el ItemWidget.
import '../models/item_model.dart'; // Importa el modelo de datos.
import '../utils/load_items.dart'
    as utils; // Importa la función para cargar los items con un prefijo.

class Appnimal extends StatefulWidget {
  const Appnimal({super.key});

  @override
  State<Appnimal> createState() => _AppnimalState();
}

class _AppnimalState extends State<Appnimal> {
  late Future<List<ItemModel>> _items;

  @override
  void initState() {
    super.initState();
    _items = utils
        .loadItems(); // Carga los items desde el archivo JSON usando el prefijo.
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor:
            const Color(0xFF395253), // Establecer el color de fondo.
      ),
      home: Scaffold(
        appBar: const CustomAppBarWidget(
          title: 'Appnimal', // Título de la aplicación.
        ), // Utiliza el CustomAppBar.
        body: Padding(
          padding: const EdgeInsets.all(
              16.0), // Añadir padding alrededor del contenido.
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const EncabezadoWidget(), // Utiliza el EncabezadoWidget.
              Expanded(
                child: FutureBuilder<List<ItemModel>>(
                  future: _items,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                          child:
                              CircularProgressIndicator()); // Muestra un indicador de carga mientras se cargan los datos.
                    } else if (snapshot.hasError) {
                      return const Center(
                          child: Text(
                              'Error al cargar los datos')); // Muestra un mensaje de error si ocurre algún problema al cargar los datos.
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Center(
                          child: Text(
                              'No se encontraron datos')); // Muestra un mensaje si no hay datos.
                    } else {
                      final items = snapshot.data!;
                      return ListView.builder(
                        itemCount: items
                            .length, // Número de veces que se repetirá la secuencia.
                        itemBuilder: (context, index) {
                          final item = items[index];
                          return ItemWidget(
                              item: item); // Utiliza el ItemWidget.
                        },
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// background: #395253
// verde oscuro: #314748
// rojo: #D3493E