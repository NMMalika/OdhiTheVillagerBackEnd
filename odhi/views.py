from django.shortcuts import render
from django.http import HttpResponse
from django.shortcuts import get_object_or_404, redirect, render
from .models import Generalinfo,Hero, OtherVideo
from django.contrib import messages

def index(request):
    hero = Hero.objects.first()  # Get the first hero object
    videos = OtherVideo.objects.all()
    return render(request, "index.html", {'hero': hero, 'videos': videos})
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
def generalinfo_history(request, pk):
    obj = get_object_or_404(Generalinfo, pk=pk)
    history_list = obj.history.all().order_by('-history_date')
    return render(request, 'history.html', {'object': obj, 'history_list': history_list})

def revert_generalinfo(request, pk, history_id):
    obj = get_object_or_404(Generalinfo, pk=pk)
    historical = get_object_or_404(obj.history.model, id=history_id)

    if request.method == 'POST':
        # Revert all fields except 'id'
        for field in obj._meta.fields:
            if field.name != 'id':
                setattr(obj, field.name, getattr(historical, field.name))
        obj.save()
        messages.success(request, "Successfully reverted to selected version.")
        return redirect('generalinfo_history', pk=pk)

    return render(request, 'confirm_revert.html', {'object': obj, 'historical': historical})