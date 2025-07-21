from django.db import models
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
    