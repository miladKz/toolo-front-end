import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:toolo_gostar/atras_direction.dart';
import 'package:toolo_gostar/data/models/fiscal_year/fiscal_year_data.dart';
import 'package:toolo_gostar/data/models/fiscal_year/work_group_data.dart';
import 'package:toolo_gostar/gen/assets.gen.dart';
import 'package:toolo_gostar/main.dart';
import 'package:toolo_gostar/presentation/blocs/fiscal_year_bloc/fiscal_year_bloc.dart';
import 'package:toolo_gostar/presentation/pages/screen_fiscal_year.dart';
import 'package:toolo_gostar/presentation/widgets/back_screen.dart';
import 'package:toolo_gostar/presentation/widgets/snakbar.dart';

bool isEnable = true;

LayoutBuilder fiscalYearMainBox(
    {required FiscalYearBloc fiscalYearBloc,
    required BoxConstraints boxConstraints,
    required double inputBorder,
    required double inputGapPadding,
    required bool enable}) {
  isEnable = enable;
  return LayoutBuilder(
    builder: (context, constraints) {
      return Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Center(
              child: ConstrainedBox(
                constraints: boxConstraints,
                child: Column(
                  textDirection: TextDirection.rtl,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Assets.img.icnTooloPadideh
                        .image(width: boxConstraints.maxWidth, height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          flex: 4,
                          child: YearBox(
                              fiscalYearsBloc: fiscalYearBloc,
                              inputController:
                                  fiscalYearBloc.fiscalYearController,
                              inputBorder: inputBorder,
                              inputGapPadding: inputGapPadding),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Flexible(
                          flex: 6,
                          child: WorkGroupBox(
                              fiscalYearsBloc: fiscalYearBloc,
                              inputController:
                                  fiscalYearBloc.workGroupController,
                              inputBorder: inputBorder,
                              inputGapPadding: inputGapPadding),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: successBox(bloc: fiscalYearBloc),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}

Row successBox({required FiscalYearBloc bloc}) {
  return Row(
    children: [
      Flexible(
        flex: 4,
        child: Container(
          height: 40,
          margin: const EdgeInsets.only(right: 4, top: 4),
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: const Color(0xFFEFE0F5),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          child: InkWell(
            onTap: () => isEnable ? backScreen() : null,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Icon(
                  Icons.arrow_back_ios,
                  color: Color(0xFF6C3483),
                  size: 20,
                ),
                Text(localization.titleBack,
                    style: const TextStyle(
                      color: Color(0xFF6C3483),
                    )),
              ],
            ),
          ),
        ),
      ),
      Flexible(
          flex: 6,
          child: InkWell(
            child: btnSuccess(),
            onTap: () => isEnable ? setData(bloc: bloc, token: token) : null,
          )),
    ],
  );
}

setData({required FiscalYearBloc bloc, required String token}) {
  if (bloc.isInputDataValid) {
    bloc.add(FiscalYearSetData(
        token: token,
        activeYearId: bloc.selectedValueFiscalYear!.fiscalYearId));
  } else {
    showSnack(
        title: localization.titleFiscalYearError,
        message: localization.fiscalYearInputDataInvalid);
  }
}

Container btnSuccess() {
  return Container(
    width: double.infinity,
    height: 40,
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    clipBehavior: Clip.antiAlias,
    decoration: ShapeDecoration(
      color: const Color(0xFF6C3483),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          localization.captionSuccess,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w400,
            height: 0.12,
          ),
        ),
      ],
    ),
  );
}

class WorkGroupBox extends StatefulWidget {
  const WorkGroupBox({
    super.key,
    required this.fiscalYearsBloc,
    required this.inputController,
    required this.inputBorder,
    required this.inputGapPadding,
  });

  final FiscalYearBloc fiscalYearsBloc;
  final TextEditingController inputController;
  final double inputBorder;
  final double inputGapPadding;

  @override
  State<WorkGroupBox> createState() => _WorkGroupBox();
}

class _WorkGroupBox extends State<WorkGroupBox> {
  String title = localization.titleSelectWorkGroup;
  Color unFocusColor = const Color(0xFFF2F2F2);

  @override
  Widget build(BuildContext context) {
    final workGroupData =
        widget.fiscalYearsBloc.fiscalYearResponse.workGroupsData;
    const boxColor = Color(0xFFF2F2F2);
    const iconColor = Color(0xFF6C3483);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(4),
          child: Text(
            title,
            maxLines: 1,
          ),
        ),
        Container(
          decoration: BoxDecoration(
              color: boxColor,
              borderRadius:
                  BorderRadius.all(Radius.circular(widget.inputBorder))),
          child: Center(
            child: DropdownButtonHideUnderline(
              child: DropdownButton2<WorkGroupData>(
                iconStyleData: const IconStyleData(
                    icon: Padding(
                      padding: EdgeInsets.all(2),
                      child: Icon(
                        Icons.keyboard_arrow_down,
                      ),
                    ),
                    iconSize: 20,
                    iconEnabledColor: iconColor),
                alignment: atrasAlignment(context),
                isExpanded: true,
                hint: Text(
                  localization.titleSelectWorkGroup,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(context).hintColor,
                  ),
                ),
                items: workGroupData.map((item) {
                  return DropdownMenuItem(
                    enabled: isEnable,
                    alignment: atrasAlignment(context),
                    value: item,
                    child: Directionality(
                      textDirection: atrasDirection(context),
                      child: Text(
                        item.workGroupName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ),
                  );
                }).toList(),
                value: widget.fiscalYearsBloc.selectedValueWorkGroup,
                onChanged: (value) {
                  setState(() {
                    widget.fiscalYearsBloc.selectedValueWorkGroup = value;
                  });
                },
                buttonStyleData: const ButtonStyleData(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  height: 40,
                  width: double.infinity,
                ),
                dropdownStyleData: const DropdownStyleData(
                  maxHeight: double.infinity,
                ),
                menuItemStyleData: const MenuItemStyleData(
                  height: 40,
                ),
                dropdownSearchData: DropdownSearchData(
                  searchController: widget.inputController,
                  searchInnerWidgetHeight: 50,
                  searchInnerWidget: Container(
                    height: 50,
                    padding: const EdgeInsets.only(
                      top: 8,
                      bottom: 4,
                      right: 8,
                      left: 8,
                    ),
                    child: TextFormField(
                      expands: true,
                      maxLines: null,
                      controller: widget.inputController,
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 8,
                        ),
                        hintText: localization.searchHintWorkGroup,
                        hintStyle: const TextStyle(fontSize: 12),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  searchMatchFn: (item, searchValue) {
                    return item.value!.workGroupName.contains(searchValue);
                  },
                ),
                //This to clear the search value when you close the menu
                onMenuStateChange: (isOpen) {
                  if (!isOpen) {
                    widget.inputController.clear();
                  }
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class YearBox extends StatefulWidget {
  const YearBox({
    super.key,
    required this.fiscalYearsBloc,
    required this.inputController,
    required this.inputBorder,
    required this.inputGapPadding,
  });

  final FiscalYearBloc fiscalYearsBloc;
  final TextEditingController inputController;
  final double inputBorder;
  final double inputGapPadding;

  @override
  State<YearBox> createState() => _YearBoxState();
}

class _YearBoxState extends State<YearBox> {
  String title = localization.titleFiscalYear;
  Color unFocusColor = const Color(0xFFF2F2F2);

  @override
  Widget build(BuildContext context) {
    final fiscalYearData =
        widget.fiscalYearsBloc.fiscalYearResponse.fiscalYearsData;
    const boxColor = Color(0xFFF2F2F2);
    const iconColor = Color(0xFF6C3483);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(4),
          child: Text(
            title,
            maxLines: 1,
          ),
        ),
        Container(
          decoration: BoxDecoration(
              color: boxColor,
              borderRadius:
                  BorderRadius.all(Radius.circular(widget.inputBorder))),
          child: Center(
            child: DropdownButtonHideUnderline(
              child: DropdownButton2<FiscalYearData>(
                iconStyleData: const IconStyleData(
                    icon: Padding(
                      padding: EdgeInsets.all(2),
                      child: Icon(
                        Icons.date_range,
                      ),
                    ),
                    iconSize: 20,
                    iconEnabledColor: iconColor),
                alignment: atrasAlignment(context),
                isExpanded: true,
                hint: Text(
                  localization.titleSelectFiscalYear,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 12,
                    color: Theme.of(context).hintColor,
                  ),
                ),
                items: fiscalYearData.map((item) {
                  return DropdownMenuItem(
                    enabled: isEnable,
                    alignment: Alignment.centerRight,
                    value: item,
                    child: Text(
                      item.fiscalYearName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  );
                }).toList(),
                value: widget.fiscalYearsBloc.selectedValueFiscalYear,
                onChanged: (value) {
                  setState(() {
                    widget.fiscalYearsBloc.selectedValueFiscalYear = value;
                  });
                },
                buttonStyleData: const ButtonStyleData(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  height: 40,
                  width: double.infinity,
                ),
                dropdownStyleData: const DropdownStyleData(
                  maxHeight: double.infinity,
                ),
                menuItemStyleData: const MenuItemStyleData(
                  height: 40,
                ),
                dropdownSearchData: DropdownSearchData(
                  searchController: widget.inputController,
                  searchInnerWidgetHeight: 50,
                  searchInnerWidget: Container(
                    height: 50,
                    padding: const EdgeInsets.only(
                      top: 8,
                      bottom: 4,
                      right: 8,
                      left: 8,
                    ),
                    child: TextFormField(
                      expands: true,
                      maxLines: null,
                      controller: widget.inputController,
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 8,
                        ),
                        hintText: localization.searchHintFiscalYear,
                        hintStyle: const TextStyle(fontSize: 12),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  searchMatchFn: (item, searchValue) {
                    return item.value!.fiscalYearName.contains(searchValue);
                  },
                ),
                //This to clear the search value when you close the menu
                onMenuStateChange: (isOpen) {
                  if (!isOpen) {
                    widget.inputController.clear();
                  }
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
