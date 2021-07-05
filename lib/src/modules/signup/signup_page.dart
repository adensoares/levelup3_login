import 'package:flutter/material.dart';
import 'package:levelup3_login/src/shared/clippers/blue_clipper.dart';
import 'package:levelup3_login/src/shared/validators/form_validators.dart';
import 'package:levelup3_login/src/shared/widgets/shared_widgets.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
bool showPassword = false;

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                ClipPath(
                  clipper: BlueClipper(),
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
                  bottom: 85,
                  right: 30,
                  child: Image.asset(
                    'assets/img/reindeer.png',
                    scale: 15.0,
                  ),
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
                      // CustomTextFormField(
                      //   icon: Icon(
                      //     Icons.person,
                      //     color: Colors.blue.shade300,
                      //   ),
                      //   labelText: "Nome",
                      // ),
                      CustomTextFormField(
                        keyboardType: TextInputType.emailAddress,
                        icon: Icon(
                          Icons.mail,
                          color: Colors.blue.shade300,
                        ),
                        labelText: "E-mail",
                        controller: emailController,
                        validator: (value) {
                          return FormValidators.validateEmail(value);
                        },
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
                        child: Text("Cadastrar"),
                      ),
                      SizedBox(
                        height: 10.0,
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
                          Navigator.pushReplacementNamed(context, "/login");
                        },
                        child: Text("Entre"),
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
