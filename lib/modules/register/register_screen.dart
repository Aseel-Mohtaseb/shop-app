import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/modules/login/login_screen.dart';
import 'package:shop_app/modules/register/cubit/cubit.dart';
import 'package:shop_app/shared/styles/colors.dart';
import '../../layout/layout.dart';
import '../../shared/components/components.dart';
import '../../shared/components/constants.dart';
import '../../shared/network/local/cache_helper.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class RegisterScreen extends StatelessWidget {
  var registerFormKey = GlobalKey<FormState>();

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (BuildContext context, RegisterStates state) {
          if (state is RegisterSuccessState) {
              if(state.loginModel.status){
                print(state.loginModel.message);
                CacheHelper.saveData(key: 'token', value: state.loginModel.data?.token).then((value) {
                  token = state.loginModel.data?.token;
                  navigateAndFinish(context, LayoutScreen());
                });
              }
              else {
              print(state.loginModel.message);
              showToast(meg: state.loginModel.message, toastState: ToastStates.error);
            }
          }
        },
        builder: (BuildContext context, RegisterStates state) {
          var registerCubit = RegisterCubit.get(context);
          return Scaffold(
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: registerFormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'REGISTER',
                          style: Theme.of(context)
                              .textTheme
                              .headline4!
                              .copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Register and start shopping.',
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(color: Colors.grey[800]),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        TextFormField(
                          controller: nameController,
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your name';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            hintText: 'Name',
                            prefixIcon: Icon(Icons.email_outlined),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            hintText: 'Email',
                            prefixIcon: Icon(Icons.email_outlined),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: passwordController,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: !registerCubit.isPasswordShown,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: 'Password',
                            prefixIcon: const Icon(Icons.lock_outline),
                            suffixIcon: IconButton(
                                onPressed: () {
                                  registerCubit.showHidePassword();
                                },
                                icon: registerCubit.passwordIcon),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: phoneController,
                          keyboardType: TextInputType.phone,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your phone number';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            hintText: 'Phone',
                            prefixIcon: Icon(Icons.email_outlined),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        MaterialButton(
                          onPressed: () {
                            if (registerFormKey.currentState!.validate()) {
                              print('validate');
                              registerCubit.userRegister(
                                name: nameController.text,
                                email: emailController.text,
                                password: passwordController.text,
                                phone: phoneController.text,
                              );
                            }
                          },
                          color: defaultColor,
                          minWidth: double.infinity,
                          height: 50,
                          child: state is RegisterLoadingState
                              ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : const Text(
                                  'Register',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('You don\'t have account'),
                            TextButton(
                              onPressed: () {
                                navigateAndFinish(context, LoginScreen());
                              },
                              child: Text('LOGIN'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
