from django import forms

from .models import FeedbackModel
   
class feedback_form(forms.ModelForm):    

    class Meta:
        model= FeedbackModel
        fields=('Email','Message',)
       