"""
URL configuration for OdhiTheVillager project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/5.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include
from  odhi import views
from django.conf import settings
from django.conf.urls.static import static

admin.site.site_header = "Odhi The Villager Admin"
admin.site.site_title = "Odhi Admin Portal"
admin.site.index_title = "Welcome to the Admin Portal"

urlpatterns = [
    path("admin/", admin.site.urls),
    path("", views.index, name="index"),
    path("about/", views.about, name="about"),
    path("contact/", views.contact, name="contact"),
    path("blog/", views.blog, name="blog"),
    path("blogdetail/<blog_id>", views.blogdetail, name="blogdetail"),
    path("video/",views.video,name="video"),
    path('generalinfo/<int:pk>/history/', views.generalinfo_history, name='generalinfo_history'),
    path('generalinfo/<int:pk>/revert/<int:history_id>/', views.revert_generalinfo, name='revert_generalinfo'),
    path('tinymce/', include('tinymce.urls'))
 
]
if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)