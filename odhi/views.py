from django.shortcuts import render
from django.http import HttpResponse
from django.shortcuts import get_object_or_404, redirect, render
from django.core.paginator import Paginator
from .models import Event,EventMusic, EventType, Generalinfo,Hero, OtherVideo, LatestTrack,Album,FAQ,Blogs,Comment
from django.contrib import messages
from .forms import NewsletterForm,CommentForm
from .models import NewsletterSubscriber
from django.utils import timezone
from .models import Video



def index(request):
    now = timezone.now()
    
    video = Video.objects.filter(release_datetime__gte=now).order_by('release_datetime').first()
    
    if not video:
        video = Video.objects.order_by('-release_datetime').first()

    released = video.is_released() if video else False
    
    hero = Hero.objects.first()  # Get the first hero object
    videos = OtherVideo.objects.all()
    eventtypes = EventType.objects.all()
    eventmusics = EventMusic.objects.first()
    latest_tracks = LatestTrack.objects.all()[:6]
    events = Event.objects.filter(is_active=True).order_by('date')
    
    # Fetch all albums, ordered by the release date (newest first)
    albums = Album.objects.all()

    return render(request, "index.html", {
        'hero': hero,
        'videos': videos,
        'eventtypes': eventtypes,
        'eventmusics': eventmusics,
        'latest_tracks': latest_tracks,
        'albums': albums,
        'events': events,
        'video': video,
        'released': released,
        'now': now,
    })
def about(request):
    return render(request, "about.html", {"message": "This is the about page of OdhiTheVillager."})

def contact(request):
    faqs = FAQ.objects.all()
    
    # --- TEMPORARY DEBUG CODE ---
    print(f"Number of FAQs retrieved: {faqs.count()}")
    # --- END DEBUG CODE ---

    test_message = "Your contact view is working correctly! 🎉"

    context = {
        'faqs': faqs,
        'test_message': test_message,
    }
    return render(request, "contact.html", context)

    
  
def blog(request):
    recent_blogs = Blogs.objects.all().order_by('-created_at')  # Get all blogs ordered by creation date
    paginator = Paginator(recent_blogs, 5)  # Show 5 blogs per page
    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)
    return render(request, "blog.html", {'page_obj': page_obj, 'recent_blogs': recent_blogs})


def blogdetail(request, blog_id):
    blog = Blogs.objects.get(id=blog_id)
    recent_blogs = Blogs.objects.all().exclude(id=blog_id).order_by('-created_at')[:4]  # Get the 4 most recent blogs
      # Previous post: blog with ID less than current (older)
    previous_blog = Blogs.objects.filter(id__lt=blog_id).order_by('-id').first()

    # Next post: blog with ID greater than current (newer)
    next_blog = Blogs.objects.filter(id__gt=blog_id).order_by('id').first()
    
    if request.method == "POST":
        form = CommentForm(request.POST)
        if form.is_valid():
            comment = form.save(commit=False)
            comment.blog = blog  # Link comment to this blog
            comment.save()
            return redirect('blogdetail', blog_id=blog.id)
    else:
        form = CommentForm()

    
    comments = blog.comments.filter(approved=True).order_by('-created_at')
    
    return render(request, "blogdetail.html", {
        'blog': blog,
        'recent_blogs': recent_blogs,
        'previous_blog': previous_blog,
        'next_blog': next_blog,
        'form': form,
        'comments': comments
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
    if request.method == 'POST':
        form = NewsletterForm(request.POST)
        if form.is_valid():
            name = form.cleaned_data['name']
            email = form.cleaned_data['email']
            NewsletterSubscriber.objects.get_or_create(name=name, email=email)
            messages.success(request, "Thanks for subscribing!")
            return redirect(request.META.get('HTTP_REFERER', '/'))
        else:
            messages.error(request, "Invalid input. Try again.")
    return redirect('/')

def video(request):
    now = timezone.now()
    
    # Reuse same logic as index
    video = Video.objects.filter(release_datetime__gte=now).order_by('release_datetime').first()
    if not video:
        video = Video.objects.order_by('-release_datetime').first()

    released = video.is_released() if video else False

    # Add any other context you want on the video page
    videos = OtherVideo.objects.all()
    hero = Hero.objects.first()
    
    return render(request, "video.html", {
        'video': video,
        'released': released,
        'now': now,
        'videos': videos,
        'hero': hero,
    })