from django import  forms
from .models import Company_Model

class company_regForm(forms.ModelForm):
    UserName = forms.CharField(max_length=20)
    Password =forms.CharField(max_length=10,widget=forms.PasswordInput)
    Confirm_Password = forms.CharField(max_length=20,widget=forms.PasswordInput)
    Address = forms.CharField(widget=forms.Textarea(attrs={'rows':4,'cols':40}))
    Address1 = forms.CharField(widget=forms.Textarea(attrs={'rows':4,'cols':40}))
    class Meta:
        model = Company_Model
        fields = ('Company_Name','Com_Regist_No', 'Vat_No','Tin_No' ,'Tin_No' ,'Tin_No' ,
                  'Address','Address1','Location','State','Country', 'ZIP' ,'Phone1',
                  'Phone2','Fax','Email')


