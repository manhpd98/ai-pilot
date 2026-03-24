# Python / FastAPI / Django Configuration

Platform-specific settings for AI Pilot when working with Python projects.

## Build & Test Commands

| Action | Command |
|--------|---------|
| Run | `python -m uvicorn main:app --reload` (FastAPI) |
| Run | `python manage.py runserver` (Django) |
| Test | `pytest` or `python -m pytest` |
| Lint | `ruff check .` or `flake8` |
| Format | `ruff format .` or `black .` |
| Type Check | `mypy .` |
| Install | `pip install -r requirements.txt` |

## Common File Patterns

| Type | Location |
|------|----------|
| Routes/Views | `app/routes/` or `app/views/` |
| Models | `app/models/` |
| Schemas | `app/schemas/` |
| Services | `app/services/` |
| Utils | `app/utils/` |
| Tests | `tests/` |
| Config | `app/config.py` or `settings.py` |

## Delegation Context Template

```
Project: [PROJECT_NAME]
Framework: [FastAPI / Django / Flask]
Python Version: [e.g., 3.11]
Database: [PostgreSQL / SQLite / MongoDB]
ORM: [SQLAlchemy / Django ORM / Tortoise]
Testing: [pytest / unittest]
```

## Common Patterns

- **API endpoint**: "Follow the pattern in `routes/users.py`"
- **Database model**: "Follow SQLAlchemy model in `models/user.py`"
- **Service layer**: "Follow `services/auth_service.py` pattern"
- **Testing**: "Follow the fixture pattern in `conftest.py`"
