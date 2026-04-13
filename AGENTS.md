# AGENTS.md — ORaffle

Guidelines for agentic coding agents working in this repository.

---

## Project Overview

**ORaffle** is a Flutter/Dart cross-platform raffle application (Android, iOS, macOS, Windows, Linux, Web).
It uses Material Design 3, BLoC state management, GoRouter navigation, and Clean Architecture.

---

## Commands

All commands use the standard `flutter` CLI — there is no npm/yarn/package.json.

### Dependencies
```bash
flutter pub get          # install / restore dependencies
flutter pub upgrade      # upgrade packages
```

### Development
```bash
flutter run              # run in debug mode with hot reload
flutter run --release    # run in release mode
```

### Lint & Static Analysis
```bash
flutter analyze          # run the Dart analyzer (analogous to eslint)
```

### Tests
```bash
flutter test                                  # run all tests
flutter test test/widget_test.dart            # run a single test file
flutter test --name "my test description"     # run a single test by name
flutter test --tags smoke                     # run tests with a specific tag
```

### Build
```bash
flutter build apk        # Android
flutter build ios        # iOS
flutter build macos      # macOS
flutter build windows    # Windows
flutter build linux      # Linux
flutter build web        # Web
```

### Localizations (code generation)
```bash
flutter gen-l10n         # regenerate lib/core/l10n/app_localizations*.dart from ARB files
```

The CI pipeline runs: `flutter pub get` → `flutter analyze` → `flutter test` → `flutter gen-l10n` → translation completeness check → GPL-3.0 license header check.

---

## Architecture

The project follows **Clean Architecture** with these layers:

```
lib/
├── core/          # Shared infrastructure: theme, localizations
├── data/          # Implementations: RaffleStorageService (SharedPreferences)
├── domain/        # Pure Dart models: RaffleSession, RaffleParticipant, RaffleWinner, RaffleLogo
└── presentation/  # BLoC/Cubits, screens, and widgets
    ├── blocs/
    │   ├── raffle_bloc/      # Full BLoC: events + states for raffle session lifecycle
    │   ├── settings_cubit/   # Cubit: theme mode, primary color, logo
    │   └── locale_cubit/     # Cubit: active locale
    ├── screens/
    │   └── widgets/          # Reusable screen-level widgets
    └── ...
routes/            # GoRouter definition and AppRoutes constants
```

---

## Code Style

### Dart Formatting
Dart formatting is handled by `dart format` (opinionated, not configurable). Run it before committing.
```bash
dart format lib/ test/
```

### Import Order
Follow the standard Dart import grouping, in this order:
1. `dart:` core libraries (`dart:math`, `dart:convert`, etc.)
2. `package:flutter/` framework imports
3. Third-party packages (`package:flutter_bloc/`, `package:go_router/`, etc.)
4. Internal project imports (`package:oraffle/...`) — ordered infrastructure-outward: core → data → domain → presentation

### Naming Conventions

| Element | Convention | Example |
|---------|-----------|---------|
| Classes | `UpperCamelCase` | `RaffleBloc`, `SettingsCubit` |
| Files | `snake_case` | `raffle_bloc.dart`, `app_theme.dart` |
| Variables / params | `lowerCamelCase` | `isSelecting`, `winnerName` |
| Private members | `_lowerCamelCase` | `_random`, `_storageService` |
| Private widget subclasses (within a file) | `_UpperCamelCase` | `_SectionTitle`, `_LogoSetting` |
| BLoC event classes | Imperative verb phrases | `StartRaffleSelection`, `ConfirmWinner` |
| BLoC state classes | Past participles / adjectives | `RaffleLoaded`, `RaffleWinnerSelected` |
| Route path constants | `static const String` in `AppRoutes` class | `AppRoutes.home = '/'` |

### Widget Patterns
- Prefer `StatelessWidget`. Use `StatefulWidget` only when local widget lifecycle is needed (e.g., `AnimationController`, `TextEditingController`).
- Always use `const` constructors where possible: `const HomeScreen({super.key})`.
- Split large widgets into **private sub-widgets** within the same file using `_ClassName` naming.
- Use `LayoutBuilder` for responsive design; the breakpoint is **800px** (wide ≥ 800, narrow < 800).
- Use immutable models with `copyWith`.

### State Management (BLoC)
- `context.read<Bloc>()` for one-shot reads / dispatching events.
- `BlocBuilder` for reactive UI rebuilds.
- `BlocListener` for side effects (snackbars, navigation).
- `BlocConsumer` when both rebuild and side effects are needed.
- All three BLoCs/Cubits are provided at the top of the widget tree via `MultiBlocProvider` in `main.dart`.

### Routing
- Use `context.go(AppRoutes.xxx)` (GoRouter's `BuildContext` extension).
- All route path strings live in `AppRoutes` static constants (`lib/routes/app_router.dart`).

### Theme & Colors
- Never hardcode colors. Use semantic tokens from `ThemeExtension`: `context.appColors`.
- The color palette uses Zinc/violet naming (matching Tailwind CSS conventions) defined in `AppTheme`.
- Theme-aware widgets must respond to both light and dark `ThemeData`.

### Localization
- All user-visible strings must use `AppLocalizations.of(context)!.someKey`.
- Never hardcode UI strings in widget code.
- Add new strings to `lib/core/l10n/app_en.arb` (the template), then run `flutter gen-l10n`.
- Translations for other locales live in `app_<locale>.arb` files in the same directory.

### Error Handling
- BLoC event handlers: wrap in `try/catch` and emit a `RaffleError` state on failure.
- Storage operations: return `bool` or nullable types (`Future<T?>`) rather than throwing.
- Debug logging: use `if (kDebugMode) { print(...); }` — do not use `debugPrint` except where already established.
- UI error surfacing: use `SnackBar` triggered by `BlocListener`.
- Silently handle corrupted stored data by removing it and returning `null`.

---

## License Headers

**Every `.dart` file** you create (except generated localization files and test files) **must** begin with a GPL-3.0 license header. This is enforced by CI. The header looks like:

```dart
// Copyright (C) 2026 Widget Suite
//
// This file is part of ORaffle.
//
// ORaffle is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// ORaffle is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with ORaffle. If not, see <https://www.gnu.org/licenses/>.
```

---

## Key Dependencies

| Package | Purpose |
|---------|---------|
| `flutter_bloc` v9 | BLoC + Cubit state management |
| `go_router` v17 | Declarative routing |
| `shared_preferences` | Local persistence |
| `file_picker` + `path_provider` | File I/O |
| `flutter_svg` | SVG asset rendering |
| `google_fonts` | Inter (body) + Plus Jakarta Sans (AppBar) |
| `lucide_icons` | Icon set |
| `get_it` v9 | Service locator (declared but not yet wired up) |

---

## Testing

- Test files follow the `*_test.dart` naming pattern and live under `test/`.
- Use `testWidgets(...)` with a `WidgetTester tester` parameter (Flutter widget tests).
- The `flutter_test` package is the only test dependency; there is no mockito/mocktail yet.
- Wrap the full app or a subtree in `MultiBlocProvider` with fake BLoCs/Cubits when testing widgets that depend on state.
