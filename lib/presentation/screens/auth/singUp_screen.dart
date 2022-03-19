import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:interview_newstartup/core/core.dart';
import 'package:interview_newstartup/presentation/provider/provider.dart';
import 'package:interview_newstartup/presentation/routers/router.gr.dart';
import 'package:provider/provider.dart';

class SingUpScreen extends StatefulWidget {
  const SingUpScreen({Key? key}) : super(key: key);

  @override
  State<SingUpScreen> createState() => _SingUpScreenState();
}

class _SingUpScreenState extends State<SingUpScreen> {
  final formGlobalKey = GlobalKey<FormState>();

  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool _isPasswordVisible = true;

  @override
  Widget build(BuildContext context) {
    CounterProvider _counterProvider = Provider.of<CounterProvider>(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Form(
              key: formGlobalKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'Create Account',
                    style: AppStyle.headline4,
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  Text(
                    'Email',
                    style: AppStyle.bodyText1.copyWith(
                      color: AppColor.lightColorScheme.secondary,
                    ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  TextFormField(
                    controller: _email,
                    style: AppStyle.caption.copyWith(),
                    validator: (value) {
                      if (value!.trim().isEmpty) {
                        return 'Empty InputField';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.email,
                        color: AppColor.lightColorScheme.onBackground,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          10.0,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          10.0,
                        ),
                        borderSide: BorderSide(
                          color: AppColor.lightColorScheme.primary,
                          width: 1.0,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          10.0,
                        ),
                        borderSide: BorderSide(
                          color: AppColor.lightColorScheme.primary,
                          width: 4.0,
                        ),
                      ),
                      errorStyle: AppStyle.subtitle1.copyWith(
                        color: AppColor.lightColorScheme.error,
                      ),
                      hintText: 'Enter your email',
                      filled: true,
                      fillColor: AppColor.lightColorScheme.onInverseSurface,
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  Text(
                    'Password',
                    style: AppStyle.bodyText1.copyWith(
                      color: AppColor.lightColorScheme.secondary,
                    ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  TextFormField(
                    controller: _password,
                    style: AppStyle.caption.copyWith(),
                    obscureText: _isPasswordVisible,
                    validator: (value) {
                      if (value!.trim().isEmpty) {
                        return 'Empty InputField';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.lock,
                        color: AppColor.lightColorScheme.onBackground,
                      ),
                      suffixIcon: InkResponse(
                        onTap: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                        child: Icon(
                          _isPasswordVisible == false
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: AppColor.lightColorScheme.onBackground,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          10.0,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          10.0,
                        ),
                        borderSide: BorderSide(
                          color: AppColor.lightColorScheme.primary,
                          width: 1.0,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          10.0,
                        ),
                        borderSide: BorderSide(
                          color: AppColor.lightColorScheme.primary,
                          width: 4.0,
                        ),
                      ),
                      errorStyle: AppStyle.subtitle1.copyWith(
                        color: AppColor.lightColorScheme.error,
                      ),
                      hintText: 'Enter your password',
                      filled: true,
                      fillColor: AppColor.lightColorScheme.onInverseSurface,
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  GestureDetector(
                    onTap: () async {
                      if (formGlobalKey.currentState!.validate()) {
                        _counterProvider
                            .registerUser(
                          email: _email.text,
                          password: _password.text,
                        )
                            .then(
                          (value) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: value != 'Successful'
                                    ? AppColor.lightColorScheme.errorContainer
                                    : AppColor
                                        .lightColorScheme.secondaryContainer,
                                content: Text(
                                  value,
                                  style: AppStyle.bodyText1.copyWith(
                                    color: value != 'Successful'
                                        ? AppColor.lightColorScheme.error
                                        : AppColor.lightColorScheme.secondary,
                                  ),
                                ),
                              ),
                            );

                            if (value == 'Successful') {
                              context.router.push(
                                const SingInScreen(),
                              );
                            }
                          },
                        );
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10.0,
                        vertical: 15.0,
                      ),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: AppColor.lightColorScheme.primary,
                      ),
                      child: Text(
                        'Sign Up',
                        textAlign: TextAlign.center,
                        style: AppStyle.headline5.copyWith(
                          color: AppColor.lightColorScheme.onPrimary,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: RichText(
                text: TextSpan(
                  text: 'Already have an account?',
                  style: AppStyle.headline6.copyWith(
                    color: AppColor.lightColorScheme.secondary,
                  ),
                  children: [
                    TextSpan(
                      text: ' Sign In',
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => context.router.push(
                              const SingInScreen(),
                            ),
                      style: AppStyle.headline6.copyWith(
                        color: AppColor.lightColorScheme.primary,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
