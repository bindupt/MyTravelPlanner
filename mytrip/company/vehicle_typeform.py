from django import forms


from .models import  Vehicle_typeModel


class vehicle_typeform(forms.ModelForm):

    class Meta:
        model=Vehicle_typeModel
        fields=('id','vehicle_type')
