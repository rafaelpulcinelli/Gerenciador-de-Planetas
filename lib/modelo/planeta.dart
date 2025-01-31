import 'package:flutter/material.dart';

class Planeta {
  int? id;
  String nome;
  double? tamanho;
  double? distancia;
  String? apelido;

  // Construtor principal
  Planeta({
    this.id,
    required this.nome,
    this.tamanho,
    this.distancia,
    this.apelido,
  });

  // Construtor vazio para inicialização padrão
  Planeta.vazio()
      : id = null,
        nome = '',
        tamanho = 0,
        distancia = 0,
        apelido = '';

  // Criar a partir de um Map
  factory Planeta.fromMap(Map<String, dynamic> map) {
    return Planeta(
      id: map['id'] as int?,
      nome: map['nome'] as String,
      tamanho: (map['tamanho'] as num?)?.toDouble(),
      distancia: (map['distancia'] as num?)?.toDouble(),
      apelido: map['apelido'] as String?,
    );
  }

  // Converter para Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'tamanho': tamanho ?? 0.0,
      'distancia': distancia ?? 0.0,
      'apelido': apelido ?? '',
    };
  }

  // Método para exibição amigável do planeta
  @override
  String toString() {
    return 'Planeta(id: $id, nome: $nome, tamanho: ${tamanho ?? "N/A"}, distancia: ${distancia ?? "N/A"}, apelido: $apelido)';
  }
}
