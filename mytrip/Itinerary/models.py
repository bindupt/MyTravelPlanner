from django.db import models

from adminhome.models import CountryModel, StateModel
from company.models import Tour_PackageModel
from registration.models import Itinerary_Model
import django.utils.timezone

# Create Reservation model.

class Reservation_Model(models.Model):
        Itinerary =models.ForeignKey(Itinerary_Model,on_delete=models.CASCADE)
        Package =models.ForeignKey(Tour_PackageModel,on_delete=models.CASCADE)
        Status=models.CharField(max_length=20,default='New')
        Name =models.CharField(max_length=20)
        Street_Address =models.TextField(max_length=200)
        Age=models.IntegerField(null=True)
        Gender=models.CharField(max_length=20,null=True)
        Mobile = models.BigIntegerField()
        email = models.EmailField(max_length=20)
        Profession =models.CharField(max_length=50,null=True)
        Organization=models.CharField(max_length=50,null=True)
        Country =models.ForeignKey(CountryModel,on_delete=models.CASCADE)
        State = models.ForeignKey(StateModel,on_delete=models.CASCADE)
        City=models.CharField(max_length=20)
        ZIP=models.IntegerField()
        No_of_Persons =models.CharField(max_length=50)
        Adults =models.IntegerField()
        Children =models.IntegerField()
        Reserv_Date=models.DateField(max_length=8,default=django.utils.timezone.now)


class Itinerarychild_Model(models.Model):
        Reservation =models.ForeignKey(Reservation_Model,on_delete=models.CASCADE)
        ItineraryName=models.CharField(max_length=20)
        Age=models.IntegerField()
        Gender=models.CharField(max_length=20)
CARD_CHOICES=(
        ('select','SELECT'),('credit','CREDIT'),('debit','DEBIT'),('mastercard','MASTERCARD'),
)
class Payment_Model(models.Model):
        Reservation =models.ForeignKey(Reservation_Model,on_delete=models.CASCADE,null=True)
        Trans_Date=models.DateField(default=django.utils.timezone.now)
        Amount=models.IntegerField()
        Card_Holder_Name=models.CharField(max_length=20)
        card_no=models.BigIntegerField()
        cvv_no=models.IntegerField()
        exp_date=models.CharField(max_length=8)
        status=models.CharField(max_length=20,default='PAID')

        # create feedback  model
class FeedbackModel(models.Model):
        Itinarery =models.ForeignKey(Itinerary_Model,on_delete=models.CASCADE)
        Email = models.EmailField(max_length=20)
        Message= models.TextField(max_length=200,null=True)
        Date=models.DateField(max_length=8,default=django.utils.timezone.now)
