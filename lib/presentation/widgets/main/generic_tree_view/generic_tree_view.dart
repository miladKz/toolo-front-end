import 'package:flutter/material.dart';
import 'package:toolo_gostar/presentation/widgets/main/generic_tree_view/generic_tree_view_item.dart';
import 'package:toolo_gostar/presentation/widgets/main/generic_tree_view/widget_tree_model_abs.dart';

import '../../common/widget_tree/custom_expansion_tile.dart';

class GenericTreeView<T extends IDataTreeModel> extends StatefulWidget {
 final double iconSize;
 final double fontSize;
 final IDataTreeModel model;
  final Function({required IDataTreeModel item, required bool isOnDouble})
      onCallBack;

  const GenericTreeView(
      {Key? key,
      this.iconSize = 15,
      required this.model,
      this.fontSize = 12,
      required this.onCallBack})
      : super(key: key);

  @override
  State<GenericTreeView<T>> createState() => _GenericTreeViewState<T>();
}

class _GenericTreeViewState<T extends IDataTreeModel>
    extends State<GenericTreeView<T>> {
  @override
  Widget build(BuildContext context) {
    return CustomExpansionTile(
      onTap: () {

        widget.onCallBack(item: widget.model, isOnDouble: false);
      },
      title: GestureDetector(
        onDoubleTap: () {
          widget.onCallBack(item: widget.model, isOnDouble: true);
        },
        child: Container(
          padding:
              const EdgeInsets.only(left: 10, right: 10, top: 2, bottom: 2),
          decoration: BoxDecoration(
              color: const Color(0xFFF0F0F0),
              borderRadius: BorderRadius.circular(5)),
          child: Row(
            children: [
              Text(
                widget.model.displayName,
                style: TextStyle(
                    fontSize: widget.fontSize,
                    color: const Color(0xFF616161),
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
      children: [
        Container(
            margin: const EdgeInsets.only(right: 2),
            padding: const EdgeInsets.only(right: 5),
            decoration: const BoxDecoration(
              border: Border(
                right: BorderSide(
                  color: Color(0xFFDFE3E7),
                  width: 1,
                ),
              ),
            ),
            child: Column(
              children: widget.model.hasChildren
                  ? _buildChildren(items: widget.model.children, textScale: 1)
                  : [const SizedBox()],
            )),
      ],
    );
  }

  List<Widget> _buildChildren(
      {required List<IDataTreeModel> items, required double textScale}) {
    return items.map((item) {
      return item.hasChildren
          ? GenericTreeView<T>(
              model: item,
              fontSize: widget.fontSize,
              iconSize: widget.iconSize,
              onCallBack: widget.onCallBack,
            )
          : _buildItem(item: item, textScale: textScale);
    }).toList();
  }

  Widget _buildItem({required IDataTreeModel item, required double textScale}) {
    return GenericTreeViewItem(
      model: item,
      fontSize: widget.fontSize,
      textScale: textScale,
      onCallBack: widget.onCallBack,
      iconSize: widget.iconSize,
    );
  }
}
