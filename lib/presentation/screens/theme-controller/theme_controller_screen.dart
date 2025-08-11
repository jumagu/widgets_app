import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class ThemeControllerScreen extends ConsumerWidget {
  static const String routeName = 'theme_controller_screen';

  const ThemeControllerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isDarkMode = ref.watch(themeNotifierProvider).isDarkMode;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Controller'),
        actions: [
          IconButton(
            icon: Icon(
              isDarkMode ? Icons.dark_mode_outlined : Icons.light_mode_outlined,
            ),
            onPressed: () {
              // ref.read(isDarkModeProvider.notifier).update((state) => !state);
              ref.read(themeNotifierProvider.notifier).toggleDarkMode();
            },
          ),
        ],
      ),
      body: const _ThemeControllerView(),
    );
  }
}

class _ThemeControllerView extends ConsumerWidget {
  const _ThemeControllerView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Color> colors = ref.watch(colorListProvider);
    // final int selectedColor = ref.watch(selectedColorProvider);
    final int selectedColor = ref.watch(themeNotifierProvider).selectedColor;

    return ListView.builder(
      itemCount: colors.length,
      itemBuilder: (context, index) {
        final color = colors[index];
        return RadioListTile(
          fillColor: WidgetStatePropertyAll(color),
          title: Text('This color', style: TextStyle(color: color)),
          value: index,
          groupValue: selectedColor,
          onChanged: (value) {
            // ref
            //     .read(selectedColorProvider.notifier)
            //     .update((state) => state = value!);
            ref.read(themeNotifierProvider.notifier).changeColorIndex(value!);
          },
        );
      },
    );
  }
}
