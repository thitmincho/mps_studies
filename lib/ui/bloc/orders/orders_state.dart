import 'package:myanmar_political_studies/data/models/OrdersResponse.dart';
import 'package:meta/meta.dart';

@immutable
abstract class OrdersState {}

class InitialOrdersState extends OrdersState {}

class EmptyOrdersState extends OrdersState {}

class LoadedOrdersState extends OrdersState {
  final List<OrderBean> orders;

  LoadedOrdersState(this.orders);
}
