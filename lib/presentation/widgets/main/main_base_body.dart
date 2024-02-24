import 'package:flutter/material.dart';
import 'package:toolo_gostar/atras_direction.dart';
import 'package:toolo_gostar/gen/assets.gen.dart';
import 'package:toolo_gostar/main.dart';
import 'package:toolo_gostar/presentation/widgets/main/workspace_menue.dart';

class MainBaseBody extends StatelessWidget {
  const MainBaseBody({super.key});

  @override
  Widget build(BuildContext context) {
    final heightScreen = MediaQuery.sizeOf(context).height;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Flexible(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Container(
                height: heightScreen,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Assets.img.imgProfile
                                      .image(width: 52, height: 52),
                                  const Padding(
                                    padding: EdgeInsets.only(right: 8),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'مهدی زمانی',
                                          style: TextStyle(
                                              color: Color(0xff616161),
                                              fontSize: 12),
                                        ),
                                        SizedBox(
                                          height: 2,
                                        ),
                                        Text(
                                          'برنامه نویس فلاتر',
                                          style: TextStyle(
                                              color: Color(0xff8D8D8D),
                                              fontSize: 10),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 25,
                              height: 25,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: const Color(0xffEFE0F5)
                                        .withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(4)),
                                child: const Text(
                                  '...',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      height: 1.2,
                                      color: Color(0xff6C3483),
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 7, bottom: 4),
                          child: searchBox(context),
                        ),
                        const Divider(
                          height: 1,
                          color: Color(0xFFEFEFF4),
                        ),
                        menuDashBoard(),
                        const SizedBox(
                          height: 5,
                        ),
                        menuPin(),
                        const SizedBox(
                          height: 5,
                        ),
                        const Workspace()
                      ],
                    ),
                  ),
                ),
              ),
            )),
        Flexible(
          flex: 8,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Container(
                    padding: const EdgeInsets.only(
                        left: 5, top: 5, right: 12, bottom: 5),
                    decoration: BoxDecoration(
                        color: const Color(0xFFEFE0F5),
                        borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Assets.img.icnTooloPadideh
                                .image(width: 70, height: 30),
                            Expanded(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(4),
                                  child: actionBarBadgedButton(),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4),
                                  child: logoutButton(),
                                ),
                              ],
                            ))
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                    child: Row(
                  children: [
                    Flexible(
                      flex: 2,
                      child: Container(
                        color: const Color(0xFFF0F0F0),
                      ),
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    Flexible(
                        flex: 8,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 4, right: 8),
                          child: Container(
                            color: Colors.white,
                          ),
                        ))
                  ],
                )),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget logoutButton() {
    return SizedBox(
      height: 30,
      width: 30,
      child: IconButton(
        onPressed: () {},
        icon: Assets.ico.icExit.image(width: 12, height: 12),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
              side: const BorderSide(color: Color(0xFF6C3483), width: 1),
              borderRadius: BorderRadius.circular(5)),
        ),
      ),
    );
  }

  Widget actionBarBadgedButton() {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(11)),
      child: Badge(
        label: const Text("6"),
        backgroundColor: const Color(0xFFE84336),
        textColor: const Color(0xFFFFFFFF),
        alignment: Alignment.topRight,
        offset: const Offset(7, -6),
        child: TextButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFFD9BCE4),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          ),
          onPressed: () {},
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Assets.ico.icMessage.image(width: 16, height: 16),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    localization.titleReceiveMessages,
                    style: TextStyle(
                        color: Color(0xFF706C71),
                        fontWeight: FontWeight.bold,
                        fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget searchBox(BuildContext context) {
    var focusColor = const Color(0xffBD8AD0);
    var unFocusColor = const Color(0xFFF7F7F7);
    double borderRadios = 10;
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
              borderSide: BorderSide(color: unFocusColor, width: 2)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadios),
              borderSide: BorderSide(color: focusColor, width: 2)),
        ),
      ),
    );
  }

  Widget menuDashBoard() {
    return SizedBox(
      height: 48,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
                color: const Color(0xFF929292).withOpacity(0.25), width: 1)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Assets.ico.icDashboardNotSelected.image(width: 20, height: 20),
            const SizedBox(
              width: 4,
            ),
            Text(
              localization.titleDashboard,
              style: const TextStyle(
                  color: Color(0xFF7B7B84),
                  fontSize: 13,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }

  Widget menuPin() {
    return SizedBox(
      height: 48,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
                color: const Color(0xFF929292).withOpacity(0.25), width: 1)),
        child: Row(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Assets.ico.icPinNotSelected.image(width: 20, height: 20),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    localization.titlePinsMenu,
                    style: const TextStyle(
                        color: Color(0xFF7B7B84),
                        fontSize: 13,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            SizedBox(
              width: 20,
              height: 20,
              child: Center(
                child: Assets.ico.icDownArrow.image(width: 10, height: 10),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
