import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/theme.dart';
import '../../../../core/errors/app_failure.dart';
import '../controllers/auth_controller.dart';
import '../widgets/auth_scaffold.dart';

class SignupScreen extends ConsumerStatefulWidget {
  const SignupScreen({super.key});

  @override
  ConsumerState<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends ConsumerState<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authControllerProvider);
    final isLoading = authState.isLoading;

    return AuthScaffold(
      title: 'Buat akun latihan',
      subtitle: 'Simpan progres latihan dan rekomendasi AI personal.',
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _nameController,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(labelText: 'Nama'),
              validator: _requiredName,
            ),
            const SizedBox(height: AppSpacing.sm),
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(labelText: 'Email'),
              validator: _requiredEmail,
            ),
            const SizedBox(height: AppSpacing.sm),
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              textInputAction: TextInputAction.done,
              decoration: const InputDecoration(labelText: 'Password'),
              validator: _requiredPassword,
              onFieldSubmitted: (_) => _submit(),
            ),
            const SizedBox(height: AppSpacing.sm),
            if (authState.hasError) _AuthErrorText(error: authState.error),
            const SizedBox(height: AppSpacing.sm),
            FilledButton(
              onPressed: isLoading ? null : _submit,
              child: isLoading
                  ? const SizedBox.square(
                      dimension: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Text('Daftar'),
            ),
            TextButton(
              onPressed: isLoading ? null : () => context.go('/login'),
              child: const Text('Sudah punya akun? Masuk'),
            ),
          ],
        ),
      ),
    );
  }

  String? _requiredName(String? value) {
    if ((value ?? '').trim().length < 2) {
      return 'Nama minimal 2 karakter.';
    }
    return null;
  }

  String? _requiredEmail(String? value) {
    final email = value?.trim() ?? '';
    if (email.isEmpty) {
      return 'Email wajib diisi.';
    }
    if (!email.contains('@')) {
      return 'Email belum valid.';
    }
    return null;
  }

  String? _requiredPassword(String? value) {
    if ((value ?? '').length < 6) {
      return 'Password minimal 6 karakter.';
    }
    return null;
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    await ref
        .read(authControllerProvider.notifier)
        .signUp(
          name: _nameController.text,
          email: _emailController.text.trim(),
          password: _passwordController.text,
        );
  }
}

class _AuthErrorText extends StatelessWidget {
  const _AuthErrorText({required this.error});

  final Object? error;

  @override
  Widget build(BuildContext context) {
    final authError = error;
    final message = authError is AppFailure
        ? authError.message
        : 'Pendaftaran belum berhasil. Coba lagi.';

    return Text(
      message,
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
        color: AppColors.error,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
