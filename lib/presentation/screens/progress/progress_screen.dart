import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  static const String routeName = 'progress_screen';

  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Progress Indicators'),
      ),
      body: __ProgressView(),
    );
  }
}

class __ProgressView extends StatelessWidget {
  const __ProgressView();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        spacing: 20,
        children: [
          Column(
            spacing: 10,
            children: [
              Text('Circular Progress Indicator'),
              CircularProgressIndicator(
                strokeWidth: 3,
                backgroundColor: Colors.black26,
              ),
            ],
          ),
          Column(
            spacing: 10,
            children: [
              Text('Circular and Linear - Controlled Progress Indicator'),
              _ControlledProgressIndicator(),
            ],
          ),
        ],
      ),
    );
  }
}

class _ControlledProgressIndicator extends StatelessWidget {
  const _ControlledProgressIndicator();

  @override
  Widget build(BuildContext context) {
    // Built in runtime
    return StreamBuilder(
      stream: Stream.periodic(const Duration(milliseconds: 300), (value) {
        return (value * 2) / 100;
      }).takeWhile((value) => value < 100),
      builder: (context, snapshot) {
        final progressValue = snapshot.data ?? 0.0;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            spacing: 20,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                value: progressValue,
                strokeWidth: 3,
                backgroundColor: Colors.black12,
              ),
              // ? Takes all of the available space provided by the parent widget
              Expanded(
                child: LinearProgressIndicator(
                  value: progressValue,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
