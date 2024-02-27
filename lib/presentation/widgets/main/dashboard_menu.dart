import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../gen/assets.gen.dart';

class DashboardMenu extends StatefulWidget {
  const DashboardMenu({super.key});

  @override
  State<DashboardMenu> createState() => _DashboardMenu();
}

class _DashboardMenu extends State<DashboardMenu> {
  double borderRadios = 11;

  @override
  Widget build(BuildContext context) {
    AppLocalizations localization = AppLocalizations.of(context)!;
    return SizedBox(
      height: 48,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
                color: const Color(0xFF929292).withOpacity(0.25), width: 1)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Assets.ico.icDashboardNotSelected.image(width: 20, height: 20),
            const SizedBox(
              width: 4,
            ),
            Text(
              localization.titleDashboard,
              style: const TextStyle(
                  color: Color(0xFF7B7B84),
                  fontSize: 13,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
