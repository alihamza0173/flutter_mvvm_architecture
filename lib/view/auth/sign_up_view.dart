import 'package:flutter/material.dart';
import 'package:flutter_mvvm_architecture/configs/components/rounded_button.dart';
import 'package:flutter_mvvm_architecture/configs/routes/routes_name.dart';
import 'package:flutter_mvvm_architecture/configs/utils.dart';
import 'package:flutter_mvvm_architecture/view_model/auth/auth_view_model.dart';
import 'package:provider/provider.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
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
        title: const Text('SignUp'),
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
              title: 'Sign Up',
              isLoading: provider.isLoading,
              onPressed: () {
                Map data = {
                  'email': _emailController.text,
                  'password': _passwordController.text,
                };
                provider.registerApi(data).then((value) {
                  Navigator.pushNamedAndRemoveUntil(
                      context, RouteNames.home, (route) => false);
                }).onError((error, stackTrace) {
                  Utils.snackBar(context, error.toString());
                });
              },
            );
          }),
          TextButton(
            onPressed: () =>
                Navigator.pushReplacementNamed(context, RouteNames.login),
            child: const Text('Already Have an Account? Sign In'),
          ),
        ],
      ),
    );
  }
}
