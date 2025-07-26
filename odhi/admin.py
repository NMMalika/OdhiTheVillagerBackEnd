from django.contrib import admin
from simple_history.admin import SimpleHistoryAdmin
from .models import Generalinfo, Hero, OtherVideo, EventType,EventMusic, LatestTrack
from django.shortcuts import redirect
from django.contrib import messages

admin.site.register(Generalinfo, SimpleHistoryAdmin)
class GeneralinfoAdmin(admin.ModelAdmin):
    list_display = ('logo', 'location', 'email', 'phone')
    search_fields = ('phone', 'email')
    

class GeneralinfoAdmin(SimpleHistoryAdmin):
    change_form_template = "admin/odhi/generalinfo/change_form.html"

    def response_change(self, request, obj):
        if "_revert" in request.POST:
            history_id = request.POST.get("history_id")
            if history_id:
                history_instance = obj.history.get(id=history_id)
                history_instance.instance.save()
                self.message_user(request, "Reverted to selected version", messages.SUCCESS)
                return redirect(".")
        return super().response_change(request, obj)

class HeroAdmin(admin.ModelAdmin):
    list_display = ('title', 'description', 'youtube_link')
    search_fields = ('title',)
admin.site.register(Hero, HeroAdmin)

class OtherVideoAdmin(admin.ModelAdmin):
    list_display = ('title', 'caption', 'youtube_link', 'created_at')
    search_fields = ('title', 'caption')

admin.site.register(OtherVideo, OtherVideoAdmin)


class EventTypeAdmin(admin.ModelAdmin):
    list_display = ('title', 'description', 'icon')
    search_fields = ('title',)

admin.site.register(EventType, EventTypeAdmin)

class EventMusicAdmin(admin.ModelAdmin):
    list_display = ('title', 'artist')
    search_fields = ('title', 'artist')

admin.site.register(EventMusic, EventMusicAdmin)

@admin.register(LatestTrack)
class MusicTrackAdmin(admin.ModelAdmin):
    list_display = ('title', 'artist', 'created_at')
    search_fields = ('title',)
    ordering = ('-created_at',)