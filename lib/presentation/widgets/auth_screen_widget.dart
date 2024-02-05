import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toolo_gostar/gen/assets.gen.dart';
import 'package:toolo_gostar/main.dart';
import 'package:toolo_gostar/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:toolo_gostar/presentation/validator/validators.dart';
import 'package:toolo_gostar/presentation/validator/validators/password_validators_enum.dart';
import 'package:toolo_gostar/presentation/validator/validators/url_validators_enum.dart';
import 'package:toolo_gostar/presentation/validator/validators/user_name_validators_enum.dart';
import 'package:toolo_gostar/presentation/widgets/snakbar.dart';

LayoutBuilder mainBox(
    {required AuthBloc authBloc,
    required BoxConstraints boxConstraints,
    required double inputBorder,
    required double inputGapPadding}) {
  final urlBoxMaxWith = boxConstraints.maxWidth / 2.2;
  return LayoutBuilder(
    builder: (context, constraints) {
      print(
          ' constraints.maxWidth/2.2: ${boxConstraints.maxWidth} || ${boxConstraints.maxWidth / 2.2}');
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
                    Assets.img.icnTooloPadideh.image(width: boxConstraints.maxWidth, height: 40),
                    UserNameBox(
                        inputController: authBloc.userNameController,
                        inputBorder: inputBorder,
                        inputGapPadding: inputGapPadding),
                    PasswordBox(
                        inputController: authBloc.passwordController,
                        inputBorder: inputBorder,
                        inputGapPadding: inputGapPadding),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          flex: 3,
                          child: UrlBox(
                              inputController: authBloc.urlController,
                              inputBorder: inputBorder,
                              inputGapPadding: inputGapPadding),
                        ),
                        const SizedBox(
                          width: 2,
                        ),
                        Flexible(
                          flex: 2,
                          child: PortBox(
                              inputController: authBloc.portController,
                              inputBorder: inputBorder,
                              inputGapPadding: inputGapPadding),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: authBox(authBloc: authBloc),
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

Row authBox({required AuthBloc authBloc}) {
  return Row(
    children: [
      Container(
        width: 36,
        height: 36,
        margin: const EdgeInsets.only(right: 8, top: 4),
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: const Color(0xFFD9BCE4),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: const Icon(
          Icons.exit_to_app,
          color: Colors.white,
          size: 20,
        ),
      ),
      Expanded(
          child: InkWell(
        child: btnAuth(),
        onTap: () {
          if (authBloc.isInputDataValid) {
            final String userName = authBloc.userNameController.text;
            final String password = authBloc.passwordController.text;
            final String url =
                '${authBloc.urlController.text}:${authBloc.portController.text}';
            authBloc.add(Authentication(
                userName: userName, cleanPassWord: password, baseUrl: url));
          } else {
            showSnack(
                title: localization.authErrorTitle,
                message: localization.authInputDataInvalid);
          }
        },
      )),
    ],
  );
}

Container btnAuth() {
  return Container(
    width: double.infinity,
    height: 40,
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    clipBehavior: Clip.antiAlias,
    decoration: ShapeDecoration(
      color: const Color(0xFF6C3483),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
    child:  Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          localization.captionAuthBtn,
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

Positioned rightView(double rightItemHeight, double borderRadius,
    double rightItemMargin, double rightItemWith) {
  return Positioned(
    right: 0,
    bottom: (rightItemHeight / 2 + borderRadius),
    child: Container(
      margin: EdgeInsets.only(right: rightItemMargin),
      padding: const EdgeInsets.all(2),
      width: rightItemWith,
      height: rightItemHeight,
      child: Container(
        width: rightItemWith,
        height: rightItemHeight,
        decoration: const ShapeDecoration(
          color: Color(0xFF6C3483),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(10),
              bottomRight: Radius.circular(50),
            ),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Assets.ico.icWebsite.image(width: 20, height: 20),
            const SizedBox(height: 8),
            Assets.ico.icSupportEmail.image(width: 20, height: 20),
            const SizedBox(height: 8),
            Assets.ico.icSupportCall.image(width: 20, height: 20),
            const SizedBox(height: 8),
          ],
        ),
      ),
    ),
  );
}

Widget version() {
  return Transform(
    transform: Matrix4.identity()
      ..translate(0.0, 0.0)
      ..rotateZ(3.14),
    child: Container(
      width: 20,
      height: 120,
      decoration: const ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(50),
            bottomRight: Radius.circular(50),
          ),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 4,
            offset: Offset(-2, 2),
            spreadRadius: 0,
          )
        ],
      ),
      child: Center(child: textVersion()),
    ),
  );
}

