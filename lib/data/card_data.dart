import 'package:flutter/material.dart';
import "package:cardpage/constants/color_constants.dart";

class CardModel {
  String cardHolderName;
  String cardNumber;
  String expDate;
  String cvv;
  Color cardColor;

  CardModel({
    required this.cardHolderName,
    required this.cardNumber,
    required this.cvv,
    required this.expDate,
    required this.cardColor,
  });
}

List<CardModel> myCards = [
  CardModel(
    cardHolderName: "John Doe",
    cardNumber: "****  ****  ****  1234",
    cvv: "**4",
    expDate: "12/21",
    cardColor: kPrimaryColor,
  ),
  CardModel(
    cardHolderName: "John Doe",
    cardNumber: "****  ****  ****  4321",
    cvv: "**1",
    expDate: "01/22",
    cardColor: kSecondaryColor,
  ),
];