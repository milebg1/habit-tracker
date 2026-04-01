enum TipoHabito { bom, ruim }

class Habito{
  String nome;
  bool ativo;
  TipoHabito tipo;

  Habito({
    required this.nome,
    required this.ativo,
    required this.tipo,
  });
}