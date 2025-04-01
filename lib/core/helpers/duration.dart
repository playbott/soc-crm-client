extension DurationFormatting on Duration {
  String toHMS([bool text = false]) {
    String twoDigits(int n) {
      if (n >= 10) return "$n";
      return "0$n";
    }

    String twoDigitMinutes = twoDigits(inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(inSeconds.remainder(60));

    return "${inHours > 0 ? '${inHours}h ' : ''}${twoDigitMinutes != '00' ? '${twoDigitMinutes}m ' : ''}${twoDigitSeconds}s";
  }

  String toHMS2() {
    String twoDigits(int n) {
      if (n >= 10) return "$n";
      return "0$n";
    }

    String twoDigitMinutes = twoDigits(inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(inSeconds.remainder(60));

    return "$inHours:$twoDigitMinutes:$twoDigitSeconds";
  }
}
