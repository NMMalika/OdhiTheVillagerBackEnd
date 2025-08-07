from .models import Generalinfo
from .forms import NewsletterForm

def general_info(request):
    info = Generalinfo.objects.first()  # Assumes only one Generalinfo object
    return {'general_info': info}


def newsletter_form(request):
    return {'newsletter_form': NewsletterForm()}
