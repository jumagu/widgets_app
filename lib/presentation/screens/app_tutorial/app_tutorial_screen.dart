import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo(this.title, this.caption, this.imageUrl);
}

final slides = <SlideInfo>[
  SlideInfo(
    'Search the food',
    'Eu do irure veniam pariatur do labore sint sit duis ut velit ut esse.',
    'assets/images/1.png',
  ),
  SlideInfo(
    'Fast delivery',
    'Deserunt aliqua sunt ullamco magna deserunt culpa enim amet et adipisicing laborum adipisicing.',
    'assets/images/2.png',
  ),
  SlideInfo(
    'Enjoy your food',
    'Deserunt commodo eu et sit ut qui ex consectetur.',
    'assets/images/3.png',
  ),
];

class AppTutorialScreen extends StatefulWidget {
  static const String routeName = 'tutorial_screen';

  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  final PageController pageViewController = PageController();
  bool endReached = false;

  @override
  void initState() {
    super.initState();
    pageViewController.addListener(
      () {
        // print('${pageViewController.page}');
        final page = pageViewController.page ?? 0;
        if (!endReached && page >= (slides.length - 1.5)) {
          setState(() {
            endReached = true;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: pageViewController,
            physics: BouncingScrollPhysics(),
            children: slides
                .map(
                  (slideData) => _Slide(
                    title: slideData.title,
                    caption: slideData.caption,
                    imageUrl: slideData.imageUrl,
                  ),
                )
                .toList(),
          ),
          Positioned(
            right: 20,
            top: 50,
            child: TextButton(
              child: const Text('Exit'),
              onPressed: () => context.pop(),
            ),
          ),
          endReached
              ? Positioned(
                  bottom: 30,
                  right: 20,
                  child: FadeInRight(
                    from: 15,
                    delay: const Duration(milliseconds: 500),
                    child: FilledButton(
                      child: const Text('Start'),
                      onPressed: () => context.pop(),
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;

  const _Slide({
    required this.title,
    required this.caption,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final TextStyle? titleStyle = Theme.of(context).textTheme.titleLarge;
    final TextStyle? captionStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          spacing: 10,
          mainAxisAlignment: MainAxisAlignment.center, // Vertical Alignment
          crossAxisAlignment: CrossAxisAlignment.start, // Horiz Alignment
          children: [
            Image(
              image: AssetImage(imageUrl),
            ),
            Text(
              title,
              style: titleStyle,
            ),
            Text(
              caption,
              style: captionStyle,
            ),
          ],
        ),
      ),
    );
  }
}
