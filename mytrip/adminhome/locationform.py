from django import forms

from .models import  LocationModel


class Location_form(forms.ModelForm):
    Description = forms.CharField(widget=forms.Textarea(attrs={'rows':4,'cols':40}))
    Location = forms.CharField(widget=forms.TextInput (attrs={'cols':40}))
    class Meta:
        model=LocationModel
        fields=('district','Location','Description','Hw_to_reach')

