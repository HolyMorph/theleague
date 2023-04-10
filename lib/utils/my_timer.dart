import 'dart:async';
import 'dart:ui';

class MyTimer {
  MyTimer();

  Timer? _timer;

  void cancel() {
    _timer?.cancel();
  }

  void delayed({required VoidCallback onFinished, Duration duration = const Duration(seconds: 1)}) {
    cancel();
    _timer = Timer(duration, onFinished);
  }

  void periodic({required Function(Timer) onTick, Duration duration = const Duration(seconds: 1)}) {
    cancel();
    _timer = Timer.periodic(duration, (tick) => onTick);
  }
}
