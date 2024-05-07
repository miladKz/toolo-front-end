import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../gen/assets.gen.dart';

class PinedMenu extends StatefulWidget {
  const PinedMenu({super.key});

  @override
  State<PinedMenu> createState() => _PinedMenu();
}

class _PinedMenu extends State<PinedMenu> {
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
        child: Flex(
          direction: Axis.horizontal,
          children: [
            Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Assets.ico.icPinNotSelected.image(width: 20, height: 20),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    localization.titlePinsMenu,
                    style: const TextStyle(
                        color: Color(0xFF7B7B84),
                        fontSize: 13,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            SizedBox(
              width: 20,
              height: 20,
              child: Center(
                child: Assets.ico.icDownArrow.image(width: 10, height: 10),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
