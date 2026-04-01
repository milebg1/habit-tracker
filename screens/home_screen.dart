import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/habito.dart';
import '../providers/habitos_provider.dart';
import '../widgets/categoria_card.dart';
import 'lista_habitos_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<HabitosProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus Hábitos'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CategoriaCard(
              titulo: 'Hábitos Ruins',
              total: provider.totalPorTipo(TipoHabito.ruim),
              ativos: provider.ativosPorTipo(TipoHabito.ruim),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const ListaHabitosScreen(
                      titulo: 'Meus Hábitos',
                      tipo: TipoHabito.ruim,
                    ),
                  ),
                );
              },
            ),
            CategoriaCard(
              titulo:'Hábitos Bons',
              total:provider.totalPorTipo(TipoHabito.bom),
              ativos:provider.ativosPorTipo(TipoHabito.bom),
              onTap:(){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:(_) => const ListaHabitosScreen(
                      titulo: 'Meus Hábitos',
                      tipo: TipoHabito.bom,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
