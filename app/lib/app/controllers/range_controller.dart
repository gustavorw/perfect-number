import 'package:app/app/usecases/find_perfects_in_range.dart';
import 'package:flutter/material.dart';

class RangeState {}

class RangeInitial extends RangeState {}

class RangeLoading extends RangeState {}

class RangeSuccess extends RangeState {
  final String start;
  final String end;
  final List<BigInt> perfects;

  RangeSuccess({
    required this.start,
    required this.end,
    required this.perfects,
  });
}

class RangeError extends RangeState {
  final String message;
  RangeError(this.message);
}

class RangeController extends ValueNotifier<RangeState> {
  RangeController({required this.findPerfectsInRange}) : super(RangeInitial());

  final FindPerfectsInRange findPerfectsInRange;

  void find(String start, String end) {
    setLoading();
    final sNum = num.parse(start);
    final eNum = num.parse(end);

    final s = BigInt.from(sNum);
    final e = BigInt.from(eNum);

    final perfects = findPerfectsInRange(s, e);

    value = RangeSuccess(start: start, end: end, perfects: perfects);
  }

  void setLoading() => value = RangeLoading();
}
