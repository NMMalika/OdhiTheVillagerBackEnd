from django.contrib import admin
from simple_history.admin import SimpleHistoryAdmin
from .models import Generalinfo
from django.shortcuts import redirect
from django.contrib import messages

admin.site.register(Generalinfo, SimpleHistoryAdmin)
class GeneralinfoAdmin(admin.ModelAdmin):
    list_display = ('logo', 'location', 'email', 'phone')
    search_fields = ('phone', 'email')
    

class GeneralinfoAdmin(SimpleHistoryAdmin):
    change_form_template = "admin/odhi/generalinfo/change_form.html"

    def response_change(self, request, obj):
        if "_revert" in request.POST:
            history_id = request.POST.get("history_id")
            if history_id:
                history_instance = obj.history.get(id=history_id)
                history_instance.instance.save()
                self.message_user(request, "Reverted to selected version", messages.SUCCESS)
                return redirect(".")
        return super().response_change(request, obj)

