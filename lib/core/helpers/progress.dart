
double getProgressPercentage(Duration currentPosition, Duration totalDuration) {
  return (currentPosition.inMilliseconds / totalDuration.inMilliseconds) * 100;
}