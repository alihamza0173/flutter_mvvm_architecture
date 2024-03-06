import 'package:flutter/material.dart';
import 'package:flutter_mvvm_architecture/res/components/rounded_button.dart';
import 'package:flutter_mvvm_architecture/utils/routes/routes_name.dart';
import 'package:flutter_mvvm_architecture/utils/utils.dart';
import 'package:flutter_mvvm_architecture/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  // Email Field
  final TextEditingController _emailController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();

  // Password Field
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _passwordFocusNode = FocusNode();
  final ValueNotifier _obsecureText = ValueNotifier<bool>(true);

  @override
  void dispose() {
    _emailController.dispose();
    _emailFocusNode.dispose();
    _passwordController.dispose();
    _passwordFocusNode.dispose();
    _obsecureText.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Email TextField
          TextField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            focusNode: _emailFocusNode,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.alternate_email),
            ),
            onSubmitted: (value) => Utils.fieldFocusChange(
              context,
              _emailFocusNode,
              _passwordFocusNode,
            ),
          ),
          // Password TextField
          ValueListenableBuilder(
              valueListenable: _obsecureText,
              builder: (context, value, child) {
                return TextField(
                  controller: _passwordController,
                  obscureText: _obsecureText.value,
                  keyboardType: TextInputType.visiblePassword,
                  focusNode: _passwordFocusNode,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: InkWell(
                      onTap: () => _obsecureText.value = !_obsecureText.value,
                      child: Icon(
                        _obsecureText.value
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                      ),
                    ),
                  ),
                );
              }),
          SizedBox(height: height * 0.085),
          Builder(builder: (context) {
            final provider = context.watch<AuthViewModel>();
            return RoundedButton(
              title: 'Login',
              isLoading: provider.isLoading,
              onPressed: () {
                // eve.holt@reqres.in
                // cityslicka
                Map data = {
                  'email': _emailController.text,
                  'password': _passwordController.text,
                };
                provider.loginApi(context, data);
              },
            );
          }),
          TextButton(
            onPressed: () =>
                Navigator.pushReplacementNamed(context, RouteNames.signUp),
            child: const Text('Don\'nt Have an Account? Sign Up'),
          ),
        ],
      ),
    );
  }
}
