from django import forms


from .models import DestinationModel


class Destination_form(forms.ModelForm):

    class Meta:
        model=DestinationModel
        fields=('Destination','Category','Location','District','state','image')
