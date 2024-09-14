from django import forms

from .models import EventModel

class DateInput(forms.DateInput):
    input_type = 'date'
class Event_form(forms.ModelForm):
    Date = forms.DateField(widget=DateInput)
    Description = forms.CharField(widget=forms.Textarea(attrs={'rows':4,'cols':40}))
    Importance = forms.CharField(widget=forms.Textarea(attrs={'rows':4,'cols':40}))

    class Meta:
        model= EventModel
        fields=('Event','Description','Importance', 'Date','Country','state','District')


