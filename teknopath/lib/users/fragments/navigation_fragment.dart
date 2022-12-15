import 'package:flutter/material.dart';
import 'package:flutter_unity_widget/flutter_unity_widget.dart';

class NavigationUnity extends StatefulWidget {
  const NavigationUnity({super.key});

  @override
  State<NavigationUnity> createState() => _NavigationUnityState();
}

class _NavigationUnityState extends State<NavigationUnity> {
  late UnityWidgetController _unityWidgetController;

  @override
  void dispose() {
    _unityWidgetController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Campus Navigation'),
      ),
      body: Card(
        margin: const EdgeInsets.all(0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Stack(
          children: [
            UnityWidget(
              onUnityCreated: onUnityCreated,
              useAndroidViewSurface: true,
              fullscreen: false,
            )
          ],
        ),
      ),
    );
  }

  void onUnityCreated(controller) {
    controller.resume();
    _unityWidgetController = controller;
  }
}
