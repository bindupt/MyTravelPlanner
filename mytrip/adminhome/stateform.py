from django import forms


from .models import StateModel


class State_form(forms.ModelForm):

    class Meta:
        model=StateModel
        fields=('country','State')
