part of fk_logs;

mixin DioLogs implements LoggyType {
  @override
  Loggy<DioLogs> get loggy => Loggy<DioLogs>('FKDio');
}
