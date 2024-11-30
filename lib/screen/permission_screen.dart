import 'package:blank_street/util/custom_colors.dart';
import 'package:flutter/material.dart';

class PermissionScreen extends StatelessWidget {
  const PermissionScreen({super.key});

  _grantPermission({required BuildContext context}) {
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: CustomColors().brown,
        context: context,
        builder: (builder) {
          return SafeArea(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 40.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: CustomColors().brownDark,
                          ),
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: AspectRatio(
                            aspectRatio: 1 / 1,
                            child: Image.network(
                              'https://picsum.photos/500/300',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Icon(
                      Icons.notifications,
                      size: 40.0,
                      color: CustomColors().green,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Receive Order Updates',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Enable notifications to receive updates about your orders. You can turn them off at any time.',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    const Expanded(child: SizedBox()),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                        ),
                        child: const Text(
                          'CONTINUE',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 8.0,
                            height: 8.0,
                            decoration: BoxDecoration(
                              color: CustomColors().green, // Dot color
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(
                            width: 4.0,
                          ),
                          Container(
                            width: 8.0,
                            height: 8.0,
                            decoration: const BoxDecoration(
                              color: Colors.grey, // Dot color
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(
                            width: 4.0,
                          ),
                          Container(
                            width: 8.0,
                            height: 8.0,
                            decoration: const BoxDecoration(
                              color: Colors.grey, // Dot color
                              shape: BoxShape.circle,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: TextButton(
            onPressed: () {
              _grantPermission(context: context);
            },
            child: const Text('Grant Permission'),
          ),
        ),
      ),
    );
  }
}
