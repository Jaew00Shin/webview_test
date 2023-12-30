import 'package:flutter_hooks/flutter_hooks.dart';

({
  int pageIndex,
  void Function(int) setPageIndex,
  List<String> childrenUrls,
}) useUrlOrderingWithPageIndex({
  required List<String> bodyUrls,
}) {
  final pageIndex = useState(0);
  final setPageIndex = useCallback((int index) {
    pageIndex.value = index;
  });
  final childrenUrls = useState<List<String>>([]);

  useEffect(
    () {
      final selectedUrl = bodyUrls[pageIndex.value];
      if (!childrenUrls.value.contains(selectedUrl)) {
        childrenUrls.value = [...childrenUrls.value, selectedUrl];
      } else {
        childrenUrls.value = [
          ...childrenUrls.value.where((element) => element != selectedUrl),
          selectedUrl,
        ];
      }
      return null;
    },
    [pageIndex.value],
  );

  useEffect(
    () {
      if (childrenUrls.value.length < bodyUrls.length) {
        final selectedUrl = bodyUrls
            .firstWhere((element) => !childrenUrls.value.contains(element));
        childrenUrls.value = [selectedUrl, ...childrenUrls.value];
      }
      return null;
    },
    [childrenUrls.value.length],
  );

  return (
    pageIndex: pageIndex.value,
    setPageIndex: setPageIndex,
    childrenUrls: childrenUrls.value,
  );
}
