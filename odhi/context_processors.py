from .models import Generalinfo

def general_info(request):
    info = Generalinfo.objects.first()  # Assumes only one Generalinfo object
    return {'general_info': info}