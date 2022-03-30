import 'package:in_app_review/in_app_review.dart';

class Review{
  static final InAppReview inAppReview = InAppReview.instance;
  static Future<void> requestReview() => inAppReview.requestReview();
  static Future<void> openStoreListing() => inAppReview.openStoreListing(
    appStoreId: '1615328521',
  );
}
