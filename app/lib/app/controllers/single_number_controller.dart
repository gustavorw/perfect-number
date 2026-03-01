import 'package:app/app/usecases/is_perfect_number.dart';
import 'package:flutter/material.dart';

class SingleNumberState {}

class SingleNumberInitial extends SingleNumberState {}

class SingleNumberLoading extends SingleNumberState {}

class SingleNumberSuccess extends SingleNumberState {
  final String number;
  final bool isPerfect;

  SingleNumberSuccess({required this.number, required this.isPerfect});
}

class SingleNumberError extends SingleNumberState {
  final String message;

  SingleNumberError(this.message);
}

class SingleNumberController extends ValueNotifier<SingleNumberState> {
  SingleNumberController(this.isPerfectNumber) : super(SingleNumberInitial());

  final IsPerfectNumber isPerfectNumber;

  Future<void> check(String number) async {
    setLoading();
    final num n = num.parse(number);
    final response = isPerfectNumber(BigInt.from(n));
    value = SingleNumberSuccess(number: number, isPerfect: response);
  }

  void setLoading() => value = SingleNumberLoading();
}
