# CLAUDE.md - Project Orientation Guide

This document helps AI agents (and humans) quickly understand and navigate this project.

## Project Overview

**ayershome-org-website** is a personal website and blog built with Pelican, a Python-based static site generator. The site features a custom dark theme with monospace fonts and a left sidebar navigation.

- **Author**: Eric Z. Ayers
- **Python Version**: 3.14+
- **Package Manager**: uv (modern Python package/project manager)
- **License**: Copyright (c) 2026 Eric Z. Ayers, All rights reserved

## Tech Stack

- **Static Site Generator**: Pelican 4.9.0+
- **Content Format**: Markdown
- **Theme**: Custom "monospace" theme (dark with typewriter font)
- **Plugins**: pelican-render-math for math rendering
- **Dev Tools**: pytest, mypy, pyright, ruff (linter/formatter), pre-commit

## Directory Structure

```
.
├── content/                 # Source content (blog posts and pages)
│   ├── pages/              # Static pages (About, Projects)
│   │   ├── about.md
│   │   └── projects.md
│   ├── images/             # Images for posts
│   └── *.md                # Blog posts (markdown files)
│
├── themes/                  # Custom themes
│   └── monospace/          # Active theme
│       ├── static/
│       │   └── css/
│       │       └── style.css
│       └── templates/       # Jinja2 templates
│           ├── base.html    # Base template
│           ├── index.html   # Blog post listing
│           ├── article.html # Individual post
│           └── page.html    # Static pages
│
├── output/                  # Generated static site (deploy this directory)
├── scripts/                 # Utility scripts
├── tests/                   # Test files
├── .venv/                   # Python virtual environment
│
├── pelicanconf.py          # Development configuration
├── publishconf.py          # Production configuration
├── pyproject.toml          # Python project metadata and dependencies
├── uv.lock                 # Locked dependencies
├── Makefile                # Build commands
├── .envrc                  # direnv configuration (auto-activate venv)
└── .gitignore              # Git ignore patterns
```

## Key Configuration Files

### pelicanconf.py (Development)
Development configuration located at: `/home/zundel/Src/ayershome-org-website/pelicanconf.py`

Key settings:
- **AUTHOR**: 'Eric Z. Ayers'
- **SITENAME**: 'Eric Z. Ayers'
- **THEME**: 'themes/monospace'
- **TIMEZONE**: 'America/New_York'
- **Menu Items**: Posts, Projects, About Me

URL structure:
- Articles: `posts/{YEAR}/{slug}/`
- Pages: `pages/{slug}.html`

### publishconf.py (Production)
Production configuration that extends pelicanconf.py:
- **SITEURL**: Currently set to 'https://yourdomain.com' (needs updating)
- Enables Atom feeds
- Sets `DELETE_OUTPUT_DIRECTORY = True`

### pyproject.toml
Project metadata and dependencies:
- Main dependencies: pelican, markdown, pelican-render-math
- Dev dependencies: pytest, mypy, pyright, ruff, pre-commit
- Ruff configured for Python 3.14, 100 char line length
- Mypy and pyright configured for strict type checking

## Development Workflow

### Initial Setup
```bash
uv sync                    # Install dependencies (creates .venv)
direnv allow              # Optional: auto-activate venv with direnv
```

### Common Commands (via Makefile)

```bash
make devserver            # Start dev server at http://localhost:8000 with auto-reload
make html                 # Build site once to output/
make regenerate           # Rebuild on file changes (without server)
make serve                # Serve existing output/ without rebuild
make publish              # Build for production (uses publishconf.py)
make clean                # Remove output/ directory
```

The `make devserver` command is the primary development command - it watches for file changes and rebuilds automatically.

### Environment

The `.envrc` file is configured for **direnv**, which:
- Auto-activates the `.venv` virtual environment when entering the directory
- Adds `scripts/` to PATH

## Content Creation

### Blog Posts

Create markdown files in `content/` with this frontmatter:

```markdown
Title: Your Post Title
Date: 2026-02-09 10:00
Category: Blog
Tags: tag1, tag2
Slug: your-post-slug
Summary: A brief summary of your post

Your post content here in Markdown format...
```

Example: `content/hello-world.md`

