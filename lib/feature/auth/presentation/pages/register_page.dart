import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:shartflix_case/core/init/language/locale_keys.g.dart';
import 'package:shartflix_case/core/init/theme/custom_theme.dart';
import 'package:shartflix_case/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:shartflix_case/feature/auth/presentation/bloc/auth_state.dart';
import 'package:shartflix_case/feature/auth/presentation/pages/mixin/register_page_mixin.dart';
import 'package:shartflix_case/feature/auth/presentation/widgets/auth_button.dart';
import 'package:shartflix_case/feature/auth/presentation/widgets/auth_social_button.dart';
import 'package:shartflix_case/feature/auth/presentation/widgets/auth_text_field.dart';
import 'package:shartflix_case/feature/auth/presentation/widgets/auth_title.dart';
import 'package:shartflix_case/shared/widgets/custom_back_button.dart';

/// Register page for user registration
class RegisterPage extends StatefulWidget {
  /// Constructor
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> with RegisterPageMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
      ),
      body: SafeArea(
        child: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccess) {
              context.go('/home');
            } else if (state is AuthError) {}
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  AuthTitle(
                    title: LocaleKeys.login_auth_title_title.tr(),
                    subtitle: LocaleKeys.login_auth_title_subtitle.tr(),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.05),

                  Column(
                    spacing: 15,
                    children: [
                      // Name Field
                      AuthTextField(
                        controller: nameController,
                        hintText: LocaleKeys.register_auth_register_name.tr(),
                        prefixIcon: SvgPicture.asset(
                          'assets/icons/ic_user.svg',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your name';
                          }
                          if (value.length < 2) {
                            return 'Name must be at least 2 characters';
                          }
                          return null;
                        },
                      ),

                      // Email Field
                      AuthTextField(
                        controller: emailController,
                        hintText: LocaleKeys.register_auth_register_email.tr(),
                        keyboardType: TextInputType.emailAddress,
                        prefixIcon: SvgPicture.asset(
                          'assets/icons/ic_email.svg',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          if (!value.contains('@')) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                      ),

                      // Password Field
                      AuthTextField(
                        controller: passwordController,
                        hintText: LocaleKeys.register_auth_register_password
                            .tr(),
                        isPassword: true,
                        prefixIcon: SvgPicture.asset(
                          'assets/icons/ic_password.svg',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          if (value.length < 6) {
                            return 'Password must be at least 6 characters';
                          }
                          return null;
                        },
                      ),

                      // Confirm Password Field
                      AuthTextField(
                        controller: confirmPasswordController,
                        hintText: LocaleKeys
                            .register_auth_register_confirm_password
                            .tr(),
                        isPassword: true,
                        prefixIcon: SvgPicture.asset(
                          'assets/icons/ic_password.svg',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please confirm your password';
                          }
                          if (value != passwordController.text) {
                            return 'Passwords do not match';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 15, bottom: 40),
                    child: RichText(
                      overflow: TextOverflow.fade,
                      strutStyle: const StrutStyle(height: 1.2),
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: LocaleKeys
                                .register_auth_register_user_agreement
                                .tr(),
                            style: CustomTextTheme.getTextTheme(
                              Theme.of(context).colorScheme,
                            ).titleSmall?.copyWith(color: Colors.grey),
                          ),
                          TextSpan(
                            text: LocaleKeys
                                .register_auth_register_user_agreement_1
                                .tr(),
                            style: Theme.of(context).textTheme.bodySmall
                                ?.copyWith(
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onSurface,
                                  decoration: TextDecoration.underline,
                                  decorationColor: Theme.of(
                                    context,
                                  ).colorScheme.onSurface,
                                  decorationThickness: 2,
                                ),
                          ),
                          TextSpan(
                            text: LocaleKeys
                                .register_auth_register_user_agreement_2
                                .tr(),
                            style: CustomTextTheme.getTextTheme(
                              Theme.of(context).colorScheme,
                            ).titleSmall?.copyWith(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Register Button
                  BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 40),
                        child: AuthButton(
                          text: LocaleKeys.register_auth_register.tr(),
                          onPressed: onRegisterPressed,
                          isLoading: state is AuthLoading,
                        ),
                      );
                    },
                  ),

                  /// Social login buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 10,
                    children: [
                      SocialButton(
                        iconSvgPath: 'assets/icons/ic_google.svg',
                        onPressed: () {},
                      ),
                      SocialButton(
                        iconSvgPath: 'assets/icons/ic_apple.svg',
                        onPressed: () {},
                      ),
                      SocialButton(
                        iconSvgPath: 'assets/icons/ic_facebook.svg',
                        onPressed: () {},
                      ),
                    ],
                  ),

                  // Login Link
                  Padding(
                    padding: const EdgeInsets.only(top: 30, bottom: 10),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: LocaleKeys
                            .register_auth_register_already_have_account
                            .tr(),
                        style: CustomTextTheme.getTextTheme(
                          Theme.of(context).colorScheme,
                        ).titleSmall?.copyWith(color: Colors.grey),
                        children: [
                          const WidgetSpan(
                            child: SizedBox(width: 10),
                          ),
                          TextSpan(
                            text: LocaleKeys.register_auth_register_sign_in
                                .tr(),
                            style: CustomTextTheme.getTextTheme(
                              Theme.of(context).colorScheme,
                            ).titleSmall,
                            recognizer: TapGestureRecognizer()
                              ..onTap = navigateToLogin,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
