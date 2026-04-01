import 'package:flutter/material.dart';

class CategoriaCard extends StatelessWidget{
  final String titulo;
  final int total;
  final int ativos;
  final VoidCallback onTap;

  const CategoriaCard({
    super.key,
    required this.titulo,
    required this.total,
    required this.ativos,
    required this.onTap,
  });

@override
Widget build(BuildContext context){
  return InkWell(
    onTap: onTap,
    borderRadius: BorderRadius.circular(16),
    child: Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: const Color(0xFFEDE7F6),
        borderRadius: BorderRadius.circular(16),
        border:Border.all(color: const Color(0xFFEDE7F6)),
      ),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
          Text(
            titulo,
            style: const TextStyle(
              fontSize:20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Text('Total: $total'),
          Text('Ativos: $ativos'),
        ],
      ),
    ),
  );
}
}
