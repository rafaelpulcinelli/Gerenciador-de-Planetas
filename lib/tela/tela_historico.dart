import 'package:flutter/material.dart';
import '../controle/controle_planeta.dart';
import '../modelo/planeta.dart';

class TelaHistorico extends StatefulWidget {
  const TelaHistorico({super.key});

  @override
  State<TelaHistorico> createState() => _TelaHistoricoState();
}

class _TelaHistoricoState extends State<TelaHistorico> {
  final ControlePlaneta _controlePlaneta = ControlePlaneta();
  List<Planeta> _historicoPlanetas = [];

  @override
  void initState() {
    super.initState();
    _carregarHistorico();
  }

  Future<void> _carregarHistorico() async {
    final planetas = await _controlePlaneta.lerHistorico();
    setState(() {
      _historicoPlanetas = planetas;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Histórico de Planetas'),
        centerTitle: true,
      ),
      body: _historicoPlanetas.isEmpty
          ? const Center(
              child: Text(
                'Nenhum registro no histórico.',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            )
          : ListView.builder(
              itemCount: _historicoPlanetas.length,
              itemBuilder: (context, index) {
                final planeta = _historicoPlanetas[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    leading: const Icon(Icons.public, color: Colors.blueGrey),
                    title: Text(
                      planeta.nome,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text('Distância: ${planeta.distancia?.toString() ?? "N/A"} km'),
                  ),
                );
              },
            ),
    );
  }
}
