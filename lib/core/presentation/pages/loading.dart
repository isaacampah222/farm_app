import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:nil/nil.dart';

/// A String value to show error message to user
/// When null thus validation passed, then execute onLoadingDone()
class LoadingPage extends StatelessWidget {
  /// Constructor
  const LoadingPage({super.key, required this.errorText, this.onLoadingDone});

  /// Starts with an initial value of an empty string
  /// A string text for error message, and null value for validation passed
  final Future<String?> errorText;

  /// Function called when loading has completed
  final VoidCallback? onLoadingDone;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
        initialData: '', // Empty data string to initiate a loading screen
        future: errorText,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return AlertDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                title: snapshot.data!.isNotEmpty ? const Text('ERROR‼') : null,
                content: snapshot.data!.isNotEmpty
                    ? Text(snapshot.data!)
                    : Row(children: const <Widget>[
                        CircularProgressIndicator.adaptive(),
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 24),
                            child: Text('Verifying...'))
                      ]),
                actions: snapshot.data!.isNotEmpty
                    ? <Widget>[
                        TextButton.icon(
                            icon: const Icon(Icons.refresh),
                            onPressed: () =>
                                Navigator.of(context).pop<bool>(false),
                            // Closes the loading screen and returns false
                            label: const Text('RETRY')),
                      ]
                    : null);
          }
          return Builder(builder: (context) {
            SchedulerBinding.instance.addPostFrameCallback((_) {
              Navigator.of(context).pop<bool>(
                  true); // Closes the Loading Screen and returns true
              final call = onLoadingDone ?? () {};
              call();
            });
            return nil;
          });
        });
  }
}
