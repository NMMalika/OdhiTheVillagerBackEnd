
from django import forms
from .models import NewsletterSubscriber, Comment

class NewsletterForm(forms.ModelForm):
    class Meta:
        model = NewsletterSubscriber
        fields = ['name', 'email']  
# your_app/forms.py

class CommentForm(forms.ModelForm):
    class Meta:
        model = Comment
        fields = ['name', 'email', 'phone_number', 'comment']