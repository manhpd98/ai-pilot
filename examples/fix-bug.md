# Example: Fix a Bug

A step-by-step walkthrough of using AI Pilot to fix a crash bug.

## Scenario

The app crashes with `IndexOutOfBoundsException` when the user opens the onboarding screen.

---

## Step 1: User Request

> _"Fix the crash on the onboarding screen"_

## Step 2: Pilot Analyzes (Antigravity)

Antigravity reads the crash log and identifies:
- **Error**: `IndexOutOfBoundsException` at `OnboardingAdapter.kt:42`
- **Cause**: Array has 3 items but code expects 4
- **File**: `OnboardingAdapter.kt`

## Step 3: Pilot Creates Plan

```
Plan:
1. Fix OnboardingAdapter to handle correct number of items
2. Add safety check for array bounds
3. Verify all onboarding screens render correctly
```

## Step 4: Delegate to Claude Code

Antigravity sends this to Claude Code:

```
BUG FIX REQUEST

File: app/src/main/java/com/app/ui/OnboardingAdapter.kt
Function: getItemCount() and onBindViewHolder()

Current behavior:
App crashes with IndexOutOfBoundsException at line 42. The adapter
expects 4 layout segments but only 3 are provided.

Expected behavior:
All onboarding screens display without crash.

Fix instructions:
1. Update getItemCount() to return the actual size of the data list
2. Add bounds checking in onBindViewHolder() before accessing array
3. Ensure the layouts array matches the number of onboarding screens
```

## Step 5: Pilot Reviews

Antigravity reads the modified file:
- ✅ `getItemCount()` now returns `layouts.size` instead of hardcoded `4`
- ✅ Bounds check added in `onBindViewHolder()`
- ✅ No other files affected

## Step 6: Pilot Tests

```bash
./gradlew assembleDebug   # ✅ Build succeeds
./gradlew test            # ✅ All tests pass
```

## Step 7: Report

> Fixed the `IndexOutOfBoundsException` crash in `OnboardingAdapter.kt`.
> Root cause was a hardcoded item count that didn't match the actual data.
> Changed to dynamic sizing with bounds checking.
