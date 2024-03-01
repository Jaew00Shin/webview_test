import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:webview_test/src/presentation/pages/flutter_inappwebview/cubits/cubits.dart';

void useShowCurrentUrl() {
  final context = useContext();
  final currentUrl = context
      .select<InAppWebViewCubit, Uri?>((cubit) => cubit.state.currentUrl);

  useEffect(
    () {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        if (currentUrl == null) return;

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(currentUrl.toString()),
            duration: const Duration(days: 10),
          ),
        );
      });

      return null;
    },
    [currentUrl],
  );
}
