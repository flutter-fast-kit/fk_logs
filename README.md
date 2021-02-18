# fk_logs

[![Pub](https://img.shields.io/pub/v/fk_logs.svg)](https://pub.dartlang.org/packages/fk_logs)
[![Awesome Flutter](https://img.shields.io/badge/Awesome-Flutter-blue.svg?longCache=true&style=flat-square)]()
[![Awesome Flutter](https://img.shields.io/badge/Platform-Android_iOS-blue.svg?longCache=true&style=flat-square)]()
[![License](https://img.shields.io/badge/License-MIT-blue.svg)](/LICENSE)

基于 `loggy` 的二次封装

## 使用

🔩 安装

在 `pubspec.yaml` 添加依赖

```
dependencies:
  fk_logs: <last_version>
```

⚙️ 配置

```dart
Log.init(level: LogLevel.all);
```

添加 dio 日志拦截器

```dart
Dio dio = Dio();
dio.interceptors.add(LoggyDioInterceptor());
```

🔨 使用

```
Log.d();
Log.i();
Log.w();
Log.e();
```

## Changelog

Refer to the [Changelog](CHANGELOG.md) to get all release notes.