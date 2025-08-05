import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const String routeName = 'snackbar_screen';

  const SnackbarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();

    final SnackBar snackbar = SnackBar(
      content: const Text('Hola mundo'),
      action: SnackBarAction(label: 'OK', onPressed: () {}),
      duration: const Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  void openDialog(BuildContext context) {
    // ? Seeing a builder means that it going to be built in runtime
    showDialog(
      context: context,
      barrierDismissible: false, // ? Blocks the outside touch close
      builder: (context) => AlertDialog(
        title: const Text('Are you sure'),
        content: const Text(
          'Laboris minim nisi enim aliquip sunt id nulla incididunt nostrud id laboris id consequat deserunt.',
        ),
        actions: [
          TextButton(
            onPressed: () => context.pop(),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () => context.pop(),
            child: const Text('Confirm'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbars and Dialogs'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              onPressed: () {
                // ? Built-in dialog to show a list of used libraries in the app and its info
                showAboutDialog(
                  context: context,
                  children: [
                    const Text(
                      'Magna irure do esse incididunt ex sit ad cupidatat esse sunt laborum.',
                    ),
                  ],
                );
              },
              child: const Text('Used Licenses'),
            ),
            FilledButton.tonal(
              onPressed: () => openDialog(context),
              child: const Text('Show Dialog'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showCustomSnackbar(context),
        label: const Text('Show snackbar'),
        icon: Icon(Icons.remove_red_eye_outlined),
      ),
    );
  }
}
