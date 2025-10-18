from django.contrib.sitemaps import Sitemap
from django.shortcuts import reverse
from .models import Blogs, Album, Event
from django.utils import timezone


# 📰 BLOG SITEMAP
class BlogSitemap(Sitemap):
    changefreq = "weekly"
    priority = 0.8

    def items(self):
        return Blogs.objects.all().order_by('-created_at')

    def lastmod(self, obj):
        return obj.created_at

    def location(self, obj):
        return obj.get_absolute_url()


# 💿 ALBUM SITEMAP
class AlbumSitemap(Sitemap):
    changefreq = "monthly"
    priority = 0.7

    def items(self):
        return Album.objects.all()

    def lastmod(self, obj):
        return obj.release_date

    def location(self, obj):
        # if you have a detail view, update the reverse() accordingly
        return reverse("album_detail", kwargs={"album_id": obj.id})


# 🎤 EVENT SITEMAP
class EventSitemap(Sitemap):
    changefreq = "monthly"
    priority = 0.6

    def items(self):
        return Event.objects.filter(is_active=True)

    def lastmod(self, obj):
        return obj.date

    def location(self, obj):
        # adjust to your event detail url name
        return reverse("event_detail", kwargs={"event_id": obj.id})


# 🏠 STATIC PAGE SITEMAP
class StaticViewSitemap(Sitemap):
    changefreq = "monthly"
    priority = 0.5

    def items(self):
        # these should match your URL names in urls.py
        return ['index', 'about', 'blog', 'contact']

    def location(self, item):
        return reverse(item)
