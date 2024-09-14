from django import forms

from .models import Destination_catModel

class Destination_cat_form(forms.ModelForm):

    class Meta:
        model=Destination_catModel
        fields=('id','Destination_cat')
