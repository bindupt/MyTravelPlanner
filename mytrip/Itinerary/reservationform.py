from django import forms
from .models import  Reservation_Model


class DateInput(forms.DateInput):
        input_type = 'date'
gender_choices=[('Male','Male'),('Female','Female'),('Trans','Trans')]


class reservationform(forms.ModelForm):
        TotalAmount=forms.IntegerField()
        Street_Address = forms.CharField(widget=forms.Textarea(attrs={'rows':4,'cols':40}))
        Gender =forms.CharField(widget=forms.RadioSelect(choices=gender_choices))
        class Meta:
                model=Reservation_Model
                fields=('Name','Street_Address','Age','Gender','Mobile','email','Profession','Organization','Country','State','City',
                'ZIP','Adults','Children','No_of_Persons','TotalAmount')
