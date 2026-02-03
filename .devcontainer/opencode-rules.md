# Reglas del Proyecto (Playwright + Python)

## Stack Técnico
- **Lenguaje:** Python 3.12
- **Navegadores:** Chromium y Firefox (asegurar compatibilidad en ambos).
- **Framework de Tests:** Pytest con `pytest-playwright`.
- **Linter/Formatter:** Ruff (configurado en `ruff.toml`).

## Reglas de Código
- **Selectores:** Priorizar siempre `page.get_by_role()` o `page.get_by_test_id()`. Evitar XPath o selectores CSS frágiles.
- **Asincronía:** Usar `async/await` siguiendo el estándar de `pytest-playwright`.
- **Estructura:** Los tests deben residir en la carpeta `/tests` y seguir el patrón `test_*.py`.

## Gestión de Dependencias
- No uses `pip install` manualmente. Si necesitas una librería, añádela a `pyproject.toml`.
- Todas las herramientas se ejecutan dentro del Dev Container.
