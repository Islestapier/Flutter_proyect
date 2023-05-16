import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with RegisterAuth {
  static const colorPri = Color(0xFFF77D8E);
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: double.maxFinite,
            height: 80,
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 247, 125, 141),
                //border: Border(top: BorderSide(color: Colors.black)),
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade600,
                      spreadRadius: 0,
                      blurRadius: 6,
                      blurStyle: BlurStyle.outer,
                      offset: const Offset(0, 0))
                ]),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 22.0),
              child: Text(
                "Log in",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontStyle: FontStyle.normal,
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 26.0, vertical: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                /*Container(
                  width: double.maxFinite,
                  decoration: const BoxDecoration(
                      color: colorPri,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: const Text(
                    "Log in",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontStyle: FontStyle.normal,
                        fontSize: 36.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),*/
                const SizedBox(
                  height: 5.0,
                ),
                const Text(
                  "Accede a contenidos 24h al dia, diviertete en el gigante mundo de la tecnologia, la programacion y la informatica. Que esperas!!!",
                  style: TextStyle(
                      color: Color.fromARGB(125, 0, 0, 0),
                      fontSize: 12.5,
                      fontStyle: FontStyle.normal),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40.0),
                TextFormField(
                  cursorColor: colorPri,
                  decoration: buildInputDecoration_EMAIL("email"),
                  validator: InputValidator.email,
                ),
                const SizedBox(height: 20.0),
                /*Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: TextFormField(
                      decoration:
                          buildInputDecoration("Re-enter email"),
                      validator: InputValidator.email,
                    ),
                  ),*/
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TextFormField(
                    cursorColor: colorPri,
                    maxLength: 16,
                    obscureText: visiblePassword,
                    decoration: buildInputDecoration_PASSWORD("password", true),
                    validator: InputValidator.password,
                    onChanged: (t) {
                      InputValidator.passwordText = t;
                    },
                  ),
                ),
                /* Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: TextFormField(
                      obscureText: visiblePassword,
                      onChanged: (t) {
                        InputValidator.confirmPasswordText = t;
                      },
                      decoration: buildInputDecoration(
                          "Re-enter password", true),
                      validator: InputValidator.password,
                    ),
                  ),*/
              ],
            ),
          ),
          const SizedBox(height: 15.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26),
            child: MaterialButton(
              height: 52.5,
              minWidth: MediaQuery.of(context).size.width,
              color: colorPri,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(15.0),
                      bottomLeft: Radius.circular(30.0),
                      bottomRight: Radius.circular(15.0))),
              onPressed: () {
                register();
              },
              child: isLoading
                  ? const SizedBox(
                      width: 20.0,
                      height: 20.0,
                      child: CircularProgressIndicator(
                        strokeWidth: 2.0,
                      ))
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const <Widget>[
                        Icon(
                          CupertinoIcons.arrow_right,
                          size: 30,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Create account",
                            style: TextStyle(color: Colors.white)),
                      ],
                    ),
            ),
          ),
        ],
      ),
    );
  }

  InputDecoration buildInputDecoration_EMAIL(hintText, [eyeVisible = false]) {
    var outlineInputBorder = OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0),
        borderSide: const BorderSide(color: colorPri));

    return InputDecoration(
      focusedErrorBorder: outlineInputBorder,
      prefixIcon: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: SvgPicture.asset("assets/icons/email.svg"),
      ),
      suffixIcon: eyeVisible
          ? IconButton(
              icon: Icon(
                Icons.remove_red_eye,
                color: !visiblePassword ? Colors.grey : Colors.red,
              ),
              onPressed: () {
                setState(() {
                  visiblePassword = !visiblePassword;
                });
              },
            )
          : const SizedBox.shrink(),
      hintText: hintText,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
      border: outlineInputBorder,
      //enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
    );
  }

  InputDecoration buildInputDecoration_PASSWORD(hintText,
      [eyeVisible = false]) {
    var outlineInputBorder = OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0),
        borderSide: const BorderSide(
          color: colorPri,
        ));

    return InputDecoration(
      focusedErrorBorder: outlineInputBorder,
      prefixIcon: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: SvgPicture.asset("assets/icons/password.svg"),
      ),
      suffixIcon: eyeVisible
          ? IconButton(
              icon: Icon(
                Icons.remove_red_eye,
                color: !visiblePassword ? Colors.grey : colorPri,
              ),
              onPressed: () {
                setState(() {
                  visiblePassword = !visiblePassword;
                });
              },
            )
          : const SizedBox.shrink(),
      hintText: hintText,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
      border: outlineInputBorder,
      //enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
    );
  }

  @override
  Future register() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      setState(() {
        isLoading = true;
      });
      if (rememberMe) {
        debugPrint("saved");
      }
      await Future.delayed(const Duration(seconds: 1));
      setState(() {
        isLoading = false;
      });
    }
    return null;
  }

  void _showPageLoguin(BuildContext context) {}
}

abstract class RegisterAuth {
  GlobalKey<FormState> formKey = GlobalKey();
  bool rememberMe = false;
  bool visiblePassword = false;
  bool isLoading = false;
  Future register();
}

class InputValidator {
  static String? confirmPasswordText;
  static String? passwordText;
  static String? emailText;
  static String? name;

  static emptyCheck(String msg) {
    return (t) {
      if (t.isEmpty || t == null) return msg;
      return null;
    };
  }

  static String? email(String? t) {
    if (t!.isEmpty) return "Email can't be empty";
    return null;
  }

  static String? password(String? t) {
    if (t!.isEmpty) return "Password can't be empty";
    if (confirmPasswordText != passwordText) return "Password not matched";
    return null;
  }
}
