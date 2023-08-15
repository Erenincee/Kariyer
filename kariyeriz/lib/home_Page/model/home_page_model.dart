// To parse this JSON data, do
//
//     final adversModel = adversModelFromJson(jsonString);

import 'dart:convert';

Map<String, AdversModel> adversModelFromJson(String str) => Map.from(json.decode(str)).map((k, v) => MapEntry<String, AdversModel>(k, AdversModel.fromJson(v)));

String adversModelToJson(Map<String, AdversModel> data) => json.encode(Map.from(data).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())));

class AdversModel {
    String? adres;
    String? aydinlanma;
    String? calismaSekli;
    String? departman;
    String? email;
    String? iletisim;
    String? isTanimi;
    String? pozisyon;
    String? sirketAdi;

    AdversModel({
        this.adres,
        this.aydinlanma,
        this.calismaSekli,
        this.departman,
        this.email,
        this.iletisim,
        this.isTanimi,
        this.pozisyon,
        this.sirketAdi,
    });

    factory AdversModel.fromJson(Map<String, dynamic> json) => AdversModel(
        adres: json["adres"],
        aydinlanma: json["aydinlanma"],
        calismaSekli: json["calismaSekli"],
        departman: json["departman"],
        email: json["email"],
        iletisim: json["iletisim"],
        isTanimi: json["isTanimi"],
        pozisyon: json["pozisyon"],
        sirketAdi: json["sirketAdi"],
    );

    Map<String, dynamic> toJson() => {
        "adres": adres,
        "aydinlanma": aydinlanma,
        "calismaSekli": calismaSekli,
        "departman": departman,
        "email": email,
        "iletisim": iletisim,
        "isTanimi": isTanimi,
        "pozisyon": pozisyon,
        "sirketAdi": sirketAdi,
    };
}
