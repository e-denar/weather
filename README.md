# weather

### SDK Information

- Flutter 3.3.9, channel stable
- Dart 2.18.5


#### Code generation

[build_runner](https://pub.dev/packages/build_runner) executes the code generation. The files generated are named `*.g.dart`, `*.freezed.dart`.

You can run it by running this command in your project folder:

```sh
flutter pub run build_runner build
```

Alternatively, you automatically execute build_runner whenever your source file changes by running this command:

```sh
flutter pub run build_runner watch
```

If there are errors when executing build_runner, run this command to clear all generated files that are conflicting:

```sh
flutter pub run build_runner build --delete-conflicting-outputs
```

