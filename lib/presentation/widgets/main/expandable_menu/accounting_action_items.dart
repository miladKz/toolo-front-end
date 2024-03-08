import 'package:flutter/material.dart';
import 'package:toolo_gostar/main.dart';

List<Widget> accountingActionsItem(double maxWith) {
  double objectCount = 7 + 1;
  double objectWith = (maxWith / objectCount) - 5;

  return [
    object(
        objectWith: objectWith,
        caption: localization.newAccount,
        color: const Color(0xFF198754),
        backgroundColor: const Color(0xFFD1E7DD),
        icon: Icons.control_point_rounded),
    object(
        objectWith: objectWith,
        caption: '${localization.remove} ${localization.removeShortcut}',
        color: const Color(0xFF198754),
        backgroundColor: const Color(0xFFF8D7DA),
        icon: Icons.delete_outline),
    object(
        objectWith: objectWith,
        caption: localization.edit,
        color: const Color(0xFF6610f2),
        backgroundColor: const Color(0xFFE9DCFF),
        icon: Icons.mode_outlined),
    object(
        objectWith: objectWith,
        caption: localization.send,
        color: const Color(0xFFfd7e14),
        backgroundColor: const Color(0xFFFFE5D0),
        icon: Icons.send_outlined),
    object(
        objectWith: objectWith,
        caption: localization.reset,
        color: const Color(0xFF6c3483),
        backgroundColor: const Color(0xFFEFE0F5),
        icon: Icons.rotate_90_degrees_cw_outlined),
    object(
        objectWith: objectWith,
        caption: localization.print,
        color: const Color(0xFFb02a37),
        backgroundColor: const Color(0xFFF7D6E6),
        icon: Icons.print_outlined),
    object(
        objectWith: objectWith,
        caption: localization.deactivate,
        color: const Color(0xFF6c757d),
        backgroundColor: const Color(0xFFDEE2E6),
        icon: Icons.toggle_off_outlined),
  ];
}

Widget object(
    {required double objectWith,
    required String caption,
    required Color color,
    required Color backgroundColor,
    required IconData icon}) {
  return Container(
    constraints: BoxConstraints(minWidth: objectWith),
    child: TextButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      ),
      onPressed: () {},
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: color,
              size: 16,
            ),
            const SizedBox(
              width: 4,
            ),
            Text(
              caption,
              style: TextStyle(
                  color: color, fontWeight: FontWeight.bold, fontSize: 12),
            ),
          ],
        ),
      ),
    ),
  );
}
