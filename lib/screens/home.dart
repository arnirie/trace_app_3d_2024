import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:trace_app_3d/screens/login.dart';
import 'package:trace_app_3d/screens/register_client.dart';
import 'package:trace_app_3d/screens/register_establishment.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background.png'),
              alignment: Alignment.bottomCenter,
              opacity: 0.6,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // const Gap(24),
              Text('TraceIT', style: Theme.of(context).textTheme.displayMedium),
              const Gap(12),
              Text(
                'A mobile application for tracing contacts on MAD 2 class.',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const Gap(24),
              ElevatedButton(
                onPressed: () => open(LoginScreen(), context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white,
                ),
                child: const Text('Login'),
              ),
              const Gap(12),
              ElevatedButton(
                onPressed: () => open(RegisterClientScreen(), context),
                child: const Text('Register as Client'),
              ),
              const Gap(12),
              ElevatedButton(
                onPressed: () => open(RegisterEstablishmentScreen(), context),
                child: const Text('Register as Establishment'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void open(Widget screen, BuildContext context) {
    Navigator.of(context).push(CupertinoPageRoute(builder: (_) => screen));
  }
}
