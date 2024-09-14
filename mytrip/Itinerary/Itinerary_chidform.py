from django import forms
from .models import Itinerarychild_Model
gender_choices=[('Male','Male'),('Female','Female'),('Trans','Trans')]

class Itinerary_childform(forms.ModelForm):
    Gender =forms.CharField(widget=forms.RadioSelect(choices=gender_choices))
    class Meta:
        model=Itinerarychild_Model
        fields=('Reservation','ItineraryName','Age','Gender')

