import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proyect_actual/pages/login.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> with RegisterAuth {
  static const colorPri = Color.fromARGB(188, 247, 125, 141);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 243, 247, 255),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 61.0,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(0),
                        topRight: Radius.circular(0),
                        bottomRight: Radius.circular(0),
                        bottomLeft: Radius.circular(0)),
                    color: const Color.fromARGB(188, 247, 125, 141),
                    boxShadow: [
                      BoxShadow(
                          spreadRadius: 0,
                          blurRadius: 6,
                          blurStyle: BlurStyle.outer,
                          color: Colors.grey.shade600,
                          offset: const Offset(0, 0))
                    ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text.rich(
                      TextSpan(
                        text: "Have an account? ",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    MaterialButton(
                      color: Colors.white,
                      height: 25,
                      minWidth: double.minPositive,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              topRight: Radius.circular(15.0),
                              bottomLeft: Radius.circular(30.0),
                              bottomRight: Radius.circular(15.0))),
                      onPressed: () {
                        // _showPageLoguin(context);
                        showGeneralDialog(
                          transitionDuration: const Duration(milliseconds: 300),
                          context: context,
                          pageBuilder: ((context, animation,
                                  secondaryAnimation) =>
                              Scaffold(
                                backgroundColor: Colors.transparent,
                                body: Center(
                                  child: SingleChildScrollView(
                                    child: Stack(
                                      children: [
                                        const Card(
                                          margin: EdgeInsets.only(
                                              left: 20,
                                              right: 20,
                                              top: 0,
                                              bottom: 50),
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(25.0))),
                                          child: SizedBox(
                                              height: 510.0,
                                              child: LoginPage()),
                                        ),
                                        Positioned(
                                            left: 0,
                                            right: 0,
                                            bottom: 31.0,
                                            child: SizedBox(
                                              width: 38,
                                              height: 38,
                                              child: FloatingActionButton(
                                                //  elevation: 0,
                                                onPressed: () {
                                                  // print("object");
                                                  Navigator.pop(context);
                                                },
                                                backgroundColor:
                                                    const Color.fromARGB(
                                                        255, 247, 125, 141),
                                                child: const Icon(Icons.close),
                                              ),
                                            )),
                                      ],
                                    ),
                                  ),
                                ),

                                // crossAxisAlignment:
                                //    CrossAxisAlignment.start,
                              )),
                        );
                      },
                      child: const Text(
                        "Log in",
                        style: TextStyle(
                            fontSize: 13,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                            color: colorPri),
                      ),
                    )
                  ],
                ),
              ),
              // const Divider(height: 3.0),
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 35.0, vertical: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: const [
                              Text("Sign up",
                                  style: TextStyle(
                                      fontSize: 32, fontWeight: FontWeight.bold)
                                  // Theme.of(context).textTheme.headlineSmall,
                                  ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 3),
                                child: Icon(
                                  Icons.arrow_downward_rounded,
                                  size: 34,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 25.0),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: TextFormField(
                              cursorColor: colorPri,
                              decoration:
                                  buildInputDecoration("Nombre y apellidos"),
                              validator: InputValidator.emptyCheck(
                                "Campo vacío",
                              ),
                            ),
                          ),
                          // const SizedBox(height: 15.0),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: TextFormField(
                              cursorColor: colorPri,
                              decoration: buildInputDecoration("Email"),
                              validator: InputValidator.email,
                            ),
                          ),
                          //const SizedBox(height: 8.0),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: TextFormField(
                              cursorColor: colorPri,
                              //maxLength: 16,
                              obscureText: visiblePassword,
                              decoration:
                                  buildInputDecoration("Contraseña", true),
                              validator: InputValidator.password,
                              onChanged: (t) {
                                InputValidator.passwordText = t;
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: TextFormField(
                              cursorColor: colorPri,
                              //maxLength: 16,
                              obscureText: visiblePassword,
                              onChanged: (t) {
                                InputValidator.confirmPasswordText = t;
                              },
                              decoration: buildInputDecoration(
                                  "Confirmar contraseña", true),
                              validator: InputValidator.password,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 26.0),
                      child: CheckboxListTile(
                        onChanged: (a) {
                          setState(() {
                            rememberMe = !rememberMe;
                          });
                        },
                        value: rememberMe,
                        controlAffinity: ListTileControlAffinity.leading,
                        title: const Text(
                          "Receive our weekly newsletter and other occasional updates",
                          style: TextStyle(
                            fontSize: 12.0,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 26),
                      child: MaterialButton(
                        height: 55.0,
                        minWidth: MediaQuery.of(context).size.width,
                        color: const Color(0xFFF77D8E),
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
              ),
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration buildInputDecoration(hintText, [eyeVisible = false]) {
    var outlineInputBorder = OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0),
        borderSide: const BorderSide(color: colorPri));

    return InputDecoration(
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

  void _showPageLoguin(BuildContext context) {
    Navigator.of(context).pushNamed("login/");
  }
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
