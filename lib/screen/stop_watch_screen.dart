import 'package:flutter/material.dart';
import 'package:timekeeper_app/util/time_helpers.dart';
import 'package:timekeeper_app/util/string_constants.dart';

class StopWatchScreen extends StatefulWidget {
  const StopWatchScreen({super.key});

  @override
  State<StopWatchScreen> createState() => _StopWatchScreenState();
}

class _StopWatchScreenState extends State<StopWatchScreen> {
  final stopwatch = Stopwatch();

  void _toggleStopWatch() => setState(
    () => stopwatch.isRunning ? stopwatch.stop() : stopwatch.start(),
  );

  void _resetStopWatch() => setState(() {
    stopwatch.stop();
    stopwatch.reset();
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.colorScheme.inversePrimary,
        title: const Text(StringConstants.appName),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            const Text(StringConstants.stopWatchLabel),
            StreamBuilder(
              stream: Stream.periodic(const Duration(milliseconds: 100)),
              builder: (context, _) {
                return Text(
                  TimeHelpers.durationToHmsString(stopwatch.elapsed),
                  style: theme.textTheme.displayLarge,
                );
              },
            ),
            IconButton.filled(
              onPressed: _resetStopWatch,
              tooltip: StringConstants.resetButtonTooltip,
              icon: const Icon(Icons.refresh),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.large(
        onPressed: _toggleStopWatch,
        tooltip: StringConstants.floatingButtonTooltip,
        child: stopwatch.isRunning
            ? const Icon(Icons.pause)
            : const Icon(Icons.play_arrow),
      ),
    );
  }
}
