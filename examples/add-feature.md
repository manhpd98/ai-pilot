# Example: Add a Feature

A step-by-step walkthrough of using AI Pilot to add dark mode support.

## Scenario

Add dark mode toggle to a React web application.

---

## Step 1: User Request

> _"Add dark mode toggle to the app"_

## Step 2: Pilot Analyzes

Antigravity discovers:
- **Framework**: Next.js + Tailwind CSS
- **Current setup**: No theme system, hardcoded light colors
- **Files to change**: `ThemeProvider`, `Header`, `globals.css`
- **Pattern**: Similar apps use `next-themes` library

## Step 3: Pilot Creates Plan

```
Plan:
1. Install next-themes package
2. Create ThemeProvider wrapper
3. Add toggle button to Header
4. Update CSS variables for dark mode
5. Test both themes
```

## Step 4: Delegate Tasks (one at a time)

### Task 1: Setup
```
Install next-themes and create a ThemeProvider component at
src/components/ThemeProvider.tsx that wraps the app with
next-themes provider. Follow the pattern in the existing
src/components/Providers.tsx file.
```

### Task 2: Toggle UI
```
Add a dark mode toggle button to src/components/Header.tsx:
- Use a sun/moon icon from lucide-react (already installed)
- Place it in the header nav bar, right side
- Use useTheme() hook from next-themes
- Follow the existing button style in Header
```

### Task 3: CSS
```
Update src/app/globals.css to add dark mode CSS variables:
- Dark background: #0f172a
- Dark text: #e2e8f0
- Dark card: #1e293b
- Use @media (prefers-color-scheme: dark) as fallback
```

## Step 5: Pilot Reviews Each Change

After each task:
- ✅ Reads modified files
- ✅ Checks consistency
- ✅ Sends corrections if needed

## Step 6: Pilot Tests

```bash
npm run build    # ✅ Build succeeds
npm run lint     # ✅ No lint errors
npm run dev      # ✅ Visual check in browser
```

## Step 7: Report

> Added dark mode support using `next-themes`:
> - ThemeProvider wraps the app
> - Toggle button in header with sun/moon icons
> - CSS variables for both themes
> - Respects system preference as default
