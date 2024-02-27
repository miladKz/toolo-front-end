import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../atras_direction.dart';
import '../../../gen/assets.gen.dart';

class SearchBox extends StatefulWidget {
  Color focusColor;
  Color unFocusColor;

  SearchBox(
      {super.key,
      this.focusColor = const Color(0xffBD8AD0),
      this.unFocusColor = const Color(0xFFF7F7F7)});

  @override
  State<SearchBox> createState() => _SearchBox();
}

class _SearchBox extends State<SearchBox> {
  double borderRadios = 11;

  @override
  Widget build(BuildContext context) {
    AppLocalizations localization = AppLocalizations.of(context)!;
    return SizedBox(
      height: 48,
      child: TextFormField(
        textDirection: atrasDirection(context),
        decoration: InputDecoration(
          hintStyle: const TextStyle(fontSize: 13),
          hintText: localization.hintSearch,
          hintTextDirection: atrasDirection(context),
          alignLabelWithHint: true,
          suffixIcon: Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
                decoration: BoxDecoration(
                    color: const Color(0xffEFE0F5),
                    borderRadius: BorderRadius.circular(11)),
                child: Padding(
                  padding: const EdgeInsets.all(9),
                  child: Assets.ico.icSearch.image(width: 12, height: 12),
                )),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadios),
              borderSide: BorderSide(color: widget.unFocusColor, width: 2)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadios),
              borderSide: BorderSide(color: widget.focusColor, width: 2)),
        ),
      ),
    );
  }
}
