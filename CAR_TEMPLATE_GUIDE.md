# Car Page Template Guide

This guide explains how to create consistent car pages using the custom car template system.

## Overview

The car template system automatically handles:
- Consistent page layout and styling
- Photo display with credits
- Eric-o-meter ratings
- Automatic prev/next navigation based on chronological order

## Creating a New Car Page

### 1. Create a new markdown file

Create a file in `content/pages/cars/` with the format `make-model.md` (lowercase, hyphenated).

Example: `content/pages/cars/honda-civic.md`

### 2. Add the required metadata

Use this template for your car page:

```markdown
Title: YYYY Make Model
Slug: cars/make-model
Template: car
Car_Year: YYYY
Car_Make: Make
Car_Model: Model
Photo: /images/YYYY-make-model.jpg
Photo_Credit_Text: Source Name
Photo_Credit_Url: https://source-url.com
Eric_Rating: X

Your story and memories about this car go here...
```

### 3. Required Metadata Fields

| Field | Description | Example |
|-------|-------------|---------|
| `Title` | Full car name with year | `1979 Honda Accord` |
| `Slug` | URL path (must start with `cars/`) | `cars/honda-accord` |
| `Template` | Must be set to `car` | `car` |
| `Car_Year` | Year as a number (used for sorting) | `1979` |
| `Car_Make` | Manufacturer name | `Honda` |
| `Car_Model` | Model name | `Accord` |
| `Photo` | Path to image in `/images/` | `/images/1979-honda-accord.jpg` |
| `Photo_Credit_Text` | Credit text for photo | `California Streets Blog` |
| `Photo_Credit_Url` | Link to photo source | `https://...` |
| `Eric_Rating` | Rating out of 10 | `10` |

### 4. Optional Metadata Fields

- `Photo_Credit_Url` - Can be omitted if you don't have a link (will show text only)

## How It Works

### Automatic Navigation

The `car_navigation` plugin automatically:
1. Finds all pages with `Template: car`
2. Sorts them by `Car_Year` (oldest to newest)
3. Links them with prev/next navigation
4. Handles first/last pages (grays out disabled arrows)

**You never need to manually update navigation links!** When you add a new car, just set the year correctly and the plugin handles the rest.

### Consistent Layout

The `car.html` template ensures every car page has:
- Title in "YYYY Make Model" format
- Photo displayed at full width
- Photo credit with optional link
- Eric-o-meter rating section
- Your story/content
- Bottom navigation bar with prev/next/about links

## Complete Example

Here's the complete `honda-accord.md` file:

```markdown
Title: 1979 Honda Accord
Slug: cars/honda-accord
Template: car
Car_Year: 1979
Car_Make: Honda
Car_Model: Accord
Photo: /images/1979-honda-accord.jpg
Photo_Credit_Text: California Streets Blog
Photo_Credit_Url: https://californiastreets.blogspot.com/2014/04/san-ramon-street-sighting-1979-honda.html
Eric_Rating: 10

I drove a 1979 Accord in college in the early 90's and absolutely loved it. One of my all time favorite cars. It was a hand me down from my sister, which was formerly driven by the homecoming queen from our high school. Ours was just like this one, with maroon interior and silver paint job. I can still hear it cranking up!
```

## Converting Existing Pages

To convert an old car page to the new template:

1. Replace all the frontmatter with the new metadata fields
2. Remove manual HTML for:
   - Image display (`![...]`)
   - Photo credit (`*Photo credit:*`)
   - Eric-o-meter heading (`## Eric-o-meter:`)
   - Navigation div (`<div style="display: flex...">`)
   - Horizontal rule (`---`)
3. Keep only the story content text
4. Add `Template: car` to the metadata

## Testing

After creating or modifying a car page:

```bash
make html        # Build the site
make serve       # View at http://localhost:8000
```

Navigate to your car page and verify:
- Photo displays correctly
- Photo credit appears with link
- Eric-o-meter shows correct rating
- Prev/next navigation works (check chronological order)
- Page styling is consistent with other car pages

## Troubleshooting

**Navigation not working?**
- Verify `Template: car` is set
- Check that `Car_Year` is a valid number
- Rebuild: `make clean && make html`

**Photo not showing?**
- Verify image exists in `content/images/`
- Check the path starts with `/images/`
- Ensure filename matches exactly (case-sensitive)

**Rating not displaying?**
- Make sure `Eric_Rating` uses underscore (not hyphen)
- Value should be just the number (e.g., `10`, not `10/10`)

## File Locations

- **Template**: `themes/monospace/templates/car.html`
- **Plugin**: `plugins/car_navigation.py`
- **Config**: Plugin enabled in `pelicanconf.py`
- **Content**: All car pages in `content/pages/cars/`

## Customizing the Template

To modify the car page layout for all pages:

1. Edit `themes/monospace/templates/car.html`
2. Changes apply to all car pages automatically
3. Rebuild with `make html`

Common customizations:
- Change photo size/styling
- Adjust Eric-o-meter display
- Modify navigation button style
- Add additional metadata fields
