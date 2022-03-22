import 'dart:convert';

EffectsModel effectsModelFromMap(String str) => EffectsModel.fromMap(json.decode(str));

String effectsModelToMap(EffectsModel data) => json.encode(data.toMap());

class EffectsModel {
  EffectsModel({
    required this.descricao,
    required this.id,
    required this.nome,
  });

  final String? descricao;
  final int? id;
  final String? nome;

  factory EffectsModel.fromMap(Map<String, dynamic> json) => EffectsModel(
    descricao: json["descricao"],
    id: json["id"],
    nome: json["nome"],
  );

  Map<String, dynamic> toMap() => {
    "descricao": descricao,
    "id": id,
    "nome": nome,
  };
}
