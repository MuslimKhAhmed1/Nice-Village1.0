import 'package:flutter/material.dart';
import 'package:flutter_application_1/Localization/app_localizations.dart';

class DeleteDialog extends StatelessWidget {
  const DeleteDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AlertDialog(
      backgroundColor: theme.scaffoldBackgroundColor,
      title: Text(
        AppLocalizations.of(context)?.translate('delete_message') ?? 'Delete',
        style: theme.textTheme.titleLarge,
      ),
      content: Text(
        AppLocalizations.of(context)?.translate('delete_message') ??
            ' delete the notification?',
        style: theme.textTheme.bodyMedium,
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            AppLocalizations.of(context)?.translate('cancel') ?? 'Cancel',
            style: theme.textTheme.labelLarge,
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            AppLocalizations.of(context)?.translate('delete') ?? 'delete',
            style: theme.textTheme.labelLarge?.copyWith(color: Colors.red),
          ),
        ),
      ],
    );
  }
}
