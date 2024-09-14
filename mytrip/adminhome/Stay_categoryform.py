from django import forms
from .models import Stay_categoryModel

class stay_categoryform(forms.ModelForm):

    class Meta:
        model=Stay_categoryModel
        fields=('Stay_type','photo')







