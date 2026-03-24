# Web / React / Next.js Configuration

Platform-specific settings for Multi-Agent Coding when working with web projects.

## Build & Test Commands

| Action | Command |
|--------|---------|
| Dev Server | `npm run dev` |
| Build | `npm run build` |
| Test | `npm test` or `npx vitest` |
| Lint | `npm run lint` or `npx eslint .` |
| Format | `npx prettier --write .` |
| Type Check | `npx tsc --noEmit` |

## Common File Patterns

| Type | Location |
|------|----------|
| Pages | `src/app/` (Next.js) or `src/pages/` |
| Components | `src/components/` |
| Hooks | `src/hooks/` |
| Utils | `src/utils/` or `src/lib/` |
| API Routes | `src/app/api/` (Next.js) |
| Styles | `src/styles/` or co-located `.module.css` |
| Tests | `__tests__/` or `*.test.ts` co-located |

## Delegation Context Template

```
Project: [PROJECT_NAME]
Framework: [Next.js / Vite + React / Vue / Svelte]
Styling: [Tailwind / CSS Modules / Styled Components]
State: [React Context / Zustand / Redux / Jotai]
Testing: [Jest / Vitest / Playwright]
TypeScript: [Yes / No]
```

## Common Patterns

- **Data fetching**: "Use the pattern in `useUser.ts` hook"
- **API routes**: "Follow `src/app/api/auth/route.ts` pattern"
- **Components**: "Follow the component pattern in `Button.tsx`"
- **Forms**: "Use React Hook Form like in `LoginForm.tsx`"
