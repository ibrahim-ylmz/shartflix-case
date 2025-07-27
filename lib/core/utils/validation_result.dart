/// Validation result class
class ValidationResult {
  /// Invalid result
  const ValidationResult.invalid(this.errorMessage) : isValid = false;

  /// Valid result
  const ValidationResult.valid() : isValid = true, errorMessage = null;

  /// Validation result
  final bool isValid;

  /// Error message
  final String? errorMessage;

  /// Combine multiple validation results
  static Future<ValidationResult> combine(
    List<ValidationResult> results,
  ) async {
    for (final result in results) {
      if (!result.isValid) {
        return result;
      }
    }
    return const ValidationResult.valid();
  }
}
