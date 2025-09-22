# smart_restart

Clean, no-setup app restart for Flutter (Android).

---

## ⚡️ Features

- **Android:** Relaunches your app by clearing the task and starting a new launch intent, then finishing the current task. This is particularly useful after a hotfix or patch has been downloaded.
- **iOS:** Not implemented yet. This is currently a no-op on iOS.

---

## 📦 Install

Add the following to your `pubspec.yaml` file:

```yaml
dependencies:
  smart_restart: ^0.1.0
```

---

## 🚀 Usage

Just call `SmartRestart.restart()` whenever you need to restart your app.

```dart
import 'package:smart_restart/smart_restart.dart';
// ...

ElevatedButton(
  onPressed: () async => SmartRestart.restart(),
  child: const Text('Restart App'),
);
```
