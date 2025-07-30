import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {
  static const String routeName = 'buttons_screen';

  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons Screen'),
      ),
      body: const _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back_ios_new_rounded),
        onPressed: () {
          context.pop(); // Navigates back
        },
      ),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView();

  @override
  Widget build(BuildContext context) {
    final themeColors = Theme.of(context).colorScheme;

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Wrap(
          spacing: 10,
          crossAxisAlignment: WrapCrossAlignment.center,
          alignment: WrapAlignment.center,
          children: [
            ElevatedButton(onPressed: () {}, child: const Text('Elevated')),
            const ElevatedButton(
                onPressed: null, child: Text('Elevated disabled')),
            ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.access_alarm_rounded),
                label: const Text('Elevated icon')),
            FilledButton(onPressed: () {}, child: const Text('Filled')),
            FilledButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.accessibility_new),
                label: const Text('Filled icon')),
            OutlinedButton(onPressed: () {}, child: const Text('Outlined')),
            OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.youtube_searched_for_rounded),
                label: const Text('Outlined icon')),
            TextButton(onPressed: () {}, child: const Text('Text')),
            TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.radar_outlined),
                label: const Text('Text icon')),
            IconButton(onPressed: () {}, icon: Icon(Icons.app_registration)),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.person_add_disabled_rounded,
                color: Colors.white,
              ),
              style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(themeColors.primary)
                  // backgroundColor: WidgetStateProperty.resolveWith<Color>(
                  //   (states) {
                  //     if (states.contains(WidgetState.pressed)) {
                  //       return themeColors.secondary;
                  //     }
                  //     return themeColors.primary;
                  //   },
                  // )
                  ),
            ),
            const CustomButton()
          ],
        ),
      ),
    );
  }
}

// ? This is just a way to create a custom button. Not the only one.
class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    final themeColors = Theme.of(context).colorScheme;

    return ClipRRect(
      borderRadius: BorderRadius.circular(120),
      child: Material(
        color: themeColors.primary,
        child: InkWell(
          // ? Like a gesture detector
          onTap: () {},
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                'hello',
                style: TextStyle(color: Colors.white),
              )),
        ),
      ),
    );
  }
}
