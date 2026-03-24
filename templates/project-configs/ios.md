# iOS / Swift / Xcode Configuration

Platform-specific settings for AI Pilot when working with iOS projects.

## Build & Test Commands

| Action | Command |
|--------|---------|
| Build | `xcodebuild -scheme [SCHEME] -sdk iphonesimulator build` |
| Test | `xcodebuild -scheme [SCHEME] -sdk iphonesimulator -destination 'platform=iOS Simulator,name=iPhone 16' test` |
| Lint | `swiftlint` |
| Format | `swiftformat .` |

## Common File Patterns

| Type | Location |
|------|----------|
| ViewModels | `Sources/ViewModels/` or `App/ViewModels/` |
| Views | `Sources/Views/` or `App/Views/` |
| Models | `Sources/Models/` |
| Services | `Sources/Services/` |
| Tests | `Tests/` or `AppTests/` |

## Delegation Context Template

When delegating iOS tasks, include:
```
Project: [PROJECT_NAME]
Architecture: [MVVM / MVC / VIPER / TCA]
Min iOS version: [e.g., iOS 16]
UI Framework: [SwiftUI / UIKit / Mixed]
Dependency Manager: [SPM / CocoaPods / Carthage]
```

## Common Patterns to Reference

- **Networking**: "Follow the pattern in `NetworkService.swift`"
- **State management**: "Use `@Published` properties like in `HomeViewModel`"
- **Navigation**: "Use the coordinator pattern in `AppCoordinator`"
- **Error handling**: "Follow the `AppError` enum pattern"
