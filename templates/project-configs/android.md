# Android / Kotlin / Gradle Configuration

Platform-specific settings for Multi-Agent Coding when working with Android projects.

## Build & Test Commands

| Action | Command |
|--------|---------|
| Build Debug | `./gradlew assembleDebug` |
| Build Release | `./gradlew assembleRelease` |
| Unit Tests | `./gradlew test` |
| Instrumented Tests | `./gradlew connectedAndroidTest` |
| Lint | `./gradlew lint` |
| Format | `./gradlew ktlintFormat` |

## Common File Patterns

| Type | Location |
|------|----------|
| Activities | `app/src/main/java/.../ui/` |
| ViewModels | `app/src/main/java/.../viewmodel/` |
| Fragments | `app/src/main/java/.../ui/` |
| Models | `app/src/main/java/.../model/` or `.../data/` |
| Repository | `app/src/main/java/.../repository/` |
| DI | `app/src/main/java/.../di/` |
| Tests | `app/src/test/` and `app/src/androidTest/` |

## Delegation Context Template

```
Project: [PROJECT_NAME]
Architecture: [MVVM / MVP / MVI / Clean]
Min SDK: [e.g., 24]
UI: [Jetpack Compose / XML Views / Mixed]
DI: [Hilt / Dagger / Koin]
Networking: [Retrofit / Ktor]
```

## Common Patterns

- **Networking**: "Follow Retrofit setup in `ApiService.kt`"
- **State**: "Use `StateFlow` like in `HomeViewModel.kt`"
- **Navigation**: "Use Navigation Component / Compose Navigation"
- **DI**: "Register in Hilt module at `AppModule.kt`"
