import 'package:myanmar_political_studies/data/models/AddToCartResponse.dart';
import 'package:myanmar_political_studies/data/models/OrdersResponse.dart';
import 'package:myanmar_political_studies/data/models/purchase/UserPlansResponse.dart';
import 'package:myanmar_political_studies/data/network/api_provider.dart';

abstract class PurchaseRepository {
  Future<List<UserPlansBean>> getUserPlans();

  Future<List<UserPlansBean>> getPlans();

  Future<List<OrderBean>> getOrders();

  Future<AddToCartResponse> addToCart(int courseId);

  Future usePlan(int courseId, int subscriptionId);
}

class PurchaseRepositoryImpl extends PurchaseRepository {
  final UserApiProvider _apiProvider;

  PurchaseRepositoryImpl(this._apiProvider);

  @override
  Future<List<UserPlansBean>> getUserPlans() async {
    var response = await _apiProvider.getUserPlans();
    return response.plans;
  }

  @override
  Future<List<UserPlansBean>> getPlans() async {
    var response = await _apiProvider.getPlans();
    return response.plans;
  }

  @override
  Future<List<OrderBean>> getOrders() async {
    var response = await _apiProvider.getOrders();
    return response.orders;
  }

  @override
  Future<AddToCartResponse> addToCart(int courseId) async {
    var response = await _apiProvider.addToCart(courseId);
    return response;
  }

  @override
  Future usePlan(int courseId, int subscriptionId) {
    return _apiProvider.usePlan(courseId, subscriptionId);
  }
}
