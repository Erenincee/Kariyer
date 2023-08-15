// To parse this JSON data, do
//
//     final adversiteModel = adversiteModelFromJson(jsonString);

import 'dart:convert';

AdversiteModel adversiteModelFromJson(String str) =>
    AdversiteModel.fromJson(json.decode(str));

String adversiteModelToJson(AdversiteModel data) => json.encode(data.toJson());

class AdversiteModel {
  String? sirketAdi;
  String? calismaSekli;
  String? pozisyon;
  String? departman;
  String? isTanimi;
  String? adres;
  String? iletisim;
  String? email;

  AdversiteModel({
    this.sirketAdi,
    this.calismaSekli,
    this.pozisyon,
    this.departman,
    this.isTanimi,
    this.adres,
    this.iletisim,
    this.email,
  });

  factory AdversiteModel.fromJson(Map<String, dynamic> json) => AdversiteModel(
        sirketAdi: json["sirketAdi"],
        calismaSekli: json["calismaSekli"],
        pozisyon: json["pozisyon"],
        departman: json["departman"],
        isTanimi: json["isTanimi"],
        adres: json["adres"],
        iletisim: json["iletisim"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "sirketAdi": sirketAdi,
        "calismaSekli": calismaSekli,
        "pozisyon": pozisyon,
        "departman": departman,
        "isTanimi": isTanimi,
        "adres": adres,
        "iletisim": iletisim,
        "email": email,
      };
}
