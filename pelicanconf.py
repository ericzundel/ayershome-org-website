#!/usr/bin/env python
# -*- coding: utf-8 -*-

AUTHOR = 'Eric Z. Ayers'
SITENAME = 'Eric Z. Ayers'
SITEURL = ''

PATH = 'content'
TIMEZONE = 'America/New_York'
DEFAULT_LANG = 'en'

# Feed generation is usually not desired when developing
FEED_ALL_ATOM = None
CATEGORY_FEED_ATOM = None
TRANSLATION_FEED_ATOM = None
AUTHOR_FEED_ATOM = None
AUTHOR_FEED_RSS = None

# Blogroll (links to display)
LINKS = ()

# Social widget
SOCIAL = (
    ('GitHub', 'https://github.com/ericzundel/'),
    ('LinkedIn', 'https://www.linkedin.com/in/ericzayers/'),
    ('YouTube', 'https://www.youtube.com/c/EricAyers'),
)

DEFAULT_PAGINATION = 10

# Uncomment following line if you want document-relative URLs when developing
# RELATIVE_URLS = True

# Theme settings
THEME = 'themes/monospace'

# Monospace theme specific settings
SITEDESCRIPTION = 'Personal blog and projects'

# Menu items (for the sidebar)
MENUITEMS = [
    ('Posts', '/'),
    ('Projects', '/pages/projects.html'),
    ('About Me', '/pages/about.html'),
]

# Display pages in menu
DISPLAY_PAGES_ON_MENU = False

# URL settings
ARTICLE_URL = 'posts/{date:%Y}/{slug}/'
ARTICLE_SAVE_AS = 'posts/{date:%Y}/{slug}/index.html'
PAGE_URL = 'pages/{slug}.html'
PAGE_SAVE_AS = 'pages/{slug}.html'

# Static paths
STATIC_PATHS = ['images', 'extra']

# Markdown extensions
MARKDOWN = {
    'extension_configs': {
        'markdown.extensions.codehilite': {'css_class': 'highlight'},
        'markdown.extensions.extra': {},
        'markdown.extensions.meta': {},
    },
    'output_format': 'html5',
}

# Plugins
PLUGIN_PATHS = ['plugins']
PLUGINS = ['car_navigation']
