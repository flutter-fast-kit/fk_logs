part of fk_logs;

/// Pretty printer that uses developer.log to show log messages
class PrettyDeveloperPrinter extends LogPrinter {
  const PrettyDeveloperPrinter();

  static final Map<LogLevel, String> _levelPrefixes = <LogLevel, String>{
    LogLevel.debug: '🐛 ',
    LogLevel.info: '👻 ',
    LogLevel.warning: '⚠️ ',
    LogLevel.error: '‼️ ',
  };

  // For undefined log levels
  static const String _defaultPrefix = '🤔 ';

  @override
  void onLog(LogRecord record) {
    final String _time = record.time.toString();
    final String _callerFrame = record.callerFrame == null ? '-' : '(${record.callerFrame.location})';
    final String _logLevel = record.level.toString().replaceAll('Level.', '').toUpperCase();
    final String _prefix = levelPrefix(record.level) ?? _defaultPrefix;
    final chain = Chain.forTrace(StackTrace.current);
    final frames = chain.toTrace().frames;

    String message = '';
    String loggerName = 'FKLog';
    if (record.loggerName == 'DioLoggy') {
      loggerName = 'FKDio';
      message = '$_time $_logLevel $_prefix $_callerFrame: ${record.message}';
    } else {
      final lastFrame = frames.firstWhere((v) {
      return !v.library.startsWith('dart:') &&
             v.package != 'loggy' &&
             v.package != 'fk_logs' &&
             v.package != 'fk_logs_dio' &&
             !v.library.contains('pretty_developer_printer.dart');
      });
      message = '$_time $_logLevel $_prefix $_callerFrame ${lastFrame.member}(${lastFrame.line}:${lastFrame.column}): ${record.message}';
    }

    developer.log(
      message,
      name: loggerName,
      error: record.error,
      stackTrace: record.stackTrace,
      level: record.level.priority,
      time: record.time,
      zone: record.zone,
      sequenceNumber: record.sequenceNumber,
    );
  }

  /// Get prefix for level
  String levelPrefix(LogLevel level) {
    return _levelPrefixes[level];
  }
}
