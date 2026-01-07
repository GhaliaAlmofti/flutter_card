import 'dart:convert';

class WalletModel {
  int id;
  String name;
  String address;
  String phone;
  String email;
  bool isActive;
  String balance;
  String? lastTransactionAt;
  String createdAt;
  String updatedAt;

  WalletModel({
    required this.id,
    required this.name,
    required this.address,
    required this.phone,
    required this.email,
    required this.isActive,
    required this.balance,
    required this.lastTransactionAt,
    required this.createdAt,
    required this.updatedAt,
  });

  factory WalletModel.fromRawJson(String str) =>
      WalletModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory WalletModel.fromJson(Map<String, dynamic> json) => WalletModel(
    id: json["id"],
    name: json["name"],
    address: json["address"],
    phone: json["phone"],
    email: json["email"],
    isActive: json["is_active"],
    balance: json["balance"],
    lastTransactionAt: json["last_transaction_at"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "address": address,
    "phone": phone,
    "email": email,
    "is_active": isActive,
    "balance": balance,
    "last_transaction_at": lastTransactionAt,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}
