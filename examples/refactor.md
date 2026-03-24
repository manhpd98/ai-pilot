# Example: Refactor Code

A step-by-step walkthrough of using AI Pilot to refactor a large ViewController into MVVM.

## Scenario

`HomeViewController.swift` is 800 lines with business logic, networking, and UI code all mixed together.

---

## Step 1: User Request

> _"Refactor HomeViewController to use MVVM pattern"_

## Step 2: Pilot Analyzes

Antigravity reads the file and identifies:
- **Network calls** mixed with UI updates (lines 120-250)
- **Business logic** in the ViewController (lines 300-500)
- **State management** using instance variables (scattered)
- **Reference**: `ProfileViewController` already uses MVVM

## Step 3: Pilot Creates Plan

```
Plan:
1. Create HomeViewModel.swift with all business logic
2. Move network calls into ViewModel
3. Use Combine publishers for state
4. Simplify ViewController to only handle UI
5. Keep all existing functionality working
```

## Step 4: Delegate Tasks

### Task 1: Create ViewModel
```
Create a new file at Sources/ViewModels/HomeViewModel.swift.

Extract the following from HomeViewController.swift:
- fetchUserData() (line 125)
- fetchPosts() (line 180)
- calculateStats() (line 310)

Use @Published properties for:
- userData: UserModel?
- posts: [PostModel]
- isLoading: Bool
- errorMessage: String?

Follow the MVVM pattern used in ProfileViewModel.swift.
```

### Task 2: Simplify ViewController
```
Update Sources/Views/HomeViewController.swift:

1. Add a `private let viewModel = HomeViewModel()` property
2. Remove all business logic (moved to ViewModel)
3. Bind to viewModel's @Published properties using Combine
4. Keep only UI setup and user interaction handling
5. Follow the same binding pattern used in ProfileViewController.swift

The file should go from ~800 lines to ~200 lines.
```

## Step 5: Pilot Reviews

- ✅ ViewModel has all business logic
- ✅ ViewController only handles UI
- ✅ Combine bindings are correct
- ✅ No functionality lost

## Step 6: Pilot Tests

```bash
xcodebuild -scheme MyApp build    # ✅ Builds
xcodebuild -scheme MyApp test     # ✅ Tests pass
```

## Step 7: Report

> Refactored `HomeViewController` from 800 lines to 200 lines.
> Created `HomeViewModel` with all business logic using Combine.
> All existing functionality preserved. Pattern follows `ProfileViewModel`.
