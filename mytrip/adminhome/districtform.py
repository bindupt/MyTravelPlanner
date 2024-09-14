from django import forms


from .models import  DistrictModel


class District_form(forms.ModelForm):
    Description = forms.CharField(widget=forms.Textarea(attrs={'rows':4,'cols':40}))

    class Meta:
        model=DistrictModel
        fields=('state','District','Area','Population','Altitude','Telcode','Description','Air','Rail','Road','Backwarter')







