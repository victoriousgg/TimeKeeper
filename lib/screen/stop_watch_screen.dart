import 'package:flutter/material.dart';
import 'package:timekeeper_app/util/time_helpers.dart';
import 'package:timekeeper_app/util/string_constants.dart';

class StopWatchScreen extends StatefulWidget {
  const StopWatchScreen({super.key, this.existingTime});

  final Duration? existingTime;

  @override
  State<StopWatchScreen> createState() => _StopWatchScreenState();
}

class _StopWatchScreenState extends State<StopWatchScreen> {
  final _stopwatch = Stopwatch();
  var _existingTime = Duration.zero;

  @override
  void initState() {
    super.initState();
    if (widget.existingTime != null) {
      _existingTime = widget.existingTime!;
    }
  }

  void _toggleStopWatch() => setState(
    () => _stopwatch.isRunning ? _stopwatch.stop() : _stopwatch.start(),
  );

  void _resetStopWatch() => setState(() {
    _stopwatch.stop();
    _stopwatch.reset();
  });

  void _editStopWatch(Duration? newTime) => setState(() {
    _stopwatch.stop();
    if (newTime != null) {
      _stopwatch.reset();
      _existingTime = newTime;
    }
  });

  void _clearStopWatch() => setState(() {
    _stopwatch.stop();
    _stopwatch.reset();
    _existingTime = Duration.zero;
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      mainAxisAlignment: .center,
      spacing: 20.0,
      children: [
        const Text(StringConstants.stopWatchLabel),
        Card.filled(
          elevation: 4.0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: StreamBuilder(
              stream: Stream.periodic(const Duration(milliseconds: 100)),
              builder: (context, _) {
                return Text(
                  TimeHelpers.durationToHmsString(
                    duration: _stopwatch.elapsed,
                    existingTime: _existingTime,
                  ),
                  style: theme.textTheme.displayLarge,
                );
              },
            ),
          ),
        ),
        IconButton.filled(
          onPressed: _toggleStopWatch,

          iconSize: 72.0,
          icon: _stopwatch.isRunning
              ? const Icon(Icons.pause)
              : const Icon(Icons.play_arrow),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 10.0,
          children: [
            ElevatedButton.icon(
              onPressed: _stopwatch.isRunning
                  ? null
                  : () async => _editStopWatch(await (await _showMyDialog())),
              icon: Icon(Icons.edit),
              label: Text('Edit'),
            ),
            ElevatedButton.icon(
              onPressed: _stopwatch.isRunning ? null : _resetStopWatch,
              icon: Icon(Icons.refresh),
              label: Text('Reset'),
            ),
            ElevatedButton.icon(
              onPressed: _stopwatch.isRunning ? null : _clearStopWatch,
              icon: Icon(Icons.clear),
              label: Text('Clear'),
            ),
          ],
        ),
      ],
    );
  }

  Future<Future<Duration?>> _showMyDialog() async {
    return showDialog<Duration>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        final hoursController = TextEditingController(
          text: _existingTime.inHours.toString(),
        );

        final minutesController = TextEditingController(
          text: (_existingTime.inMinutes % 60).toString(),
        );

        final secondsController = TextEditingController(
          text: (_existingTime.inSeconds % 60).toString(),
        );

        return AlertDialog(
          title: const Text('AlertDialog Title'),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                TextField(
                  controller: hoursController,
                  decoration: InputDecoration(labelText: 'Hours'),
                ),
                TextField(
                  controller: minutesController,
                  decoration: InputDecoration(labelText: 'Minutes'),
                ),
                TextField(
                  controller: secondsController,
                  decoration: InputDecoration(labelText: 'Seconds'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton.icon(
              icon: Icon(Icons.check),
              label: const Text('Accept'),
              onPressed: () {
                Navigator.of(context).pop(
                  Duration(
                    hours: int.tryParse(hoursController.text) ?? 0,
                    minutes: (int.tryParse(minutesController.text) ?? 0) % 60,
                    seconds: (int.tryParse(secondsController.text) ?? 0) % 60,
                  ),
                );
              },
            ),
            TextButton.icon(
              icon: Icon(Icons.clear),
              label: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
