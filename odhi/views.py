from django.shortcuts import render
from django.http import HttpResponse

def index(request):
    return render(request, "index.html", {"message": "Hello, world. You're at the OdhiTheVillager index."})
def about(request):
    return render(request, "about.html", {"message": "This is the about page of OdhiTheVillager."})
def contact(request):
    return render(request, "contact.html", {"message": "This is the contact page of OdhiTheVillager."})

def blog(request):
    return render(request, "blog.html", {"message": "Welcome to the OdhiTheVillager blog."})
def blogdetail(request):
    return render(request, "blogdetail.html", {"message": "This is the blog detail page of OdhiTheVillager."})
def video(request):
    return render(request,"video.html",{"message":"Hello,watch this awesome videos"})

# Create your views here.