Widget textVersion() {
  return const RotatedBox(
    quarterTurns: 1,
    child: Text(
      'Version 10',
      style: TextStyle(
        color: Color(0xFF6D3483),
        fontSize: 12,
        fontWeight: FontWeight.w400,
        height: 0,
      ),
    ),
  );
}

class UserNameBox extends StatefulWidget {
  const UserNameBox({
    super.key,
    required this.inputController,
    required this.inputBorder,
    required this.inputGapPadding,
  });

  final TextEditingController inputController;
  final double inputBorder;
  final double inputGapPadding;

  @override
  State<UserNameBox> createState() => _UserNameBoxState();
}

class _UserNameBoxState extends State<UserNameBox> {
  final FocusNode _textFieldFocus = FocusNode();
  String title = localization.titleUserName;
  String hint = localization.hintInputUserName;

  Color unFocusColor = const Color(0xFFF2F2F2);

  @override
  Widget build(BuildContext context) {
    _textFieldFocus.addListener(() {
      setState(() {});
    });
    final Color backColor =
        _textFieldFocus.hasFocus ? Colors.white : unFocusColor;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 8, left: 8, bottom: 8, top: 8),
          child: Text(
            title,
            maxLines: 1,
          ),
        ),
        SizedBox(
          child: TextFormField(
            focusNode: _textFieldFocus,
            textDirection: TextDirection.rtl,
            controller: widget.inputController,
            validator: (value) {
              return _getValue(
                  Validators.userNameValidator(widget.inputController));
            },
            decoration: InputDecoration(
              hintText: hint,
              hintTextDirection: TextDirection.rtl,
              fillColor: backColor,
              filled: true,
              alignLabelWithHint: true,
              enabledBorder: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.all(Radius.circular(widget.inputBorder)),
                  borderSide:
                      BorderSide(color: backColor, style: BorderStyle.solid)),
              focusedBorder: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.all(Radius.circular(widget.inputBorder)),
                  borderSide: BorderSide(
                      color: unFocusColor, style: BorderStyle.solid)),
            ),
          ),
        ),
      ],
    );
  }

  String? _getValue(UserNameValidatorsEnum? validator) {
    final authBloc = context.read<AuthBloc>();
    authBloc.userNameInputValid = false;
    switch (validator) {
      case UserNameValidatorsEnum.canNotEmpty:
        {
          return localization.canNotEmpty;
        }
      case UserNameValidatorsEnum.lenTooShort:
        {
          return localization.hintTooShort3;
        }

      default:
        {
          authBloc.userNameInputValid = true;
          return null;
        }
    }
  }
}

class PasswordBox extends StatefulWidget {
  const PasswordBox({
    super.key,
    required this.inputController,
    required this.inputBorder,
    required this.inputGapPadding,
  });

  final TextEditingController inputController;
  final double inputBorder;
  final double inputGapPadding;

  @override
  State<PasswordBox> createState() => _PasswordBoxState();
}

class _PasswordBoxState extends State<PasswordBox> {
  final FocusNode _textFieldFocus = FocusNode();
  String title = localization.titlePassword;
  String hint = localization.hintInputPassword;

  Color unFocusColor = const Color(0xFFF2F2F2);

  var _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    _textFieldFocus.addListener(() {
      setState(() {});
    });
    final Color backColor =
        _textFieldFocus.hasFocus ? Colors.white : unFocusColor;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(right: 8, left: 8, bottom: 8, top: 8),
              child: Text(
                title,
                maxLines: 1,
              ),
            ),
            SizedBox(
              child: TextFormField(
                focusNode: _textFieldFocus,
                textDirection: TextDirection.rtl,
                controller: widget.inputController,
                obscureText: !_passwordVisible,
                validator: (value) {
                  return _getValue(
                      Validators.passwordValidator(widget.inputController));
                },
                decoration: InputDecoration(
                  hintText: hint,
                  hintTextDirection: TextDirection.rtl,
                  fillColor: backColor,
                  filled: true,
                  alignLabelWithHint: true,
                  prefixIcon: IconButton(
                      icon: Icon(
                        // Based on passwordVisible state choose the icon
                        _passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: const Color(0xFF6C3483),
                        size: 20,
                      ),
                      onPressed: () {
                        // Update the state i.e. toogle the state of passwordVisible variable
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      }),
                  enabledBorder: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.all(Radius.circular(widget.inputBorder)),
                      borderSide: BorderSide(
                          color: backColor, style: BorderStyle.solid)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.all(Radius.circular(widget.inputBorder)),
                      borderSide: BorderSide(
                          color: unFocusColor, style: BorderStyle.solid)),
                ),
              ),
            ),
          ],
        ),
        const Opacity(
          opacity: 0.80,
          child: Text(
            'فراموشی کلمه عبور',
            textDirection: TextDirection.ltr,
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Color(0xFF6D3483),
              fontSize: 10,
              decoration: TextDecoration.underline,
              height: 0,
            ),
          ),
        )
      ],
    );
  }

  String? _getValue(PasswordValidatorsEnum? validator) {
    final authBloc = context.read<AuthBloc>();
    authBloc.passwordInputValid = false;
    switch (validator) {
      case PasswordValidatorsEnum.canNotEmpty:
        {
          return localization.canNotEmpty;
        }
      case PasswordValidatorsEnum.lenTooShort:
        {
          return localization.hintTooShort3;
        }

      default:
        {
          authBloc.passwordInputValid = true;
          return null;
        }
    }
  }
}

