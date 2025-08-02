from django.shortcuts import render
from django.http import HttpResponse
from django.shortcuts import get_object_or_404, redirect, render

from odhi.forms import SubscriberForm
from .models import EventMusic, EventType, Generalinfo,Hero, OtherVideo, LatestTrack,Album,FAQ,Blogs
from django.contrib import messages

def index(request):
    hero = Hero.objects.first()  # Get the first hero object
    videos = OtherVideo.objects.all()
    eventtypes = EventType.objects.all()
    eventmusics = EventMusic.objects.first()
    latest_tracks = LatestTrack.objects.all()[:6]
    
    # Fetch all albums, ordered by the release date (newest first)
    albums = Album.objects.all()

    return render(request, "index.html", {
        'hero': hero,
        'videos': videos,
        'eventtypes': eventtypes,
        'eventmusics': eventmusics,
        'latest_tracks': latest_tracks,
        'albums': albums
    })
def about(request):
    return render(request, "about.html", {"message": "This is the about page of OdhiTheVillager."})

def contact(request):

        
    faqs = FAQ.objects.all()
    context = {
        'faqs': faqs,
        #... other context data
    }
    return render(request, "contact.html", context)

    
  
def blog(request):
    recent_blogs = Blogs.objects.all().order_by('-created_at')  # Get all blogs ordered by creation date
    return render(request, "blog.html", {'recent_blogs': recent_blogs})


def blogdetail(request, blog_id):
    blog = Blogs.objects.get(id=blog_id)
    recent_blogs = Blogs.objects.all().exclude(id=blog_id).order_by('-created_at')[:4]  # Get the 4 most recent blogs
    return render(request, "blogdetail.html", {
        'blog': blog,
        'recent_blogs': recent_blogs
    })


def video(request):
    hero = Hero.objects.first()
    videos = OtherVideo.objects.all()
    return render(request,"video.html",{'hero': hero, 'videos': videos})

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
def subscribe(request):
    form = SubscriberForm()
    if request.method == 'POST':
        form = SubscriberForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('subscribe_success')  # Optional: make this your homepage or thank you page
    return render(request, 'footer.html', {'form': form})