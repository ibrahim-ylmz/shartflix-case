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
import 'package:shartflix_case/feature/auth/presentation/pages/mixin/login_page_mixin.dart';
import 'package:shartflix_case/feature/auth/presentation/widgets/auth_button.dart';
import 'package:shartflix_case/feature/auth/presentation/widgets/auth_social_button.dart';
import 'package:shartflix_case/feature/auth/presentation/widgets/auth_text_field.dart';
import 'package:shartflix_case/feature/auth/presentation/widgets/auth_title.dart';

/// Login page for user authentication
class LoginPage extends StatefulWidget {
  /// Constructor
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with LoginPageMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccess) {
              context.go('/home');
            } else if (state is AuthError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  /// Auth title
                  AuthTitle(
                    title: LocaleKeys.login_auth_title_title.tr(),
                    subtitle: LocaleKeys.login_auth_title_subtitle.tr(),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.05),

                  /// Email and password text fields
                  Column(
                    spacing: 15,
                    children: [
                      /// Email text field
                      AuthTextField(
                        controller: emailController,
                        hintText: LocaleKeys.login_auth_email.tr(),
                        keyboardType: TextInputType.emailAddress,
                        prefixIcon: SvgPicture.asset(
                          'assets/icons/ic_email.svg',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {}
                          return null;
                        },
                      ),

                      /// Password text field
                      AuthTextField(
                        isPassword: true,
                        prefixIcon: SvgPicture.asset(
                          'assets/icons/ic_password.svg',
                        ),
                        controller: passwordController,
                        hintText: LocaleKeys.login_auth_password.tr(),
                        validator: (value) {
                          if (value == null || value.isEmpty) {}
                          return null;
                        },
                      ),
                    ],
                  ),

                  /// Forget password
                  Padding(
                    padding: const EdgeInsets.only(top: 30, bottom: 30),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: GestureDetector(
                        onTap: () {},
                        child: Text(
                          LocaleKeys.login_auth_forget_password.tr(),
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(
                                decoration: TextDecoration.underline,
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                        ),
                      ),
                    ),
                  ),

                  /// Login button
                  BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 40),
                        child: AuthButton(
                          text: LocaleKeys.login_auth_login.tr(),
                          onPressed: onLoginPressed,
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

                  /// Don't have an account text
                  Padding(
                    padding: const EdgeInsets.only(top: 30, bottom: 10),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: LocaleKeys.login_auth_dont_have_account.tr(),
                        style: CustomTextTheme.getTextTheme(
                          Theme.of(context).colorScheme,
                        ).titleSmall?.copyWith(color: Colors.grey),
                        children: [
                          const WidgetSpan(
                            child: SizedBox(width: 10),
                          ),
                          TextSpan(
                            text: LocaleKeys.login_auth_sign_up.tr(),
                            style: CustomTextTheme.getTextTheme(
                              Theme.of(context).colorScheme,
                            ).titleSmall,
                            recognizer: TapGestureRecognizer()
                              ..onTap = navigateToRegister,
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
