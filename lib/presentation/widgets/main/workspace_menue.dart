import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../gen/assets.gen.dart';
import 'workspace_menue_item.dart';

class Workspace extends StatefulWidget {
  const Workspace({
    super.key,
  });

  @override
  State<Workspace> createState() => _WorkspaceState();
}

class _WorkspaceState extends State<Workspace> {
  bool _isExpanded = false;
  final double borderRadius = 11;

  @override
  Widget build(BuildContext context) {
    AppLocalizations localization = AppLocalizations.of(context)!;
    return LayoutBuilder(
      builder: (context, constraints) => Container(
        decoration: BoxDecoration(
          color: const Color(0xFFF6F6F6),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: ExpansionTile(
          onExpansionChanged: (isExpanded) =>
              setState(() => _isExpanded = isExpanded),
          shape: const Border(),
          collapsedIconColor: const Color(0xFFBD8AD0),
          tilePadding:
              const EdgeInsets.only(left: 8, right: 8, top: 5, bottom: 4),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _isExpanded
                        ? Assets.ico.icCartableSelected
                            .image(width: 20, height: 20)
                        : Assets.ico.icCartableNotSelected
                            .image(width: 20, height: 20),
                    const SizedBox(
                      width: 5,
                    ),
                     Text(
                      localization.workSpace,
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF7B7B84)),
                    ),
                  ],
                ),
              ),
              SizedBox(
                child: Assets.ico.icPinNotSelected.image(width: 15, height: 15),
              )
            ],
          ),
          children: const [
            Padding(
              padding: EdgeInsets.only(bottom: 5, right: 15, left: 15),
              child: Divider(
                height: 2,
                color: Color(0xFFEFEFF4),
              ),
            ),
            WorkspaceMenuItem(
              title: 'جسابداری',
              width: 100,
            ),
            WorkspaceMenuItem(title: 'تامین کنندگان و خرید'),
            WorkspaceMenuItem(title: 'مشترییان و فروش'),
            WorkspaceMenuItem(title: 'مالیاتی'),
            WorkspaceMenuItem(title: 'انبار و حسابداری'),
            WorkspaceMenuItem(title: 'دریافت و پرداخت'),
          ],
        ),
      ),
    );
  }
}
