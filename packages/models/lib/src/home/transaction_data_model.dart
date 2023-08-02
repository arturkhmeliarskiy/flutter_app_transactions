import 'package:cloud_firestore/cloud_firestore.dart';

class TransactionDataModel {
  String number;
  String date;
  String amount;
  String commission;
  String type;
  String total;

  TransactionDataModel({
    required this.number,
    required this.date,
    required this.amount,
    required this.commission,
    required this.type,
    required this.total,
  });

  Map<String, dynamic> toJson() {
    return {
      'number': number,
      'date': date,
      'amount': amount,
      'commission': commission,
      'type': type,
      'total': total,
    };
  }

  factory TransactionDataModel.fromDocument(DocumentSnapshot doc) {
    String number = "";
    String date = "";
    String amount = "";
    String commission = "";
    String total = "";
    String type = "";

    try {
      number = doc.get('number');
    } catch (e) {
      number = "";
    }
    try {
      date = doc.get('date');
    } catch (e) {
      date = "";
    }
    try {
      amount = doc.get('amount');
    } catch (e) {
      amount = "";
    }
    try {
      commission = doc.get('commission');
    } catch (e) {
      commission = "";
    }
    try {
      total = doc.get('total');
    } catch (e) {
      total = "";
    }
    try {
      type = doc.get('type');
    } catch (e) {
      type = "";
    }

    return TransactionDataModel(
      number: number,
      date: date,
      amount: amount,
      commission: commission,
      total: total,
      type: type,
    );
  }
}
