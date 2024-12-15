import 'package:flutter/material.dart';
import '../widgets/custom_app_bar_widget.dart';
import '../widgets/encabezado_widget.dart';
import '../widgets/item_widget.dart';
import '../widgets/contenedor_decorativo_widget.dart';
import '../models/item_model.dart';
import '../utils/load_items.dart' as utils;
import '../constants/color.dart';

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
    _items = utils.loadItems();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.colorFondoPrincipal,
      ),
      home: Scaffold(
        appBar: const CustomAppBarWidget(),
        body: Stack(
          children: [
            ContenedorDecorativoWidget(
              bottom: 0.0,
              left: MediaQuery.of(context).size.width * 0.1,
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.6,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const EncabezadoWidget(),
                  Expanded(
                    child: FutureBuilder<List<ItemModel>>(
                      future: _items,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          return const Center(
                              child: Text('Error al cargar los datos'));
                        } else if (!snapshot.hasData ||
                            snapshot.data!.isEmpty) {
                          return const Center(
                              child: Text('No se encontraron datos'));
                        } else {
                          final items = snapshot.data!;
                          return ListView.builder(
                            itemCount: items.length,
                            itemBuilder: (context, index) {
                              final item = items[index];
                              return ItemWidget(item: item);
                            },
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
