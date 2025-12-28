part of 'counter_cubit.dart';

@immutable
sealed class CounterState {}

final class CounterInitial extends CounterState {}
final class CounterIncrement extends CounterState{}
final class CounterDecrement extends CounterState{}
final class CounterReset extends CounterState{}
