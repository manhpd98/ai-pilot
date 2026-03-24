# Flutter / Dart Configuration

Platform-specific settings for Multi-Agent Coding when working with Flutter projects.

## Build & Test Commands

| Action | Command |
|--------|---------|
| Run | `flutter run` |
| Build APK | `flutter build apk` |
| Build iOS | `flutter build ios` |
| Build Web | `flutter build web` |
| Test | `flutter test` |
| Analyze | `flutter analyze` |
| Format | `dart format .` |
| Pub Get | `flutter pub get` |

## Common File Patterns

| Type | Location |
|------|----------|
| Screens | `lib/screens/` or `lib/pages/` |
| Widgets | `lib/widgets/` or `lib/components/` |
| Models | `lib/models/` |
| Services | `lib/services/` |
| Providers/Bloc | `lib/providers/` or `lib/blocs/` |
| Repositories | `lib/repositories/` |
| Utils | `lib/utils/` or `lib/helpers/` |
| Routes | `lib/routes/` |
| Constants | `lib/constants/` |
| Tests | `test/` |

## Delegation Context Template

```
Project: [PROJECT_NAME]
Architecture: [Clean Architecture / MVVM / BLoC / Provider / GetX / Riverpod]
Flutter Version: [e.g., 3.27]
State Management: [BLoC / Provider / Riverpod / GetX / MobX]
Navigation: [GoRouter / Navigator 2.0 / GetX / AutoRoute]
DI: [get_it / injectable / riverpod]
Backend: [Firebase / REST API / GraphQL / Supabase]
```

## Common Patterns

- **State management**: "Follow the BLoC pattern in `lib/blocs/auth_bloc.dart`"
- **Networking**: "Use Dio client configured in `lib/services/api_service.dart`"
- **Navigation**: "Use GoRouter routes defined in `lib/routes/app_router.dart`"
- **Models**: "Use freezed/json_serializable like in `lib/models/user_model.dart`"
- **Widgets**: "Follow reusable widget pattern in `lib/widgets/custom_button.dart`"
- **Error handling**: "Use Either pattern from dartz like in `lib/repositories/`"

## Flutter-Specific Tips

1. **Widget tests**: Use `testWidgets()` and `WidgetTester`
2. **Golden tests**: Use `matchesGoldenFile` for UI regression
3. **Build runner**: `dart run build_runner build` for code generation
4. **Freezed models**: Always run build_runner after model changes
5. **Platform channels**: Test native code separately
