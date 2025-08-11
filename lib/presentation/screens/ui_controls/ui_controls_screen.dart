import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  static const String routeName = 'ui_controls_screen';

  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UI Controls'),
      ),
      body: _UiControlsView(),
    );
  }
}

class _UiControlsView extends StatefulWidget {
  const _UiControlsView();

  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

enum Transportation { car, plane, boat, submarine }

class _UiControlsViewState extends State<_UiControlsView> {
  bool isDeveloper = false;

  Transportation selectedTransportation = Transportation.car;

  bool wantsLuch = false;
  bool wantsBreakfast = false;
  bool wantsDinner = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
          title: const Text('Developer Mode'),
          subtitle: const Text('Additional controls'),
          value: isDeveloper,
          onChanged: (value) {
            setState(() {
              isDeveloper = !isDeveloper;
            });
          },
        ),
        ExpansionTile(
          title: const Text('Transportation Vehicle'),
          subtitle: Text('$selectedTransportation'),
          children: [
            RadioListTile(
              title: const Text('Car'),
              subtitle: const Text('Travel in car'),
              value: Transportation.car,
              groupValue: selectedTransportation,
              onChanged: (value) {
                setState(() {
                  selectedTransportation = Transportation.car;
                });
              },
            ),
            RadioListTile(
              title: const Text('Plane'),
              subtitle: const Text('Travel in Plane'),
              value: Transportation.plane,
              groupValue: selectedTransportation,
              onChanged: (value) {
                setState(() {
                  selectedTransportation = Transportation.plane;
                });
              },
            ),
            RadioListTile(
              title: const Text('Boat'),
              subtitle: const Text('Travel in Boat'),
              value: Transportation.boat,
              groupValue: selectedTransportation,
              onChanged: (value) {
                setState(() {
                  selectedTransportation = Transportation.boat;
                });
              },
            ),
            RadioListTile(
              title: const Text('Submarine'),
              subtitle: const Text('Travel in Submarine'),
              value: Transportation.submarine,
              groupValue: selectedTransportation,
              onChanged: (value) {
                setState(() {
                  selectedTransportation = Transportation.submarine;
                });
              },
            ),
          ],
        ),
        ExpansionTile(
          title: const Text('Extras'),
          subtitle: Text('Add extra services for your hosting.'),
          children: [
            CheckboxListTile(
              title: const Text('Breakfast'),
              subtitle: const Text(
                'Delicious breakfast. Multiple kinds to pick.',
              ),
              value: wantsBreakfast,
              onChanged: (value) {
                setState(() {
                  wantsBreakfast = !wantsBreakfast;
                });
              },
            ),
            CheckboxListTile(
              title: const Text('Lunch'),
              subtitle: const Text(
                'Have a lunch in one of our 6 exclusive restaurants.',
              ),
              value: wantsLuch,
              onChanged: (value) {
                setState(() {
                  wantsLuch = !wantsLuch;
                });
              },
            ),
            CheckboxListTile(
              title: const Text('Dinner'),
              subtitle: const Text('Experiment a true romantic dinner.'),
              value: wantsDinner,
              onChanged: (value) {
                setState(() {
                  wantsDinner = !wantsDinner;
                });
              },
            ),
          ],
        ),
      ],
    );
  }
}
