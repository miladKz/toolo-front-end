// we enforce here each T should be extends DropAble
import 'package:flutter/material.dart';
import 'package:toolo_gostar/domain/entities/common/drop_down_item_abs.dart';
import 'package:toolo_gostar/presentation/widgets/main/forms/form_elements/form_item_title.dart';

class GenericDropDown<T extends IDropDownItem> extends StatefulWidget {
  GenericDropDown({
    super.key,
    required this.items,
    required this.onChanged,
    required this.value,
    required this.itemWidth,
    required this.isEnable,
  });

  final List<T> items;

  // callback function called when the user change the select another value
  final Function(T?) onChanged;

  // the value of selected item
  T? value;

  // the value of selected item
  final bool isEnable;

  //the item width
  final double itemWidth;

  @override
  State<GenericDropDown<T>> createState() => _GenericDropDownState<T>();
}

class _GenericDropDownState<T extends IDropDownItem>
    extends State<GenericDropDown<T>> {
  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: !widget.isEnable,
      child: Container(
        height: 30,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(width: 1, color: const Color(0xFFDDE1E5)),
            borderRadius: BorderRadius.circular(4)),
        child: DropdownButton<T>(
          padding: const EdgeInsets.only(right: 3,top: 2,left: 3),
          icon: const Icon(Icons.keyboard_arrow_down_rounded),
          iconSize: 16,
          elevation: 2,
          isDense: true,
          underline: const SizedBox(),
          value: widget.value,
          items: widget.items
              .map(
                (item) => DropdownMenuItem<T>(
                  value: item,
                  child: Center(
                    child: SizedBox(
                      width: widget.itemWidth*0.98,
                      child: FormItemTitle(
                        title: item.name,
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
          onChanged: (item) {
            setState(() {
              widget.value = item;
              widget.onChanged(item);
            });
          },
        ),
      ),
    );
  }
}
