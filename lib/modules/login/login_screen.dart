import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/modules/login/cubit/cubit.dart';
import 'package:shop_app/modules/login/cubit/states.dart';
import 'package:shop_app/shared/styles/colors.dart';

class LoginScreen extends StatelessWidget {

  var loginFormKey = GlobalKey<FormState>();

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (BuildContext context, LoginStates state) {},
        builder: (BuildContext context, LoginStates state) {
          var loginCubit = LoginCubit.get(context);
          return Scaffold(
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: loginFormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'LOGIN',
                          style: Theme
                              .of(context)
                              .textTheme
                              .headline4!
                              .copyWith(color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Discover a world of products at your fingertips. Login and start shopping.',
                          style: Theme
                              .of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(color: Colors.grey[800]),
                        ),
                        SizedBox(
                          height: 40,
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
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.length < 6) {
                              return 'Password should be 6 characters at least';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            hintText: 'Password',
                            prefixIcon: Icon(Icons.lock_outline),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        MaterialButton(
                          onPressed: () {
                            if (loginFormKey.currentState!.validate()){
                              print('validate');
                              loginCubit.userLogin(email: emailController.text,
                                  password: passwordController.text);
                            }
                            // print('not valid');

                          },
                          child: Text(
                            'LOGIN',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          color: defaultColor,
                          minWidth: double.infinity,
                          height: 50,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('You don\'t have account'),
                            TextButton(
                              onPressed: () {},
                              child: Text('REGISTER'),
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
