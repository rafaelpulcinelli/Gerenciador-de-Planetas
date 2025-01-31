import 'package:flutter/material.dart';
import 'controle/controle_planeta.dart';
import 'modelo/planeta.dart';
import 'tela/tela_planeta.dart';
import 'tela/tela_historico.dart';
import 'tela/tela_detalhes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gerenciador de Planetas',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
            textStyle: const TextStyle(fontSize: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
          ),
        ),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ControlePlaneta _controlePlaneta = ControlePlaneta();
  List<Planeta> _planetas = [];

  @override
  void initState() {
    super.initState();
    _carregarPlanetas();
  }

  Future<void> _carregarPlanetas() async {
    final planetas = await _controlePlaneta.lerPlanetas();
    setState(() {
      _planetas = planetas;
    });
  }

  void _navegarParaTelaPlaneta({Planeta? planeta}) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TelaPlaneta(
          isIncluir: planeta == null,
          planeta: planeta ?? Planeta.vazio(),
          onFinalizado: _carregarPlanetas,
        ),
      ),
    );
  }

  void _navegarParaHistorico() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const TelaHistorico(),
      ),
    );
  }

  void _navegarParaDetalhes(Planeta planeta) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TelaDetalhes(planeta: planeta),
      ),
    );
  }

  void _confirmarExclusao(int id) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Confirmar Exclusão"),
        content: const Text("Tem certeza que deseja excluir este planeta?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text("Cancelar"),
          ),
          TextButton(
            onPressed: () async {
              await _controlePlaneta.excluirPlaneta(id);
              _carregarPlanetas();
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Planeta excluído com sucesso!")),
              );
            },
            child: const Text("Excluir", style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gerenciador de Planetas'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.history),
            onPressed: _navegarParaHistorico,
          ),
        ],
      ),
      body: _planetas.isEmpty
          ? const Center(
              child: Text(
                'Nenhum planeta cadastrado. Adicione um novo!',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            )
          : ListView.builder(
              itemCount: _planetas.length,
              itemBuilder: (context, index) {
                final planeta = _planetas[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    leading: const Icon(Icons.public, color: Colors.blue),
                    title: Text(
                      planeta.nome,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text('Apelido: ${planeta.apelido ?? "N/A"}'),
                    onTap: () => _navegarParaDetalhes(planeta),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit, color: Colors.green),
                          onPressed: () => _navegarParaTelaPlaneta(planeta: planeta),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () => _confirmarExclusao(planeta.id!),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _navegarParaTelaPlaneta(),
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
    );
  }
}
