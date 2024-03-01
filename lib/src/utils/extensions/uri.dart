import 'package:webview_test/src/utils/functions/functions.dart';

extension UriX on Uri {
  bool get isDealsplus => Uri.parse(getDpWebUrl()).host == host;

  bool isEqual(Uri other) {
    // 스키마, 호스트, 포트를 비교
    final isSameScheme = scheme == other.scheme;
    final isSameHost = host == other.host;
    final isSamePort = hasPort ? port == other.port : !other.hasPort;

    // 경로를 정규화하여 비교
    String normalizePath(String path) {
      // 경로의 마지막에 '/'가 있으면 제거
      return path.endsWith('/') ? path.substring(0, path.length - 1) : path;
    }

    final isSamePath = normalizePath(path) == normalizePath(other.path);

    // 쿼리 파라미터 비교 (선택사항)
    final isSameQuery = query == other.query;

    // 모든 조건이 참이면 true 반환
    return isSameScheme &&
        isSameHost &&
        isSamePort &&
        isSamePath &&
        isSameQuery;
  }
}
