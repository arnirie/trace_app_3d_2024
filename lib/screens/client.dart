import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trace_app_3d/screens/home.dart';

class ClientScreen extends StatelessWidget {
  ClientScreen({super.key, required this.userId});

  final String userId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Client'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.of(context).pushReplacement(
                CupertinoPageRoute(
                  builder: (_) => HomeScreen(),
                ),
              );
            },
            icon: FaIcon(FontAwesomeIcons.arrowRightFromBracket),
          ),
        ],
      ),
      body: Center(
        child: QrImageView(
          data: userId,
          version: QrVersions.auto,
          // backgroundColor: Colors.purple,
          // size: 200.0,
        ),
      ),
    );
  }
}
