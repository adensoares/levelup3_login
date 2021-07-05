import 'package:flutter/material.dart';
import 'package:levelup3_login/src/shared/clippers/fog_clipper.dart';
import 'package:levelup3_login/src/shared/clippers/sky_clipper.dart';
import 'package:levelup3_login/src/shared/painters/background_painter.dart';
import 'package:levelup3_login/src/shared/clippers/tree_clipper.dart';
import 'package:levelup3_login/src/shared/validators/form_validators.dart';
import 'package:levelup3_login/src/shared/widgets/shared_widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool showPassword = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                ClipPath(
                  clipper: SkyClipper(),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.blue,
                          Colors.blue.shade300,
                          Colors.blue.shade100,
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 40,
                  left: 20,
                  child: ClipPath(
                    clipper: TreeClipper(),
                    child: Container(
                      height: 100,
                      width: 100,
                      color: Colors.white,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: -7,
                  child: ClipPath(
                    clipper: TreeClipper(),
                    child: Container(
                      height: 100,
                      width: 100,
                      color: Colors.white,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 50,
                  child: ClipPath(
                    clipper: TreeClipper(),
                    child: Container(
                      height: 100,
                      width: 100,
                      color: Colors.white,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 85,
                  right: 30,
                  child: Image.asset(
                    'assets/img/reindeer.png',
                    scale: 15.0,
                  ),
                ),
                Positioned(
                  bottom: 80,
                  right: -60,
                  child: ClipPath(
                    clipper: TreeClipper(),
                    child: Container(
                      height: 100,
                      width: 100,
                      color: Colors.white,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 50,
                  right: -35,
                  child: ClipPath(
                    clipper: TreeClipper(),
                    child: Container(
                      height: 100,
                      width: 100,
                      color: Colors.white,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  width: MediaQuery.of(context).size.width,
                  child: Opacity(
                    opacity: 0.30,
                    child: ClipPath(
                      clipper: FogClipper(),
                      child: Container(
                        height: 200,
                        width: 100,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                CustomPaint(
                  painter: BackgroundPainter(),
                ),
              ],
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 50.0,
                  right: 50.0,
                  bottom: 50.0,
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      CustomTextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                        validator: (value) {
                          return FormValidators.validateEmail(value);
                        },
                        icon: Icon(
                          Icons.mail,
                          color: Colors.blue.shade300,
                        ),
                        labelText: "E-mail",
                      ),
                      CustomTextFormField(
                        icon: Icon(
                          Icons.lock,
                          color: Colors.blue.shade300,
                        ),
                        labelText: "Senha",
                        controller: passwordController,
                        validator: (value) {
                          return FormValidators.validatePassword(value);
                        },
                        obscureText: showPassword,
                        suffixIcon: ToggleVisibility(
                          visible: showPassword,
                          onPressed: () {
                            setState(() {
                              showPassword = !showPassword;
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        height: 25.0,
                      ),
                      PrimaryButton(
                        onPressed: () {
                          bool? validation = _formKey.currentState?.validate();
                          if (validation ?? false) {
                            print("Valido");
                          } else {
                            print("Invalido");
                          }
                        },
                        child: Text("Entrar"),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pushReplacementNamed(
                                  context, "/signup");
                            },
                            child: Text(
                              "Esqueceu a senha?",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue.shade900,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(children: <Widget>[
                        Expanded(
                          child: new Container(
                              margin: const EdgeInsets.only(
                                  left: 10.0, right: 20.0),
                              child: Divider(
                                color: Colors.grey,
                                height: 36,
                              )),
                        ),
                        Text(
                          "Ou",
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold),
                        ),
                        Expanded(
                          child: new Container(
                              margin: const EdgeInsets.only(
                                  left: 20.0, right: 10.0),
                              child: Divider(
                                color: Colors.grey,
                                height: 36,
                              )),
                        ),
                      ]),
                      SizedBox(
                        height: 10.0,
                      ),
                      SecondaryButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, "/signup");
                        },
                        child: Text("Cadastre-se"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
