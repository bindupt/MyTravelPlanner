from django.db import models

from adminhome.models import LocationModel, DistrictModel, StateModel, Stay_categoryModel

from adminhome.models import CountryModel

from adminhome.models import DestinationModel


# Create your models here.
#  #create Stay_Details  model
class Stay_DetailsModel(models.Model):
        Stay_category = models.ForeignKey(Stay_categoryModel,on_delete=models.CASCADE)
        Name = models.CharField(max_length=20)
        Address = models.CharField(max_length=50)
        Location =models.ForeignKey(LocationModel,on_delete=models.CASCADE)
        District =models.ForeignKey(DistrictModel,on_delete=models.CASCADE)
        state =models.ForeignKey(StateModel,on_delete=models.CASCADE)
        Tarrif_range = models.IntegerField()
        Lphone = models.BigIntegerField()
        mobno = models.BigIntegerField()
        fax = models.BigIntegerField()
        email = models.EmailField(max_length=20)
        images = models.FileField(upload_to="photos", blank=True)
        link = models.CharField(max_length=50)
        def __str__(self):
                 return self.Name

        ##create vehicle type model
class Vehicle_typeModel(models.Model):
        vehicle_type = models.CharField(max_length=20,null=True)

        def __str__(self):
                return self.vehicle_type
 ##create vehicle detailes model
class Vehicle_detailsModel(models.Model):
        Veh_regno = models.IntegerField()
        Reg_date  = models.DateField(max_length=8)
        vehicle_type = models.ForeignKey(Vehicle_typeModel,on_delete=models.CASCADE)
        Tank_capacity =models.CharField(max_length=20)
        Standard_mileage=models.CharField(max_length=50)
        Engine_no =models.CharField(max_length=50)
        Chasis_no =models.CharField(max_length=50)
        No_of_tyres=models.IntegerField()
        Fuel_Type=models.CharField(max_length=50)
        Seating_capacity=models.CharField(max_length=50)
class PilgrimcenterModel(models.Model):
        Location =models.ForeignKey(LocationModel,on_delete=models.CASCADE)
        District =models.ForeignKey(DistrictModel,on_delete=models.CASCADE)
        state =models.ForeignKey(StateModel,on_delete=models.CASCADE)
        country =models.ForeignKey(CountryModel,on_delete=models.CASCADE,default=1)
        Pilg_Name=models.CharField(max_length=40)
        Pilg_Address = models.TextField(max_length=250)
        Pilg_Description=models.TextField(max_length=250)
        Pilg_image=models.FileField(upload_to="photos",null=True)
        Pilg_link = models.CharField(max_length=50)
        def __str__(self):
                return self.Pilg_Name
##create Tour package model
class Tour_PackageModel(models.Model):
        Package_Name = models.CharField(max_length=50)
        Duration = models.CharField(max_length=20)
        Stay_category=models.ForeignKey(Stay_categoryModel,on_delete=models.CASCADE)
        Stay_Name =models.ForeignKey(Stay_DetailsModel,on_delete=models.CASCADE)
        No_of_Packages =models.CharField(max_length=50)
        Price =models.IntegerField()
        Package_Contents =models.TextField(max_length=100)
        status =models.CharField(max_length=50)
        Insurance_Company =models.CharField(max_length=50)
        Image=models.FileField(upload_to="photos",null=True)
        Image1=models.FileField(upload_to="photos",null=True)
        Destination= models.ManyToManyField(DestinationModel)
        pilgrimcenter = models.ManyToManyField(PilgrimcenterModel)
        def __str__(self):
                return self.Package_Name






