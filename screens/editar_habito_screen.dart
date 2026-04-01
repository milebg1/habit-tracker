import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/habito.dart';
import '../providers/habitos_provider.dart';

class EditarHabitoScreen extends StatefulWidget{
  final Habito? habito;
  final TipoHabito tipo;

  const EditarHabitoScreen({
    super.key,
    this.habito,
    required this.tipo,
  });

  @override
  State<EditarHabitoScreen> createState() => _EditarHabitoScreenState();
} 

class _EditarHabitoScreenState extends State<EditarHabitoScreen>{
  late TextEditingController _nomeController;
  late bool _ativo;

  @override
  void initState(){
    super.initState();
    _nomeController = TextEditingController(
      text: widget.habito?.nome?? '',
    );
    _ativo= widget.habito?.ativo?? true;
  }
  @override 
  void dispose(){
    _nomeController.dispose();
    super.dispose();
  }

  void _salvar() {
    final provider = Provider.of<HabitosProvider>(context, listen: false);
    if(_nomeController.text.trim().isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Digite o nome do hábito')),
      );
      return;
    }
    if (widget.habito != null){
      provider.atualizarHabito(
        widget.habito!,
        _nomeController.text.trim(),
        _ativo,
      );
    }else{
      provider.adicionarHabito(
        _nomeController.text.trim(),
        widget.tipo,
      );
    }
    Navigator.pop(context);
  }
  void _cancelar(){
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context){
    final tituloTopo = widget.habito?.nome ?? 'Novo Hábito';
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Hábito'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              tituloTopo,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height:24),
            TextField(
              controller: _nomeController,
              decoration: const InputDecoration(
                labelText: 'Nome do hábito',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children:[
                Checkbox(
                  value: _ativo,
                  onChanged: (value) {
                    setState(() {
                      _ativo = value ?? false;
                    });
                  },
                ),
                const Text('Ativo'),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: _salvar,
                    child: const Text('Salvar'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: OutlinedButton(
                    onPressed: _cancelar,
                    child: const Text('Cancelar'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
