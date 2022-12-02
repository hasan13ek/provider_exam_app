
import 'dart:convert';

List<AppModel> appModelFromJson(String str) => List<AppModel>.from(json.decode(str).map((x) => AppModel.fromJson(x)));

String appModelToJson(List<AppModel> data) => json.encode(List<AppModel>.from(data.map((x) => x.toJson())));

class AppModel {
  AppModel({
    this.id,
    this.cardType,
    this.cardNumber,
    this.bankName,
    this.moneyAmount,
    this.cardCurrency,
    this.expireDate,
    this.iconImage,
    this.colors,
    this.cardCrrency,
  });

  int? id;
  String? cardType;
  String? cardNumber;
  String? bankName;
  double? moneyAmount;
  String? cardCurrency;
  DateTime? expireDate;
  String? iconImage;
  Colors? colors;
  String? cardCrrency;

  factory AppModel.fromJson(Map<String, dynamic> json) => AppModel(
    id: json["id"],
    cardType: json["card_type"],
    cardNumber: json["card_number"],
    bankName: json["bank_name"],
    moneyAmount: json["money_amount"]??0.0,
    cardCurrency: json["card_currency"]??"Salom",
    expireDate: DateTime.parse(json["expire_date"]),
    iconImage: json["icon_image"],
    colors: Colors.fromJson(json["colors"]),
    cardCrrency: json["card_crrency"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "card_type": cardType,
    "card_number": cardNumber,
    "bank_name": bankName,
    "money_amount": moneyAmount,
    "card_currency": cardCurrency,
    "expire_date": expireDate?.toIso8601String(),
    "icon_image": iconImage,
    "colors": colors?.toJson(),
    "card_crrency": cardCrrency,
  };
}

class Colors {
  Colors({
    this.colorA,
    this.colorB,
  });

  String? colorA;
  String? colorB;

  factory Colors.fromJson(Map<String, dynamic> json) => Colors(
    colorA: json["color_a"],
    colorB: json["color_b"],
  );

  Map<String, dynamic> toJson() => {
    "color_a": colorA,
    "color_b": colorB,
  };
}
