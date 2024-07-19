import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:delivery/auth/crud.dart';
import 'package:delivery/auth/link_api.dart';
import 'package:delivery/auth/valid.dart';
import 'package:delivery/main.dart';
import 'package:delivery/screen/homepage.dart';
import 'package:delivery/widgets/CustomButon.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final Crud crud = Crud();

  Future<void> login() async {
    if (formKey.currentState!.validate()) {
      final Map<String, dynamic>? response = await crud.postRequest(
        linkLogin,
        {
          "dlv_email": emailController.text,
          "dlv_password": passwordController.text,
        },
      );

      if (response != null && response['status'] == "success") {
        sharedPref.setString("id", response['data']['id'].toString());
        sharedPref.setString("dlv_email", response['data']['dlv_email']);

        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) =>  HomePage()));
      } else {
        // ignore: use_build_context_synchronously
        AwesomeDialog(
          context: context,
          // btnCancel: const Text("Cancel"),
          title: "Error",
          body: const Text(
              "Error in email and password or account does not exist"),
        ).show();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            alignment: Alignment.bottomCenter,
            image: AssetImage("assets/OBJECTS.png"),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                const SizedBox(height: 50),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Log in to your Account',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontFamily: 'Akshar',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 360,
                  height: 28,
                  child: Opacity(
                    opacity: 0.50,
                    child: Center(
                      child: Text(
                        'Welcome Back! Select method to log in:',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontFamily: 'Akshar',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.email_outlined),
                    hintText: 'Email',
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0xFF9394AF),
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  validator: (value) {
                    return validInput(value!, 3, 50);
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock_outline),
                    hintText: 'Password',
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0xFF9394AF),
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  validator: (value) {
                    return validInput(value!, 4, 20);
                  },
                ),
                const SizedBox(height: 20),
                CustomButon(
                  onPressed: () async {
                    await login();
                  },
                  text: 'Log in',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
