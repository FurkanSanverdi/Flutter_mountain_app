import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:travel_application/bloc/client_cubit.dart';
import 'package:travel_application/core/localizations.dart';

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  late ClientCubit clientCubit;

  @override
  void initState() {
    super.initState();
    clientCubit = context.read<ClientCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClientCubit, clientState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Center(
              child: Text(AppLocalizations.of(context).getTranslate("Settings").toString()),
            ),
            actions: [
              if (clientCubit.state.darkMode)
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: IconButton(
                    onPressed: () => clientCubit.changeDarkMode(darkMode: false),
                    icon: const Icon(Icons.sunny),
                  ),
                )
              else
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: IconButton(
                    onPressed: () => clientCubit.changeDarkMode(darkMode: true),
                    icon: const Icon(Icons.nightlight),
                  ),
                ),
            ],
          ),
          body: Container(
            child: Center(
              child: Column(
                children: [
                  InkWell(
                    
                    onTap: () => GoRouter.of(context).push('/ali'),
                    child: const Text(""), 
                  ),
                  Text("Language: " + clientCubit.state.language),
                  Text("DarkMode: " + clientCubit.state.darkMode.toString()),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: clientCubit.state.language == "en"
                            ? null
                            : () {
                                clientCubit.changeLanguage(language: "en");
                              },
                        child: const Text("English"),
                      ),
                      const Gap(10),
                      ElevatedButton(
                        onPressed: clientCubit.state.language == "tr"
                            ? null
                            : () {
                                clientCubit.changeLanguage(language: "tr");
                              },
                        child: const Text("Türkçe"),
                      ),
                    ],
                  ),
                  const Divider(),
                  ExpansionTile(
                    title: Text("Location Permissions"),
                    children: [
                      ListTile(
                        title: const Text("Request Location Permission"),
                        onTap: () {
                          Permission.location.request().then((status) {
                            if (status.isGranted) {
                              // Permission granted
                              print("Location permission granted");
                            } else {
                              // Permission denied
                              print("Location permission denied");
                            }
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  String camResult = "";
  String locationResult = "";

  @override
  void initState() {
    super.initState();
    controlPermission();
  }

  void controlPermission() async {
    var status = await Permission.camera.status;

    switch (status) {
      case (PermissionStatus.granted):
        setState(() {
          camResult = "Yetki Alinmis";
        });
        break;
      case (PermissionStatus.denied):
        setState(() {
          camResult = "Yetki Alinmamis";
        });
        break;
      case PermissionStatus.restricted:
        setState(() {
          camResult = "Kisitlanmis Yetki Hic Bi sekilde alamayiz";
        });
        break;
      case PermissionStatus.limited:
        setState(() {
          camResult = "Kullanici Kisitli Yetki Secmis";
        });
        break;
      case PermissionStatus.permanentlyDenied:
        setState(() {
          camResult = "Yetki Vermesin Diye İstemis Kullanici";
        });
        break;
      case PermissionStatus.provisional:
        setState(() {
          camResult = "provisional";
        });
        break;
    }

   await Permission.location.onDeniedCallback(() {
    
    setState(() {
      locationResult = "Yetki Vermeyi Reddetti";
    });
  })
  .onGrantedCallback(() {
   
    setState(() {
      locationResult = "Verdi Yetki";
    });
  })
  .onPermanentlyDeniedCallback(() {
    
    setState(() {
      locationResult = "Her Zaman Engelledi";
    });
  })
  .onRestrictedCallback(() {
    
    setState(() {
      locationResult = "Kisitlanmis VE Geri Alinamaz";
    });
  })
  .onLimitedCallback(() {
    
    setState(() {
      locationResult = "Kullanici Kisitlamis";
    });
  })
  .onProvisionalCallback(() {
    
    setState(() {
      locationResult = "Provisional";
    });
  })
  .request();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: SizedBox.expand(
        child: ListView(
          children: [
            ExpansionTile(
              title: Text("Camera Permissions"),
              children: [
                Text(camResult),
              ],
            ),
            ExpansionTile(
              title: Text("Location Permissions"),
              children: [
                Text(locationResult),
                Gap(20),
                ElevatedButton(onPressed: ()async{
                  final status =  await Permission.camera.request();
                }, child: Text("Yetki İste")
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

  @override
  Widget build(BuildContext context) {
   
    throw UnimplementedError();
  }
}