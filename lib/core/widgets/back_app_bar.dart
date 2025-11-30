// lib/core/widgets/back_app_bar.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// BackAppBar
/// - [targetRoute] optional: when set, pressing back will `context.go(targetRoute)`
/// - otherwise, it will try Navigator.pop() and fallback to '/my-home'
class BackAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final String? targetRoute;

  const BackAppBar({super.key, required this.title, this.actions, this.targetRoute});

  void _handleBack(BuildContext context) {
    if (targetRoute != null) {
      context.go(targetRoute!);
      return;
    }

    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
      return;
    }

    // fallback
    context.go('/my-home');
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
