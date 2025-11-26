// lib/core/widgets/back_app_bar.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// BackAppBar
/// - `targetRoute` optional: when set, pressing back will `context.go(targetRoute)`
/// - if null, fallbackRoute (default '/my-home') will be used
class BackAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final String? targetRoute;
  final bool usePopFirst;

  /// [targetRoute] — optional route path to navigate to when back pressed.
  /// [usePopFirst] — if true, try Navigator.pop() first (default true).
  const BackAppBar({
    super.key,
    required this.title,
    this.actions,
    this.targetRoute,
    this.usePopFirst = true,
  });

  void _handleBack(BuildContext context) {
    // 1) if requested, try pop()
    if (usePopFirst) {
      try {
        if (Navigator.of(context).canPop()) {
          Navigator.of(context).pop();
          return;
        }
      } catch (_) {}
    }

    // 2) If targetRoute provided, go there
    final route = targetRoute ?? '/my-home';
    try {
      context.go(route);
      return;
    } catch (e) {
      // fallback: try pushReplacement to root
      try {
        Navigator.of(context).pushReplacementNamed('/');
      } catch (_) {}
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new),
        onPressed: () => _handleBack(context),
      ),
      title: Text(title),
      centerTitle: true,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
