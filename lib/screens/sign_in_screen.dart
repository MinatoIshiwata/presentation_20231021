import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:presentation_20231021/extensions/string_extension.dart';
import 'package:presentation_20231021/gen/assets.gen.dart';
import 'package:presentation_20231021/utils/my_colors.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _focusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Material(
          color: Colors.transparent,
          shape: const CircleBorder(),
          child: InkWell(
            customBorder: const CircleBorder(),
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Ink(
              height: 24,
              width: 24,
              padding: const EdgeInsets.all(6),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.transparent,
              ),
              child: Assets.images.leadingButton.svg(),
            ),
          ),
        ),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return GestureDetector(
      onTap: _focusNode.unfocus,
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Focus(
          focusNode: _focusNode,
          child: Form(
            key: _formKey,
            child: _buildLayout(),
          ),
        ),
      ),
    );
  }

  Widget _buildLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 12,
        ),
        Text(
          'Sign in',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(
          height: 12,
        ),
        const SizedBox(
          height: 12,
        ),
        Text(
          'Email address',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(
          height: 12,
        ),
        TextFormField(
          style: Theme.of(context).textTheme.bodyLarge,
          controller: _emailController,
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
            hintText: 'Enter your email address',
          ),
          validator: (value) {
            if (value == null) {
              return null;
            }
            if (value.isEmpty) {
              return 'You need to enter an email address.';
            }
            if (!EmailValidator.validate(value)) {
              return 'There is an error in the email address format. Enter correctly.';
            }
            return null;
          },
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          'Password',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(
          height: 12,
        ),
        TextFormField(
          style: Theme.of(context).textTheme.bodyLarge,
          obscureText: !_isPasswordVisible,
          controller: _passwordController,
          textInputAction: TextInputAction.done,
          decoration: InputDecoration(
            suffixIcon: IconButton(
              onPressed: _changeVisible,
              icon: _isPasswordVisible
                  ? Assets.images.eyeOff.svg(
                      height: 24,
                      width: 24,
                      colorFilter: ColorFilter.mode(
                        MyColors.primary.color,
                        BlendMode.srcIn,
                      ),
                    )
                  : Assets.images.eye.svg(
                      height: 24,
                      width: 24,
                      colorFilter: ColorFilter.mode(
                        MyColors.primary.color,
                        BlendMode.srcIn,
                      ),
                    ),
            ),
            hintText: 'Enter password',
          ),
          validator: (value) {
            const validatorText =
                'Password should be 8 to 30 characters, including symbols, using half-width alphanumeric characters.';
            if (value == null) {
              return null;
            }
            if (value.isEmpty) {
              return validatorText;
            }
            if (value.length < 8) {
              return validatorText;
            }
            if (value.length > 30) {
              return validatorText;
            }
            if (!value.isValidPassword()) {
              return validatorText;
            }
            return null;
          },
        ),
        const SizedBox(
          height: 36,
        ),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton(
            onPressed: () {
              // TODD: API
              // TODD: 遷移
            },
            style: OutlinedButton.styleFrom(
              foregroundColor: MyColors.offWhite.color,
              backgroundColor: MyColors.primary.color,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32),
              ),
              side: BorderSide(color: MyColors.primary.color),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Text(
                'Sign in',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge
                    ?.copyWith(color: MyColors.offWhite.color),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 48,
        ),
        Center(
          child: Column(
            children: [
              Text(
                "If you don't have an account,",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: MyColors.grey600.color,
                    ),
              ),
              TextButton(
                onPressed: () {
                  // TODD: 遷移
                },
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(EdgeInsets.zero),
                  minimumSize: MaterialStateProperty.all(Size.zero),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: Text(
                  'click here',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w400,
                        color: MyColors.grey900.color,
                        decoration: TextDecoration.underline,
                      ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Text(
                'If you forgot your password,',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: MyColors.grey600.color,
                    ),
              ),
              TextButton(
                onPressed: () {
                  // TODD: 遷移
                },
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(EdgeInsets.zero),
                  minimumSize: MaterialStateProperty.all(Size.zero),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: Text(
                  ' click here',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w400,
                        color: MyColors.grey900.color,
                        decoration: TextDecoration.underline,
                      ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _changeVisible() {
    setState(() => _isPasswordVisible = !_isPasswordVisible);
  }
}
