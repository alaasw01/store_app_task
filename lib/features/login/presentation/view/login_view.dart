import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:store_app_task/utils/store_app.dart';

part '../../cubit/login_cubit.dart';
part '../../cubit/login_state.dart';
part '../view/widgets/custom_reactive_form_feild.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: BlocProvider(
          create: (context) => LoginCubit(),
          child: BlocBuilder<LoginCubit, LoginState>(
            builder: (context, state) {
              return Center(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        AppImages.login,
                      ),
                      Text(
                        'Login',
                        style: AppStyles.textStyle25.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Your form fields here
                      ReactiveForm(
                        formGroup: context.read<LoginCubit>().form,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              CustomReactiveFormFeild(
                                  icon: Icons.person,
                                  formControlName: 'email',
                                  labelText: 'Email',
                                  validationMessages: context
                                      .read<LoginCubit>()
                                      .emailValidation),
                              const SizedBox(height: 16),
                              CustomReactiveFormFeild(
                                  icon: Icons.lock,
                                  formControlName: 'password',
                                  labelText: 'Password',
                                  obscureText: true,
                                  validationMessages: context
                                      .read<LoginCubit>()
                                      .passwordValidation),
                              const SizedBox(height: 24),
                              ReactiveFormConsumer(
                                builder: (context, form, child) => Center(
                                  child: CustomLoadingButton(
                                    onTap: () => context.go(Routes.home),
                                    text: 'Login',
                                    isLogin: true,
                                    textColor: Colors.white,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
