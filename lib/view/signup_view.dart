import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../res/components/round_button.dart';
import '../utils/utils.dart';
import '../view_model/auth_view_model.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  ValueNotifier<bool> _obsecurepassword = ValueNotifier<bool>(true);

  // controller bna rhe h , jo v dat crete krenge vh controller k andar staore ho jayega
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  // focuse ke liye
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();

    emailFocusNode.dispose();
    passwordFocusNode.dispose();

    _obsecurepassword.dispose();
  }
  Widget build(BuildContext context) {
    final authViewMode = Provider.of<AuthViewModel>(context);
    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      appBar: AppBar(title: Text('login'), centerTitle: true),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              // comtroller ko call kiye h
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              focusNode: emailFocusNode,
              decoration: const InputDecoration(
                hintText: 'Email',
                labelText: 'Email',
                prefixIcon: Icon(Icons.alternate_email),
              ),
              // jb mail done ho jayega to automatic password vale textfield p focus ho jayega
              onFieldSubmitted: (value) {
                // focus k liye
                Utils.fieldFocusChange(
                  context,
                  emailFocusNode,
                  passwordFocusNode,
                );
              },
            ),
            // ValueListenableBuilder ki help value notifier ka use krenge
            ValueListenableBuilder(
              valueListenable: _obsecurepassword,
              builder: (context, value, child) {
                return TextFormField(
                  // comtroller ko call kiye h
                  controller: _passwordController,
                  obscureText: _obsecurepassword.value,
                  focusNode: passwordFocusNode,
                  // es form m hide hoga
                  obscuringCharacter: "*",
                  decoration: InputDecoration(
                    hintText: 'Password',
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.password_sharp),
                    suffixIcon: InkWell(
                      onTap: () {
                        // icon pe click krne p hide ur show hoga
                        _obsecurepassword.value = !_obsecurepassword.value;
                      },

                      child: Icon(
                        // _obsecurepassword.value se icon change hoga
                        _obsecurepassword.value
                            ? Icons.visibility_off_outlined
                            : Icons.visibility,
                      ),
                    ),
                  ),
                );
              },
            ),

            SizedBox(height: height * .1),
            // round buttton jo bnye te vhi call kiye h
            RoundButton(
              title: 'Login',
              loading: authViewMode.loading,
              onPress: () {
                // agr bina details ke user buttton press kiya  to ms aayega
                if (_emailController.text.isEmpty) {
                  Utils.flushBarErrorMessage('Please enter email', context);
                } else if (_passwordController.text.isEmpty) {
                  Utils.flushBarErrorMessage('Please enter password', context);
                } else {
                  Map data = {
                    'email' :  _emailController.text.toString(),
                    'password' : _passwordController.text.toString(),
                  };
                  // loginapi ko call krne k liye
                  authViewMode.loginApi(data, context);
                  print('api hit is done');
                }
              },
            ),

            SizedBox(height: height * .02),

            InkWell(child: Text("Don't have an account? sign up"))
          ],
        ),
      ),
    );
  }
}
