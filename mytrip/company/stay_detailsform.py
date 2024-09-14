from django import forms
from .models import Stay_DetailsModel

class stay_detailsform(forms.ModelForm):

    class Meta:
        model=Stay_DetailsModel
        fields=('Stay_category','Name','Address','Location','District','state',
                'Tarrif_range','Lphone','mobno','fax','email','images','link')


