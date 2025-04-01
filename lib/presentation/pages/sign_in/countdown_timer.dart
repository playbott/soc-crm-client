import 'dart:async';

import 'package:client/global.dart';

import 'package:client/presentation/widgets.dart';

class CountdownTimer extends StatefulWidget {
  final Duration duration;
  final Widget child;

  const CountdownTimer({
    super.key,
    required this.duration,
    required this.child,
  });

  @override
  State<CountdownTimer> createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer> {
  late Timer _timer;
  late int _remainingTime;
  bool showLabel = false;

  @override
  void initState() {
    super.initState();
    _remainingTime = widget.duration.inSeconds;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingTime > 0) {
          _remainingTime--;
        } else {
          timer.cancel();
          showLabel = true;
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeMode = Theme.of(context).brightness;
    Color foregroundColor =
        themeMode == Brightness.light ? Colors.white : Colors.white60;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (!showLabel)
          MyLabel(
            text: '00:$_remainingTime',
            align: TextAlign.center,
            size: FS.p5,
            color: foregroundColor,
          ),
        if (showLabel) widget.child,
      ],
    );
  }
}
