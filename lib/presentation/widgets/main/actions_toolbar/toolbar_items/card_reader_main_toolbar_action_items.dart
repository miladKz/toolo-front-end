import 'package:flutter/material.dart';
import 'package:toolo_gostar/domain/entities/common/counterparty.dart';
import 'package:toolo_gostar/main.dart';
import 'package:toolo_gostar/presentation/widgets/common/modals/modal_elements/custom_dialog.dart';
import 'package:toolo_gostar/presentation/widgets/main/actions_toolbar/toolbar_items/base_toolbar_action_items.dart';

import '../../../../../di/di.dart';
import '../../../../../domain/entities/common/card_reader.dart';
import '../../../../blocs/main_bloc/main_bloc.dart';
import '../../../common/modals/card_reader_modal.dart';

List<Widget> cardReaderMainToolbarActionItems(
    {required BuildContext context, required double maxWidth}) {
  double objectCount = 6 + 1;
  double objectWith = (maxWidth / objectCount) - 5;

  return [
    addActionItem(
      objectWith,
      context,
      caption: localization.titleNew,
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return CustomDialog(
                title: localization.titleCreateNewCardReader,
                width: maxWidth,
                body: CardReaderModal(
                  formWidth: maxWidth,
                  formKey: GlobalKey<FormState>(),
                  cardReader: CardReader(counterparty: Counterparty.empty()),
                ),
              );
            });
      },
    ),
    /*addActionItem(
      objectWith,
      context,
      caption: localization.titleFloatingDetailGroup,
      onTap: () {

      },
    ),*/
    removeActionItem(
      objectWith,
      context,
      onTap: () {},
    ),
    editActionItem(objectWith, context, onTap: () {
      MainBloc mainBloc = locator.get<MainBloc>();
      CardReader? cardReader = mainBloc.getSelectedCounterparty<CardReader>();
      if (cardReader != null) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return CustomDialog(
                title: localization.editCardReader,
                width: maxWidth,
                body: CardReaderModal(
                  formWidth: maxWidth,
                  formKey: GlobalKey<FormState>(),
                  cardReader: cardReader,
                ),
              );
            });
      }
    }),
    sendActionItem(
      objectWith,
      onTap: () {},
    ),
    refreshActionItem(
      objectWith,
      onTap: () {},
    ),
    printActionItem(
      objectWith,
      onTap: () {},
    ),
  ];
}
