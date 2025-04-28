import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:store_app_task/contants/constants.dart';
import 'package:store_app_task/features/login/data/data_sources/remote_data_source.dart';
import 'package:store_app_task/features/login/data/repos/login_repo_impl.dart';
import 'package:store_app_task/features/login/domain/repos/login_repo.dart';
import 'package:store_app_task/features/login/domain/use_cases/login_use_case.dart';
import 'package:store_app_task/shared_widgets/custom_material_button.dart';
import 'package:store_app_task/utils/cache_helper.dart';
import 'package:store_app_task/utils/store_app.dart';

part '../cubit/login_cubit.dart';
part '../cubit/login_state.dart';
part '../view/widgets/custom_reactive_form_feild.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: BlocProvider(
          create: (context) => LoginCubit(LoginUseCase(LoginRepoImpl(
            loginRemoteDataSource: LoginRemoteDataSourceImpl(),
          ))),
          child: BlocConsumer<LoginCubit, LoginState>(
            listener: (context, state) {
              if (state is LoginFailed) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      state.errorMessage ?? '',
                      style: AppStyles.textStyle18.copyWith(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
            builder: (context, state) {
              return Center(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(AppImages.login),
                      Text(
                        'Login',
                        style: AppStyles.textStyle25.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
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
                                validationMessages:
                                    context.read<LoginCubit>().emailValidation,
                              ),
                              const SizedBox(height: 16),
                              CustomReactiveFormFeild(
                                icon: Icons.lock,
                                formControlName: 'password',
                                labelText: 'Password',
                                obscureText: true,
                                validationMessages: context
                                    .read<LoginCubit>()
                                    .passwordValidation,
                              ),
                              const SizedBox(height: 24),
                              if (state is LoginLoading)
                                const SizedBox(
                                  width: 30,
                                  height: 30,
                                  child: Center(
                                    child: CircularProgressIndicator(
                                      color: AppColors.darkGreenColor,
                                    ),
                                  ),
                                )
                              else
                                Center(
                                  child: SizedBox(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.8,
                                    child: CustomMaterialButton(
                                      onPressed: () => context
                                          .read<LoginCubit>()
                                          .login(context),
                                      title: 'Login',
                                    ),
                                  ),
                                ),
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
