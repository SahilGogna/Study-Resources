# Foundations Checklist — Questions to Research

> Work through these questions. If you can answer them (and show a tiny demo), you’ve got the basics down.

## 0) Mental Model
- What is the **Python interpreter**, and what happens when it runs a `.py` file?
- What’s the difference between a **module** and a **package**? What does `__init__.py` do?
- What is `sys.path`, and how does Python decide where to find modules?

## 1) System & Shell Basics
- What is a **terminal** (Command Prompt / PowerShell / bash), and why do developers use it?
- What is the **current working directory**? How do you check and change it?
- What is the **PATH** environment variable, and how does it affect `python` and `pip`?
- How do you check **which** Python and `pip` you are using?

## 2) Packages & `pip`
- What is a **package/library** and where do they come from (**PyPI**)?
- What is **`pip`** and what does `python -m pip` do?
- Where does `pip` install packages by default, and how can that differ between environments?
- How do you list installed packages and export them to **`requirements.txt`**?
- What are **wheels** vs **source builds**, and why do some packages need extra system tools?

## 3) Virtual Environments (`venv`, conda)
- What problem do **virtual environments** solve?
- How do you **create**, **activate**, and **deactivate** a `venv` on your OS?
- How do you ensure `pip` installs **into the current environment**?
- What are alternatives like **conda**/**poetry**, and when might you choose them?

## 4) Jupyter Notebooks & Kernels
- What is a **Jupyter kernel**, and how is it related to a Python environment?
- Why can “`pip install` worked, but `import` fails in notebook” happen?
- How do you check the **kernel’s interpreter path** from inside a notebook?
- When should you use `%pip install ...` inside a notebook?
- How do you **switch kernels** to match your project’s environment?

## 5) IDE vs Notebook — When to Use What
- What is an **IDE** (e.g., VS Code/PyCharm) and how does it differ from Jupyter?
- When is a **notebook** best (exploration, visualization) vs a **script/project** (reusable tools)?
- How do you convert a notebook into a script and run it from the terminal?
- What is a simple **project structure** (e.g., `src/`, `notebooks/`, `data/`, `tests/`, `requirements.txt`)?

## 6) Git & Collaboration Hygiene
- What problem does **Git** solve, and what are the essential commands you should know?
- What belongs in a **`.gitignore`** (e.g., `venv/`, large data, secrets)?
- How do you handle **notebook outputs** in version control (clear outputs, `jupytext`, etc.)?
- What should a **README** include so others can run your project?

## 7) “Help Request” Template — Questions to Answer Before Asking
- What OS are you on? What are your **Python** and **pip** versions?
- What is the **path** of the interpreter your code/notebook is using?
- Are you inside a **virtual environment**? Which one? How did you activate it?
- Exact **commands** you ran and full **error traceback**?
- Minimal code snippet + tiny sample data that **reproduces** the issue?
- What did you already try (and what happened)?

## 8) Tiny Glossary — Define These in Your Own Words
- Interpreter, kernel, module, package, library, environment, PATH, `requirements.txt`, OCR, wheel, MRE.
