import 'package:flutter/material.dart';
import 'package:sera/widgets/inputtext_widgets.dart';

import '../../widgets/main_button.dart';
import '../../widgets/space_widget.dart';
import '../../widgets/textbutton_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController id = TextEditingController();
  TextEditingController pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            InputTextWidget(
                hint: "Username",
                icons: const Icon(Icons.email),
                controller: id),
            Space(20),
            InputTextWidget(
              hint: "Password",
              icons: const Icon(Icons.lock),
              controller: pass,
              isPassword: true,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButtonWidget('Forgot password', onClick: () {}),
              ],
            ),
            Space(32),
            MainButton("Sign In", onClick: () {}),
            TextButtonWidget('Didn\'t have any account? Sign Up here', onClick: () {}),
          ],
        ),
      ),
    );
  }
}