class UrlBox extends StatefulWidget {
  const UrlBox({
    super.key,
    required this.inputController,
    required this.inputBorder,
    required this.inputGapPadding,
  });

  final TextEditingController inputController;
  final double inputBorder;
  final double inputGapPadding;

  @override
  State<UrlBox> createState() => _UrlBoxState();
}

class _UrlBoxState extends State<UrlBox> {
  final FocusNode _textFieldFocus = FocusNode();
  String title = localization.titleUrl;
  String hint = localization.hintInputUrl;
  Color unFocusColor = const Color(0xFFF2F2F2);

  @override
  Widget build(BuildContext context) {
    _textFieldFocus.addListener(() {
      setState(() {});
    });
    final Color backColor =
        _textFieldFocus.hasFocus ? Colors.white : unFocusColor;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 8, left: 8, bottom: 8, top: 8),
          child: Text(
            title,
            maxLines: 1,
          ),
        ),
        TextFormField(
          focusNode: _textFieldFocus,
          textDirection: TextDirection.ltr,
          controller: widget.inputController,
          keyboardType: TextInputType.url,
          validator: (value) {
            return _getValue(Validators.urlValidator(widget.inputController));
          },
          decoration: InputDecoration(
            hintText: hint,
            hintTextDirection: TextDirection.ltr,
            fillColor: backColor,
            filled: true,
            alignLabelWithHint: true,
            enabledBorder: OutlineInputBorder(
                borderRadius:
                    BorderRadius.all(Radius.circular(widget.inputBorder)),
                borderSide:
                    BorderSide(color: backColor, style: BorderStyle.solid)),
            focusedBorder: OutlineInputBorder(
                borderRadius:
                    BorderRadius.all(Radius.circular(widget.inputBorder)),
                borderSide:
                    BorderSide(color: unFocusColor, style: BorderStyle.solid)),
          ),
        ),
      ],
    );
  }

  String? _getValue(UrlValidatorsEnum? validator) {
    final authBloc = context.read<AuthBloc>();
    authBloc.urlInputValid = false;
    switch (validator) {
      case UrlValidatorsEnum.canNotEmpty:
        {
          return localization.canNotEmpty;
        }
      case UrlValidatorsEnum.lenTooShort:
        {
          return localization.hintTooShort7;
        }

      default:
        {
          authBloc.urlInputValid = true;
          return null;
        }
    }
  }
}

class PortBox extends StatefulWidget {
  const PortBox({
    super.key,
    required this.inputController,
    required this.inputBorder,
    required this.inputGapPadding,
  });

  final TextEditingController inputController;
  final double inputBorder;
  final double inputGapPadding;

  @override
  State<PortBox> createState() => _PortBoxState();
}

class _PortBoxState extends State<PortBox> {
  final FocusNode _textFieldFocus = FocusNode();
  String title = localization.titlePort;
  String hint = localization.hintInputPort;
  Color unFocusColor = const Color(0xFFF2F2F2);

  @override
  Widget build(BuildContext context) {
    _textFieldFocus.addListener(() {
      setState(() {});
    });
    final Color backColor =
        _textFieldFocus.hasFocus ? Colors.white : unFocusColor;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 8, left: 8, bottom: 8, top: 8),
          child: Text(
            title,
            maxLines: 1,
          ),
        ),
        SizedBox(
          child: TextFormField(
            focusNode: _textFieldFocus,
            textDirection: TextDirection.ltr,
            controller: widget.inputController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: hint,
              hintTextDirection: TextDirection.ltr,
              fillColor: backColor,
              filled: true,
              alignLabelWithHint: true,
              enabledBorder: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.all(Radius.circular(widget.inputBorder)),
                  borderSide:
                      BorderSide(color: backColor, style: BorderStyle.solid)),
              focusedBorder: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.all(Radius.circular(widget.inputBorder)),
                  borderSide: BorderSide(
                      color: unFocusColor, style: BorderStyle.solid)),
            ),
          ),
        ),
      ],
    );
  }
}
