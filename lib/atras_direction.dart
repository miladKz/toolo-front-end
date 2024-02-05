
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

TextDirection atrasDirection(BuildContext context) {
  return intl.Bidi.isRtlLanguage(Localizations.localeOf(context).languageCode)
      ? TextDirection.rtl
      : TextDirection.ltr;
}
