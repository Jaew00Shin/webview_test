import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

({bool canPop, void Function() onPop}) useCanPop() {
  final context = useContext();
  final canPop = useState(false);
  final onPop = useCallback(() {
    canPop.value = true;
    context.pop();
  });

  return (canPop: canPop.value, onPop: onPop);
}
