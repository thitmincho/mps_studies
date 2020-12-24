import 'package:inject/inject.dart';
import 'package:myanmar_political_studies/data/models/ReviewAddResponse.dart';
import 'package:myanmar_political_studies/data/models/ReviewResponse.dart';
import 'package:myanmar_political_studies/data/network/api_provider.dart';

abstract class ReviewRepository {
  Future<ReviewResponse> getReviews(int id);
  Future<ReviewAddResponse> addReview(int id, int mark, String review);
}

@provide
class ReviewRepositoryImpl extends ReviewRepository {
  final UserApiProvider apiProvider;

  ReviewRepositoryImpl(this.apiProvider);

  @override
  Future<ReviewResponse> getReviews(int id) {
    return apiProvider.getReviews(id);
  }

  @override
  Future<ReviewAddResponse> addReview(int id, int mark, String review) {
    return apiProvider.addReviews(id, mark, review);
  }
}
