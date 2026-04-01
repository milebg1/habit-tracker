import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/habito.dart';
import '../providers/habitos_provider.dart';
import 'editar_habito_screen.dart';

class ListaHabitosScreen extends StatelessWidget{
  final String titulo;
  final TipoHabito tipo;

  const ListaHabitosScreen({
    super.key,
    required this.titulo,
    required this.tipo,
  });

  @override
  Widget build(BuildContext context){
    final provider=Provider.of<HabitosProvider>(context);
    final habitos=provider.getHabitosPorTipo(tipo);

    return Scaffold(
      appBar: AppBar(
        title: Text(titulo),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
        await Navigator.push(
        context,
        MaterialPageRoute(
        builder: (_) => EditarHabitoScreen(
          tipo: tipo,
        ),
      ),
    );
  },
  child: const Icon(Icons.add),
),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: habitos.length,
        itemBuilder: (context, index) {
          final habito = habitos[index];

          return Card(
            child: ListTile(
              title: Text(habito.nome),
              subtitle: Text(habito.ativo ? 'Ativo' : 'Inativo'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:(_) => EditarHabitoScreen(
                      habito:habito,
                      tipo:tipo,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
