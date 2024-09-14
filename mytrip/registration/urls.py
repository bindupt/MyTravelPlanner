from . import views
from django.urls import path

urlpatterns = [

    path('',views.home,name='home'),
    path('company_reg',views.company_reg,name='company_reg'),
    path('itinerary_reg',views.itinerary_reg,name='itinerary_reg'),
    path('login',views.login,name='login'),
]
