String formatFinanceAmount(String input) {
  // Remove any non-digit characters (e.g. commas, spaces)
  final sanitized = input.replaceAll(RegExp(r'[^\d]'), '');

  if (sanitized.isEmpty) return '0';

  final buffer = StringBuffer();
  int count = 0;

  // Loop backwards to insert dots every 3 digits
  for (int i = sanitized.length - 1; i >= 0; i--) {
    buffer.write(sanitized[i]);
    count++;
    if (count % 3 == 0 && i != 0) {
      buffer.write('.');
    }
  }

  // Reverse the string to get the correct format
  return buffer.toString().split('').reversed.join('');
}
