import 'package:flutter/material.dart';
import 'package:flutter_application_1/localization/app_localizations.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _currentPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _isObscureCurrentPassword = true;
  bool _isObscureNewPassword = true;
  bool _isObscureConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
            localizations?.translate('change_password') ?? 'Change Password'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Current Password Field
              _buildPasswordField(
                controller: _currentPasswordController,
                labelText: localizations?.translate('current_password') ??
                    'Current Password',
                hintText: localizations?.translate('enter_current_password') ??
                    'Enter current password',
                isObscure: _isObscureCurrentPassword,
                toggleObscurity: () => setState(() =>
                    _isObscureCurrentPassword = !_isObscureCurrentPassword),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return localizations?.translate('password_required') ??
                        'Password is required';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),

              // New Password Field
              _buildPasswordField(
                controller: _newPasswordController,
                labelText:
                    localizations?.translate('new_password') ?? 'New Password',
                hintText: localizations?.translate('enter_new_password') ??
                    'Enter new password',
                isObscure: _isObscureNewPassword,
                toggleObscurity: () => setState(
                    () => _isObscureNewPassword = !_isObscureNewPassword),
                validator: (value) {
                  if (value == null || value.length < 6) {
                    return localizations?.translate('password_length_error') ??
                        'Password must be at least 6 characters';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),

              // Confirm Password Field
              _buildPasswordField(
                controller: _confirmPasswordController,
                labelText: localizations?.translate('confirm_password') ??
                    'Confirm Password',
                hintText: localizations?.translate('confirm_new_password') ??
                    'Confirm new password',
                isObscure: _isObscureConfirmPassword,
                toggleObscurity: () => setState(() =>
                    _isObscureConfirmPassword = !_isObscureConfirmPassword),
                validator: (value) {
                  if (value != _newPasswordController.text) {
                    return localizations?.translate('passwords_do_not_match') ??
                        'Passwords do not match';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 30),

              // Change Password Button
              ElevatedButton(
                onPressed: _submitChangePassword,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).secondaryHeaderColor,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  localizations?.translate('change_password') ??
                      'Change Password',
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPasswordField({
    required TextEditingController controller,
    required String labelText,
    required String hintText,
    required bool isObscure,
    required VoidCallback toggleObscurity,
    required String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: isObscure,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        suffixIcon: IconButton(
          icon: Icon(
            isObscure ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: toggleObscurity,
        ),
      ),
      validator: validator,
    );
  }

  void _submitChangePassword() {
    final localizations = AppLocalizations.of(context);
    if (_formKey.currentState!.validate()) {
      // TODO: Implement actual password change logic
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            localizations?.translate('password_changed_success') ??
                'Password changed successfully',
          ),
        ),
      );
    }
  }

  @override
  void dispose() {
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }
}
