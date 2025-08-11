from django.utils.html import format_html

class ViewOnSiteMixin:
    def view_link(self, obj):
        return format_html('<a class="btn btn-sm btn-primary" href="{}" target="_blank">View</a>', obj.get_absolute_url())
    view_link.short_description = "Preview"

    def view_on_site(self, obj):
        return obj.get_absolute_url()