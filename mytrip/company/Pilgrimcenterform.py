from django import forms
from .models import PilgrimcenterModel

class pilgrim_centerform(forms.ModelForm):
    Pilg_Address = forms.CharField(widget=forms.Textarea(attrs={'rows':4,'cols':40}))
    Pilg_Description = forms.CharField(widget=forms.Textarea(attrs={'rows':4,'cols':40}))
    class Meta:
        model=PilgrimcenterModel
        fields=('Location','District','state','country','Pilg_Name','Pilg_Address',
                'Pilg_Description','Pilg_image','Pilg_link')
