# ayershome-org-website

Source code for my personal website built with Pelican static site generator.

## Features

- Dark theme with monospace (typewriter) font
- Left sidebar with navigation
- Blog posts, Projects page, and About Me page
- Responsive design
- Markdown-based content

## Getting Started

### Prerequisites

- Python 3.14+
- uv (Python package manager)

### Setup

1. Clone this repository
2. Install dependencies:
   ```bash
   uv sync
   ```

### Local Development

Build and serve the site locally:

```bash
make devserver
```

This will start a local server at http://localhost:8000 with auto-reload on file changes.

Or build once:

```bash
make html
```

### Writing Content

#### Blog Posts

Create new blog posts in the `content/` directory:

```markdown
Title: Your Post Title
Date: 2026-02-09 10:00
Category: Blog
Tags: tag1, tag2
Slug: your-post-slug
Summary: A brief summary of your post

Your post content goes here in Markdown format...
```

#### Pages

Create pages in `content/pages/`:

```markdown
Title: Page Title
Slug: page-slug

Your page content in Markdown...
```

### Publishing

1. Update `SITEURL` in `publishconf.py` with your domain
2. Build the production site:
   ```bash
   make publish
   ```
3. Upload the `output/` directory to your InMotion hosting account

### Customization

- **Configuration**: Edit `pelicanconf.py`
- **Theme**: Customize `themes/monospace/` (templates and CSS)
- **Content**: Add/edit files in `content/`

## Directory Structure

```
.
├── content/              # Your blog posts and pages
│   ├── pages/           # Static pages (About, Projects)
│   └── *.md             # Blog posts
├── themes/
│   └── monospace/       # Custom theme
│       ├── templates/   # HTML templates
│       └── static/      # CSS and other static files
├── output/              # Generated site (deploy this)
├── pelicanconf.py       # Development configuration
├── publishconf.py       # Production configuration
└── Makefile            # Build commands
```

## InMotion Hosting Deployment

To deploy to your InMotion hosting account:

1. Build the production site: `make publish`
2. Upload the contents of the `output/` directory to your web hosting directory (usually `public_html/`)
3. You can use FTP, SFTP, or rsync to transfer files

Example using rsync (update with your hosting details):
```bash
rsync -avz --delete output/ username@yourserver.com:public_html/
```
