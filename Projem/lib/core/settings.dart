import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
 
 controlPermission() async {

  var status = await Permission.camera.status;
if (status.isDenied) {

}

if (await Permission.location.isRestricted) {

}

 }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings")),
      body: SizedBox.expand(
        child: ListView(
          children: [
            ExpansionTile(title: Text("Location Permissions"),
            
            ), 
          ],
        ),
      ),
    );
  }
}
