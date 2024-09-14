from django import  forms
from .models import Itinerary_Model


class Itinerary_regForm(forms.ModelForm):

    Address = forms.CharField(widget=forms.Textarea(attrs={'rows': 3, 'cols': 30}))
    UserName = forms.CharField(max_length=20)
    Password =forms.CharField(max_length=10,widget=forms.PasswordInput)
    Confirm_Password = forms.CharField(max_length=20,widget=forms.PasswordInput)
    class Meta:
        model = Itinerary_Model
        fields = ('First_name','Last_name','Address','Location','State','Country','ZIP' ,'Mobno', 'Email')
