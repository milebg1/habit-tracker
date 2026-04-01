import 'package:flutter/material.dart';
import '../models/habito.dart';

class HabitosProvider extends ChangeNotifier{
  final List<Habito> _habitos =[
    Habito(nome: 'Beber água', ativo: true, tipo: TipoHabito.bom),
    Habito(nome: 'Exercício Físico', ativo: true, tipo: TipoHabito.bom),
    Habito(nome: 'Ler', ativo: true, tipo: TipoHabito.bom),
    Habito(nome: 'Dormir cedo', ativo: false, tipo: TipoHabito.bom),
    Habito(nome: 'Procrastinar', ativo: true, tipo: TipoHabito.ruim),
    Habito(nome: 'Dormir tarde', ativo: true, tipo: TipoHabito.ruim),
    Habito(nome: 'Mexer muito no celular', ativo: true, tipo: TipoHabito.ruim),
  ];

  List<Habito> get habitos => _habitos;
  List<Habito> getHabitosPorTipo(TipoHabito tipo){
    return _habitos.where((h) => h.tipo == tipo).toList();
  }

  int totalPorTipo(TipoHabito tipo){
    return _habitos.where((h) => h.tipo == tipo).length;
  }

  int ativosPorTipo(TipoHabito tipo){
    return _habitos.where((h)=>h.tipo == tipo && h.ativo).length;
  }

  void atualizarHabito(Habito habito, String novoNome, bool novoAtivo){
    habito.nome=novoNome;
    habito.ativo=novoAtivo;
    notifyListeners();
  }
  void adicionarHabito(String nome, TipoHabito tipo){
  _habitos.add(
    Habito(
      nome: nome,
      ativo: true,
      tipo: tipo,
    ),
  );
  notifyListeners();
}
}