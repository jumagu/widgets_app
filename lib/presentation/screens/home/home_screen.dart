import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'home_screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter + Material 3'),
      ),
      body: const __HomeView(),
    );
  }
}

class __HomeView extends StatelessWidget {
  const __HomeView();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // physics: BouncingScrollPhysics(),
      itemCount: appMenuItems.length,
      itemBuilder: (context, index) {
        final menuItem = appMenuItems[index];
        return __CustomListTile(menuItem: menuItem);
      },
    );
  }
}

class __CustomListTile extends StatelessWidget {
  final MenuItem menuItem;

  const __CustomListTile({
    required this.menuItem,
  });

  @override
  Widget build(BuildContext context) {
    final themeColors = Theme.of(context).colorScheme;

    return ListTile(
      leading: Icon(menuItem.icon, color: themeColors.primary),
      trailing: Icon(
        Icons.arrow_forward_ios_rounded,
        color: themeColors.primary,
      ),
      title: Text(menuItem.title),
      subtitle: Text(menuItem.subTitle),
      onTap: () {
        // ? Using native navigation
        // Navigator.of(context).push(
        //     MaterialPageRoute(builder: (context) => const ButtonsScreen()));
        // Navigator.pushNamed(context, menuItem.link); // ? Using named routes
        // ? Using go_router library
        context.push(menuItem.link);
        // context.pushNamed();
      },
    );
  }
}
