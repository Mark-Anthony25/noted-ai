import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:corvus/core/constants/colors.dart';
import 'package:corvus/core/constants/dimensions.dart';
import 'package:corvus/core/constants/spacing.dart';
import 'package:corvus/core/theme/text_styles.dart';
import 'package:corvus/shared/widgets/corvus_button.dart';
import 'package:corvus/shared/widgets/corvus_text_field.dart';
import 'package:lucide_icons/lucide_icons.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(Spacing.xxl),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: Spacing.page),
              Text(
                'Welcome back',
                style: AppTextStyles.displayMedium,
              ),
              const SizedBox(height: Spacing.sm),
              Text(
                'Sign in to continue with Corvus',
                style: AppTextStyles.bodyLarge.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: Spacing.xxxxl),
              CorvusTextField(
                label: 'Email',
                hintText: 'alex@corvus.app',
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                prefixIcon: const Icon(
                  LucideIcons.mail,
                  size: 18,
                  color: AppColors.textTertiary,
                ),
              ),
              const SizedBox(height: Spacing.xl),
              CorvusTextField(
                label: 'Password',
                hintText: 'Enter your password',
                controller: _passwordController,
                isPassword: _obscurePassword,
                prefixIcon: const Icon(
                  LucideIcons.lock,
                  size: 18,
                  color: AppColors.textTertiary,
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscurePassword ? LucideIcons.eyeOff : LucideIcons.eye,
                    size: 18,
                    color: AppColors.textTertiary,
                  ),
                  onPressed: () {
                    setState(() => _obscurePassword = !_obscurePassword);
                  },
                ),
              ),
              const SizedBox(height: Spacing.sm),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Forgot password?',
                    style: AppTextStyles.labelMedium.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: Spacing.xl),
              CorvusButton(
                label: 'Sign In',
                onPressed: () => context.go('/home'),
              ),
              const SizedBox(height: Spacing.xl),
              Row(
                children: [
                  const Expanded(child: Divider()),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: Spacing.lg,
                    ),
                    child: Text(
                      'or continue with',
                      style: AppTextStyles.labelSmall,
                    ),
                  ),
                  const Expanded(child: Divider()),
                ],
              ),
              const SizedBox(height: Spacing.xl),
              _socialButton(
                icon: LucideIcons.monitor,
                label: 'Google',
                onPressed: () => context.go('/home'),
              ),
              const SizedBox(height: Spacing.sm),
              _socialButton(
                icon: LucideIcons.apple,
                label: 'Apple',
                onPressed: () => context.go('/home'),
              ),
              const SizedBox(height: Spacing.xxxxl),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account? ",
                    style: AppTextStyles.bodyMedium,
                  ),
                  GestureDetector(
                    onTap: () => context.go('/sign-up'),
                    child: Text(
                      'Sign Up',
                      style: AppTextStyles.labelLarge.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _socialButton({
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      width: double.infinity,
      height: Dimensions.buttonMd,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: AppColors.border),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimensions.radiusMd),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 18, color: AppColors.textSecondary),
            const SizedBox(width: Spacing.sm),
            Text(
              label,
              style: AppTextStyles.button.copyWith(
                color: AppColors.textPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
