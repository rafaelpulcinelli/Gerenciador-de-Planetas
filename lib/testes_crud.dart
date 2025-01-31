import 'package:flutter_test/flutter_test.dart';
import 'controle/controle_planeta.dart';
import 'modelo/planeta.dart';

void main() {
  final ControlePlaneta controlePlaneta = ControlePlaneta();

  test('Deve inserir um planeta corretamente', () async {
    Planeta planeta = Planeta(nome: 'Terra', tamanho: 12742, distancia: 149600000, apelido: 'Planeta Azul');
    int id = await controlePlaneta.inserirPlaneta(planeta);
    expect(id, isNonZero);
  });

  test('Deve retornar uma lista de planetas', () async {
    List<Planeta> planetas = await controlePlaneta.lerPlanetas();
    expect(planetas, isA<List<Planeta>>());
  });

  test('Deve atualizar um planeta corretamente', () async {
    Planeta planeta = Planeta(id: 1, nome: 'Marte', tamanho: 6779, distancia: 227900000, apelido: 'Planeta Vermelho');
    int resultado = await controlePlaneta.alterarPlaneta(planeta);
    expect(resultado, greaterThan(0));
  });

  test('Deve excluir um planeta corretamente', () async {
    int resultado = await controlePlaneta.excluirPlaneta(1);
    expect(resultado, greaterThan(0));
  });
}
