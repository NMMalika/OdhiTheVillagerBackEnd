from django.db import models
from django.utils import timezone
from simple_history.models import HistoricalRecords


# Create your models here.
class Generalinfo(models.Model):
    logo = models.ImageField(upload_to='logos/', blank=True, null=True)
    location = models.CharField(max_length=100 ,blank=True, null=True)
    email= models.EmailField(max_length=100)
    phone = models.CharField(max_length=15)
    facebook = models.URLField(max_length=200, blank=True, null=True)
    instagram = models.URLField(max_length=200, blank=True, null=True)
    twitter = models.URLField(max_length=200, blank=True, null=True)    
    linkedin = models.URLField(max_length=200, blank=True, null=True)
    youtube = models.URLField(max_length=200, blank=True, null=True)
    
    history = HistoricalRecords()
    
    class Meta:
        verbose_name = "General Info"
        verbose_name_plural = "General Info"
        
    def __str__(self):
        return "General Info"
class Hero(models.Model):
    title = models.CharField(max_length=100)
    description = models.TextField()
    image = models.ImageField(upload_to='heroes/', blank=True, null=True)
    youtube_link = models.URLField(max_length=200, blank=True, null=True)
    history = HistoricalRecords()
    
    def __str__(self):
        return self.title
    class Meta:
        verbose_name = "Hero"
        verbose_name_plural = "Heroes"   
        
class OtherVideo(models.Model):
    title = models.CharField(max_length=255)
    caption = models.CharField(max_length=255)
    youtube_link = models.URLField(help_text="Paste full YouTube URL e.g. https://www.youtube.com/watch?v=XXXXXXXXXXX")
    year = models.CharField(max_length=10)
    artist = models.CharField(max_length=100, default="Odhi The Villager")
    created_at = models.DateTimeField(default=timezone.now)

    def video_id(self):
        # Extract video ID from YouTube link
        from urllib.parse import urlparse, parse_qs
        query = urlparse(self.youtube_link)
        return parse_qs(query.query).get("v", [""])[0]

    def __str__(self):
        return self.title
    class Meta:
        verbose_name = "Other Video"
        verbose_name_plural = "Other Videos"
        
class EventType(models.Model):
    title = models.CharField(max_length=100)
    description = models.TextField()
    icon = models.CharField(max_length=100)  # Store icon class name (e.g. bi-heart)
    history = HistoricalRecords()
    
    
    

    def __str__(self):
        return self.title
    class Meta:
        verbose_name = "Event Type"
        verbose_name_plural = "Event Types"

class EventMusic(models.Model):
    title = models.CharField(max_length=100)
    artist = models.CharField(max_length=100)
    audio_file = models.FileField(upload_to='music/')  # for MP3s
    # Optional: link = models.URLField(blank=True, null=True)  # if from YouTube
    cover_image = models.ImageField(upload_to='covers/', blank=True)
    preview_duration = models.IntegerField(default=60)  # in seconds

    def __str__(self):
        return f"{self.title} - {self.artist}"
    class Meta:
        verbose_name = "Event Music"
        verbose_name_plural = "Event Music"

class LatestTrack(models.Model):
    title = models.CharField(max_length=255)
    artist = models.CharField(max_length=255, default="Odhi The Villager")
    cover_image = models.ImageField(upload_to='track_covers/')
    audio_preview = models.FileField(upload_to='audio_previews/', blank=True, null=True)  # optional
    buy_link = models.URLField()
    created_at = models.DateTimeField(auto_now_add=True)

    class Meta:
        ordering = ['-created_at']  # Newest first
        verbose_name = "Latest Track"
        verbose_name_plural = "Latest Tracks"

    def __str__(self):
        return f"{self.title} - {self.artist}"
class Album(models.Model):
    title = models.CharField(max_length=255)
    description = models.TextField(blank=True, null=True)
    cover_image = models.ImageField(upload_to='album_covers/')
    SoundCloud = models.URLField(max_length=200, help_text="Link to the album on SoundCloud")
    spotify_link = models.URLField(max_length=200, blank=True, null=True, help_text="Link to the album on Spotify")
    apple_music_link = models.URLField(max_length=200, blank=True, null=True, help_text="Link to the album on Apple Music")
    boomplay_link = models.URLField(max_length=200, blank=True, null=True, help_text="Link to the album on Boomplay")
    hustlesasa_link = models.URLField(max_length=200, blank=True,null=True, help_text="Link to the album on HustleSasa")
    youtube_link = models.URLField(max_length=200, blank=True, null=True, help_text="Link to the album on YouTube")
    release_date = models.DateField(auto_now_add=True)

    class Meta:
        ordering = ['-release_date']  # Show the newest albums first
        verbose_name = "Album"
        verbose_name_plural = "Albums"

    def __str__(self):
        return self.title