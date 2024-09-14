from django import forms
from .models import  Tour_PackageModel
class DateInput(forms.DateInput):
    input_type = 'date'


class tourpackageform(forms.ModelForm):
    #Duration = forms.DateField(widget=DateInput)
    Package_Contents = forms.CharField(widget=forms.Textarea(attrs={'rows':4,'cols':40}))
    class Meta:
        model=Tour_PackageModel
        fields=('Package_Name','Duration','Stay_category','Stay_Name','No_of_Packages','Price',
                'Package_Contents','Insurance_Company','Image','Image1','Destination','pilgrimcenter')
