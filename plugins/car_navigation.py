"""
Car Navigation Plugin for Pelican

Automatically generates prev/next navigation links for car pages
based on chronological order (car_year metadata).
"""

from pelican import signals


def add_car_navigation(generator):
    """
    Add prev_car and next_car attributes to car pages for navigation.

    Finds all pages using the 'car' template and sorts them by car_year,
    then links them together with prev/next references.
    """
    # Find all car pages
    car_pages = []
    for page in generator.pages:
        # Check if this page uses the car template
        template = getattr(page, 'template', None)
        if template == 'car':
            car_year = getattr(page, 'car_year', None)
            if car_year:
                try:
                    # Convert year to int for proper sorting
                    year_int = int(car_year)
                    car_pages.append((year_int, page))
                except (ValueError, TypeError):
                    print(f"Warning: Invalid car_year '{car_year}' for page {page.source_path}")

    # Sort by year
    car_pages.sort(key=lambda x: x[0])

    # Add prev/next navigation
    for i, (year, page) in enumerate(car_pages):
        # Add previous car link
        if i > 0:
            page.prev_car = car_pages[i-1][1]
        else:
            page.prev_car = None

        # Add next car link
        if i < len(car_pages) - 1:
            page.next_car = car_pages[i+1][1]
        else:
            page.next_car = None


def register():
    """Register the plugin with Pelican."""
    signals.page_generator_finalized.connect(add_car_navigation)
