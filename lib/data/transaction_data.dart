import 'package:flutter/material.dart';

class TransactionModel {
  String name;
  String avatar;
  String currentBalance;
  String month;
  String changePercentageIndicator;
  String changePercentage;
  Color color;

  TransactionModel({
    required this.avatar,
    required this.changePercentage,
    required this.changePercentageIndicator,
    required this.currentBalance,
    required this.month,
    required this.name,
    required this.color,
  });
}

List<TransactionModel> myTransactions = [
  TransactionModel(
    avatar: "assets/icons/avatar1.png",
    currentBalance: "\$5482",
    changePercentage: "0.41%",
    changePercentageIndicator: "up",
    month: "Jan",
    name: "Supreme Leader",
    color:Colors.green.shade100,
  ),
  TransactionModel(
    avatar: "assets/icons/avatar2.png",
    currentBalance: "\$4252",
    changePercentageIndicator: "down",
    changePercentage: "4.54%",
    month: "Mar",
    name: "Jane Doe",
    color: Colors.orange.shade100,
  ),
  TransactionModel(
    avatar: "assets/icons/avatar3.png",
    currentBalance: "\$4052",
    changePercentage: "1.27%",
    changePercentageIndicator: "down",
    month: "Mar",
    name: "Alex Doe",
    color: Colors.red.shade100,
  ),
  TransactionModel(
    avatar: "assets/icons/avatar4.png",
    currentBalance: "\$5052",
    changePercentageIndicator: "up",
    changePercentage: "3.09%",
    month: "Mar",
    name: "Sam Doe",
    color: Colors.deepPurple.shade100,
  ),
  TransactionModel(
    avatar: "assets/icons/avatar1.png",
    currentBalance: "\$5482",
    changePercentage: "0.41%",
    changePercentageIndicator: "up",
    month: "Jan",
    name: "Supreme Leader",
    color: Colors.green.shade100,
  ),
  TransactionModel(
    avatar: "assets/icons/avatar2.png",
    currentBalance: "\$4252",
    changePercentageIndicator: "down",
    changePercentage: "4.54%",
    month: "Mar",
    name: "Jane Doe",
    color: Colors.orange.shade100,
  ),
];