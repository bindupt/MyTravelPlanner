from django import forms


from .models import  CountryModel


class Country_form(forms.ModelForm):

    class Meta:
        model=CountryModel
        fields=('id','Country')
