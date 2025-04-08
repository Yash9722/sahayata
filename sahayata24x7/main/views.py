
from django.http import HttpResponse

def home(request):
    return HttpResponse("<h1>Welcome to sahayata24x7!</h1>")
