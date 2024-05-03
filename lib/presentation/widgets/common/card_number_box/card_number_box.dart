import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:toolo_gostar/presentation/widgets/common/card_number_box/card_number_formater.dart';

Widget cardNumberBox() {
  return TextFormField(
    inputFormatters: [
      FilteringTextInputFormatter.digitsOnly,
      CardNumberFormatter(), // Apply our custom formatter
    ],
    textInputAction: TextInputAction.done,
    keyboardType: TextInputType.number,
    decoration: InputDecoration(
      prefixIcon: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.network(
          'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2a/Mastercard-logo.svg/800px-Mastercard-logo.svg.png',
          height: 30,
          width: 30,
        ),
      ),
      suffixIcon: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          'Change',
          style: TextStyle(color: Colors.green),
        ),
      ),
      border: const OutlineInputBorder(),
      hintText: '______-______-______-______',
      // Placeholder for the card number
      alignLabelWithHint: true,
      labelText: 'Card Number',
    ),
    maxLength: 19,
    // Maximum length for a credit card number
    onChanged: (value) {
      // Handle changes if needed
    },
  );
}
