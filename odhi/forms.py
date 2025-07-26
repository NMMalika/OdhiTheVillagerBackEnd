from django import forms
from .models import EventMusic

class EventMusicForm(forms.ModelForm):
    class Meta:
        model = EventMusic
        fields = ['title', 'artist', 'audio_file', 'cover_image']