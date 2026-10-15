abstract final class TimeHelpers {
  /**
   * Converts a [Duration] to a string in the format of "HH:MM:SS".
   */
  static String durationToHmsString(Duration duration) =>
      '${duration.inHours.toString().padLeft(2, '0')}:${(duration.inMinutes % 60).toString().padLeft(2, '0')}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
}
