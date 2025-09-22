## 0.1.0

- Initial Android release.
- Provides `SmartRestart.restart()` which performs a clean relaunch (launch intent + clear task + `finishAffinity()`).
- No host-app setup required (uses `ActivityAware`).
