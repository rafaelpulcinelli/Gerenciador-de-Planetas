import 'package:flutter/material.dart';
import '../modelo/planeta.dart';

class TelaDetalhes extends StatelessWidget {
  final Planeta planeta;

  const TelaDetalhes({super.key, required this.planeta});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes de ${planeta.nome}'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nome: ${planeta.nome}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'Apelido: ${planeta.apelido?.isNotEmpty == true ? planeta.apelido : "N/A"}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              'Tamanho: ${planeta.tamanho != null ? planeta.tamanho.toString() + " km" : "N/A"}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              'Distância do Sol: ${planeta.distancia != null ? planeta.distancia.toString() + " km" : "N/A"}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Voltar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