### Static Pages

Create markdown files in `content/pages/`:

```markdown
Title: Page Title
Slug: page-slug

Your page content in Markdown...
```

Existing pages: `about.md`, `projects.md`

## Theme Customization

The custom "monospace" theme is located at `themes/monospace/`:

- **Templates** (Jinja2): `themes/monospace/templates/`
  - `base.html` - Base template with sidebar
  - `index.html` - Post listing
  - `article.html` - Individual post view
  - `page.html` - Static page view

- **Styles**: `themes/monospace/static/css/style.css`
  - Dark background
  - Monospace/typewriter fonts
  - Left sidebar navigation

## Deployment

Target hosting: InMotion Hosting

### Build for Production
```bash
make publish              # Builds to output/ using publishconf.py
```

### Deploy
Upload the `output/` directory to the web hosting directory (usually `public_html/`).

Methods:
- FTP/SFTP
- rsync: `rsync -avz --delete output/ username@server.com:public_html/`

### Before First Deploy
Update `SITEURL` in `publishconf.py` with the actual production domain.

## Git Information

- **Current Branch**: main
- **Main Branch**: main (use for PRs)
- **Recent Commits**:
  - 321f52e - Added some skeleton work
  - 30475f0 - Create LICENSE.md
  - 89e3b57 - Update README

### Git Status (at conversation start)
New files staged: `.envrc`
Modified: `README.md`, `pyproject.toml`
Untracked: `Makefile`, `content/`, `output/`, config files, themes

## Important Patterns & Conventions

1. **No emojis** - Keep content and code professional
2. **No editorializing** - DO NOT add creative or editorial text to content. The user wants to be the original author. Use only the text they provide. Do not add introductory phrases, commentary, or descriptive text like "My journey..." or "Here's what I..."
3. **Grammar/spelling/punctuation fixes are acceptable** - Correcting typos, grammar errors, spelling mistakes, capitalization (especially brand names), and punctuation is fine. These are technical corrections, not editorial changes. **DO NOT hyphenate compound adjectives** - this is an AI writing tell. Leave hyphenation as the user writes it.
4. **Markdown extensions** - Code highlighting, extra features enabled
4. **Static paths** - Images go in `content/images/`, referenced as `/images/...`
5. **URL structure** - Posts organized by year: `/posts/2026/slug/`
6. **Feeds disabled in dev** - Atom feeds only generated in production
7. **No document-relative URLs** - Absolute URLs preferred (commented out in config)

## Development Tools

- **Linting**: `ruff` (configured in pyproject.toml)
- **Type Checking**: `mypy`, `pyright` (strict mode enabled)
- **Testing**: `pytest` (testpaths: tests/)
- **Pre-commit**: Configured for code quality checks

## Useful File Paths

When referencing code, use these key file paths:

- Config: `/home/zundel/Src/ayershome-org-website/pelicanconf.py`
- Publish config: `/home/zundel/Src/ayershome-org-website/publishconf.py`
- Theme base: `/home/zundel/Src/ayershome-org-website/themes/monospace/templates/base.html`
- Main stylesheet: `/home/zundel/Src/ayershome-org-website/themes/monospace/static/css/style.css`
- Example post: `/home/zundel/Src/ayershome-org-website/content/hello-world.md`

## Notes for Future Agents

- This is a Pelican static site, not a dynamic web application
- Content is written in Markdown and compiled to HTML
- The `output/` directory is the deployable static site
- All theming is custom - modifications go in `themes/monospace/`
- The site uses Python 3.14, which is quite recent
- Using `uv` for dependency management (not pip/poetry/pipenv)
- The `.envrc` suggests the developer uses direnv for environment management

## Common Tasks for Agents

When asked to:
- **Add a blog post**: Create a new `.md` file in `content/` with proper frontmatter
- **Modify the theme**: Edit files in `themes/monospace/templates/` or `.../static/css/`
- **Change site settings**: Edit `pelicanconf.py` (dev) or `publishconf.py` (prod)
- **Build the site**: Use `make html` or `make devserver`
- **Add a new page**: Create `.md` file in `content/pages/`, update MENUITEMS in config if needed

## Last Updated
2026-02-09
