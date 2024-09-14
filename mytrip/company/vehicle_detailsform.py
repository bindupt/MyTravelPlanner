from django import forms

from company.vehicle_typeform import vehicle_typeform

from .models import Vehicle_detailsModel
class DateInput(forms.DateInput):
    input_type = 'date'



class vehicle_detailsform(forms.ModelForm):
    Reg_date = forms.DateField(widget=DateInput)

    class Meta:
        model=Vehicle_detailsModel
        fields=('Veh_regno','Reg_date','vehicle_type','Tank_capacity',
            'Standard_mileage','Engine_no','Chasis_no','No_of_tyres','Fuel_Type','Seating_capacity')

