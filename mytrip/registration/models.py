from django.db import models

# Create your models here.
import django.utils.timezone
from django.contrib.auth.models import User
from django.db import models

from adminhome.models import LocationModel, StateModel, CountryModel


class Company_Model(models.Model):
    Company_Name =models.CharField(max_length=50)
    Com_Regist_No = models.CharField(max_length=20)
    Vat_No =models.CharField(max_length=50)
    Tin_No  =models.CharField(max_length=50)
    Address  =models.TextField(max_length=50)
    Address1  =models.TextField(max_length=50)
    Location = models.ForeignKey(LocationModel,on_delete=models.CASCADE)
    State=models.ForeignKey(StateModel,on_delete=models.CASCADE)
    Country=models.ForeignKey(CountryModel,on_delete=models.CASCADE)
    ZIP =models.CharField(max_length=50)
    Phone1 =models.BigIntegerField()
    Phone2 =models.BigIntegerField()
    Fax= models.BigIntegerField()
    Email = models.EmailField(max_length=50)
    Login = models.OneToOneField(User,on_delete=models.CASCADE)
    Company_Status = models.CharField(max_length=10,default='INACTIVE')
    Registrationdate = models.DateField(default=django.utils.timezone.now)

class Role_Model(models.Model):
    role_type = models.CharField(max_length=30)
    Login =models.OneToOneField(User,on_delete=models.CASCADE)





class Itinerary_Model(models.Model):
    First_name =models.CharField(max_length=50)
    Last_name = models.CharField(max_length=20)
    Itineraryreg_Date = models.DateField(default=django.utils.timezone.now)
    Address  =models.TextField(max_length=200)
    Location = models.ForeignKey(LocationModel,on_delete=models.CASCADE)
    State=models.ForeignKey(StateModel,on_delete=models.CASCADE)
    Country=models.ForeignKey(CountryModel,on_delete=models.CASCADE)
    ZIP =models.IntegerField()
    Mobno =models.BigIntegerField()
    Email = models.EmailField(max_length=50)
    Status = models.CharField(max_length=10,default='INACTIVE')
    Login = models.OneToOneField(User,on_delete=models.CASCADE,null=True)
