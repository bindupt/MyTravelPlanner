from django.db import models

# Create your models here.
class CountryModel(models.Model):
        Country = models.CharField(max_length=20,null=True)
        def __str__(self):
                return self.Country


class StateModel(models.Model):
        country =models.ForeignKey(CountryModel,on_delete=models.CASCADE,default=1)
        State = models.CharField(max_length=20,null=True)
        def __str__(self):
                return self.State
#
#
class DistrictModel(models.Model):
        state =models.ForeignKey(StateModel,on_delete=models.CASCADE,default=1)
        District = models.CharField(max_length=20,null=True)
        Area = models.CharField(max_length=20,null=True)
        Population = models.CharField(max_length=20,null=True)
        Altitude = models.CharField(max_length=20,null=True)
        Telcode = models.CharField(max_length=20,null=True)
        Description = models.TextField(max_length=100,null=True)
        Air=models.CharField(max_length=20,null=True)
        Rail=models.CharField(max_length=20,null=True)
        Road=models.CharField(max_length=20,null=True)
        Backwarter=models.CharField(max_length=20,null=True)
        def __str__(self):
                return self.District
#create Location model
class LocationModel(models.Model):
        district=models.ForeignKey(DistrictModel,on_delete=models.CASCADE,default=1)
        Location=models.CharField(max_length=100,unique=True)
        Description=models.TextField(max_length=200,null=True)
        Hw_to_reach=models.CharField(max_length=20,null=True)
        def __str__(self):
                return self.Location
    #create destination category model
class Destination_catModel(models.Model):
        Destination_cat = models.CharField(max_length=50,null=True)
        def __str__(self):
                return self.Destination_cat
#
 #create destination  model
class DestinationModel(models.Model):
        Destination = models.CharField(max_length=50,null=True)
        Category =models.ForeignKey(Destination_catModel,on_delete=models.CASCADE)
        Location =models.ForeignKey(LocationModel,on_delete=models.CASCADE)
        District =models.ForeignKey(DistrictModel,on_delete=models.CASCADE)
        state =models.ForeignKey(StateModel,on_delete=models.CASCADE)
        image = models.FileField(upload_to="photos", blank=True)
        def __str__(self):
                return self.Destination
 #create Stay type   model
class Stay_categoryModel(models.Model):
        Stay_type = models.CharField(max_length=20,null=True)
        photo = models.FileField(upload_to="photos", blank=True)

        class Meta:
                db_table = "stay_cat_table"
        def __str__(self):
                return self.Stay_type
 # create event  model
class EventModel(models.Model):
        Event = models.CharField(max_length=50,null=True)
        Description = models.TextField(max_length=100,null=True)
        Importance = models.TextField(max_length=50,null=True)
        Date = models.DateField(max_length=8)
        District =models.ForeignKey(DistrictModel,on_delete=models.CASCADE)
        state =models.ForeignKey(StateModel,on_delete=models.CASCADE)
        Country =models.ForeignKey(CountryModel,on_delete=models.CASCADE)
        class Meta:
                db_table = "event_table"







