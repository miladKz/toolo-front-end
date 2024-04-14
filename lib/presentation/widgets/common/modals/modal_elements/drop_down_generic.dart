// we enforce here each T should be extends DropAble
import 'package:flutter/material.dart';
import 'package:toolo_gostar/domain/entities/common/abstracts/drop_down_item_abs.dart';
import 'package:toolo_gostar/presentation/widgets/common/modals/modal_elements/form_item_title.dart';

class GenericDropDown<T extends IDropDownItem> extends StatefulWidget {
  GenericDropDown({
    super.key,
    required this.items,
    required this.onChanged,
    this.value,
    required this.itemWidth,
    required this.isEnable,
    this.hint = ''
  });

  final String hint;

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
        height: 35,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(width: 1, color: const Color(0xFFDDE1E5)),
            borderRadius: BorderRadius.circular(4)),
        child: DropdownButton<T>(
          padding: const EdgeInsets.only(right: 4,top: 4,left: 4,bottom: 2),
          icon: const Icon(Icons.arrow_drop_down_outlined, size: 25,),
          hint:  Text(widget.hint),
          iconSize: 16,
          value: widget.value,
          elevation: 2,
          style: const TextStyle(color: Color(0xFF7E7E7F), fontSize: 20),
          isDense: true,
          underline: const SizedBox(),

          items: widget.items
              .map(
                (item) => DropdownMenuItem<T>(
                  value: item,
                  child: Center(
                    child: SizedBox(
                      width: (widget.itemWidth*0.9) - 10,
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
