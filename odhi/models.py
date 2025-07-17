from django.db import models

# Create your models here.
class Generalinfo(models.Model):
    name = models.CharField(max_length=100)
    location = models.CharField(max_length=100 blank=True, null=True)
    email= models.EmailField(max_length=100)
    phone = models.CharField(max_length=15)
    facebook = models.URLField(max_length=200, blank=True, null=True)
    instagram = models.URLField(max_length=200, blank=True, null=True)
    twitter = models.URLField(max_length=200, blank=True, null=True)    
    linkedin = models.URLField(max_length=200, blank=True, null=True)
    youtube = models.URLField(max_length=200, blank=True, null=True)
    

    def __str__(self):
        return self.name
