import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toolo_gostar/presentation/fake_data/fake_data.dart';
import 'package:toolo_gostar/presentation/widgets/main/generic_tree_view/generic_tree_view.dart';
import 'package:toolo_gostar/presentation/widgets/main/generic_tree_view/widget_tree_model_abs.dart';

import '../../../blocs/main_bloc/main_bloc.dart';

class FloatingDetailTreeView extends StatefulWidget {
  final List<IDataTreeModel> items ;

  FloatingDetailTreeView({
    super.key, required this.items,
  });

  @override
  State<FloatingDetailTreeView> createState() =>
      _FakeTreeViewBuilderState();
}

class _FakeTreeViewBuilderState extends State<FloatingDetailTreeView> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: widget.items.isNotEmpty
          ? ListView.builder(
        itemCount: widget.items.length,
        itemBuilder: (context, index) {
          return GenericTreeView(
            model: widget.items[index],
            onCallBack: ({required isOnDouble, required item}) {
              selectItem(item);
             /* if (isOnDouble) {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return EditGroupDialog(
                      account: account,
                    ); // Pass your account data here
                  },
                );
              }*/
            },
          );
        },
      )
          : const Center(
        child: Text(
          'There is no data for this section',
          style: TextStyle(
              fontSize: 18,
              color: Colors.black38,
              fontWeight: FontWeight.w700),
        ),
      ),
    );
  }


}

void selectItem(IDataTreeModel item) {
//  locator.get<MainBloc>().add(OnClickOnAccount(account));
}
