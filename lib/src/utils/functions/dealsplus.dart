import 'package:webview_test/src/application/config/config.dart';
import 'package:webview_test/src/utils/utils.dart';

String getDpWebUrl() => getIt<String>(instanceName: dpWebUrlKey);

Uri getStoreEndUrl({required String couponUrl, int? couponId}) {
  final uri = '${getDpWebUrl()}/$couponUrl-coupons'.toUri();
  if (couponId != null) {
    uri.replace(queryParameters: {'couponId': couponId.toString()});
  }
  return uri;
}

Uri getDealEndUrl({required int dealId}) {
  final uri = '${getDpWebUrl()}/deals/$dealId'.toUri();
  return uri;
}

({
  String? couponUrl,
  int? couponId,
  int? dealId,
}) extractFromLandingUrl(Uri url) {
  if (!url.path.endsWith('landing')) {
    return (couponUrl: null, couponId: null, dealId: null);
  }

  var path = url.path.replaceAll('/landing', '');
  if (path.startsWith('/')) {
    path = path.substring(1);
  }

  if (path.endsWith('-coupons')) {
    final couponUrl = path.replaceAll('-coupons', '');
    final couponId = url.queryParameters['couponId']?.toInt();
    return (couponId: couponId, couponUrl: couponUrl, dealId: null);
  }

  if (path.split('/') case ['deals', final String deal]) {
    return (dealId: deal.toInt(), couponUrl: null, couponId: null);
  }

  return (couponUrl: null, couponId: null, dealId: null);
}
