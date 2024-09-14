from django import  forms

from registration.models import Itinerary_Model


class Itinerary_regForm(forms.ModelForm):

    class Meta:
        model = Itinerary_Model
        fields = ('First_name','Last_name','Address','Location','State','Country','ZIP' ,'Mobno', 'Email')
