from django.contrib import messages
from django.http import HttpResponse, HttpResponseRedirect
from django.shortcuts import render, redirect, get_object_or_404

from adminhome.models import  Stay_categoryModel

from .Pilgrimcenterform import pilgrim_centerform
from .edit_companyform import company_editForm
from .models import Stay_DetailsModel, Vehicle_typeModel, Vehicle_detailsModel, Tour_PackageModel, PilgrimcenterModel
from .stay_detailsform import stay_detailsform
from .tourpackageform import tourpackageform
from .vehicle_detailsform import vehicle_detailsform
from .vehicle_typeform import vehicle_typeform
from registration.models import Company_Model

from Itinerary.models import Reservation_Model
from django.utils import timezone
from Itinerary.models import Payment_Model
from adminhome.eventform import Event_form
from adminhome.models import EventModel

# Create your views here.

def home(request):
    return render(request,"companyheader.html")

    # return HttpResponse("Welcome to My Travel Planner<br>"
                        # "<a href='updateeditcompany'>Edit_Company</a><br>"
                        # "<a href='insert_staydetails'>Stay_details</a><br>"
                        # "<a href='insert_vehicletype'>vehicletype</a><br>"
                        # "<a href='insert_vehicledetails'>vehicle_details</a><br>"
                        # "<a href='insert_tourpackage'>Tourpackage</a><br>"
                        # "<a href='insert_Pilgrimcenter'>Pilgrimcenter</a><br>"
                        # )
#create stay details form
def insert_staydetails(request):
    context={}
    stay_det= stay_detailsform(request.POST or None,request.FILES or None)
    staycat=request.POST.get('Name') #text box name

    if Stay_DetailsModel.objects.filter(Name=staycat).exists():

        messages.info(request,'Stay_details are already exist')
        return redirect('/companyhome/insert_staydetails')
    else:

        if stay_det.is_valid():
            stay_det.save()
            return redirect('/companyhome/insert_staydetails')
    context['form1']=stay_det
    context["staydetails"]=Stay_DetailsModel.objects.all()
    return render(request,"insert_staydetails.html",context)

#view stay details form
def viewstaydetails(request):
    context={}
    context["staydetails"]=Stay_DetailsModel.objects.all()
    return render(request,"insert_staydetails.html",context)
#update stay details form
def updatestaydetails(request,staydetailsid):
    context={}
    stay_det=get_object_or_404(Stay_DetailsModel,id=staydetailsid)
    staydetails= stay_detailsform(request.POST or None,request.FILES or None,instance=stay_det)
    if staydetails.is_valid():
        staydetails.save()
        return HttpResponseRedirect('/companyhome/insert_staydetails')
    context['f3']=staydetails
    return render(request,"updatestaydetails.html",context)

#delete stay category form
def delstaydetails(request, staydetailsid):
    context={}
    stay_det=get_object_or_404(Stay_DetailsModel,id=staydetailsid)
    stay_det.delete()
    return HttpResponseRedirect('/companyhome/insert_staydetails')

#create vehicle type form
def insert_vehicletype(request):
    context={}
    vehform= vehicle_typeform(request.POST or None,request.FILES or None)
    vehtype=request.POST.get('vehicle_type') #text box name

    if Vehicle_typeModel.objects.filter(vehicle_type=vehtype).exists():

        messages.info(request,'Vehicle types  are already exist')
        return redirect('/companyhome/insert_vehicletype')
    else:

        if vehform.is_valid():
            vehform.save()
            return redirect('/companyhome/insert_vehicletype')
    context['form1']=vehform
    context["veh"]=Vehicle_typeModel.objects.all()
    return render(request,"insert_vehicletype.html",context)

#view vehicle type form
def viewvehicletype(request):
    context={}
    context["veh"]=Vehicle_typeModel.objects.all()
    return render(request,"insert_vehicletype.html",context)
#update vehicle type form
def updatevehicletype(request,vehicleid):
    context={}
    vehtype=get_object_or_404(Vehicle_typeModel,id=vehicleid)
    vehform= vehicle_typeform(request.POST or None,request.FILES or None,instance=vehtype)
    if vehform.is_valid():
        vehform.save()
        return HttpResponseRedirect('/companyhome/insert_vehicletype')
    context['f3']=vehform
    return render(request,"updatevehicletype.html",context)

#delete vehicle type form
def delvehicletype(request, vehicleid):
    context={}
    vehform=get_object_or_404(Vehicle_typeModel,id=vehicleid)
    vehform.delete()
    return HttpResponseRedirect('/companyhome/insert_vehicletype')

#create vehicle details form
def insert_vehicledetails(request):
    context={}
    vehicle_det= vehicle_detailsform(request.POST or None,request.FILES or None)
    vehicle_no=request.POST.get('Veh_regno') #text box name

    if Vehicle_detailsModel.objects.filter(Veh_regno=vehicle_no).exists():

        messages.info(request,'Vehicle_details are already exist')
        return redirect('/companyhome/insert_vehicledetails')
    else:

        if vehicle_det.is_valid():
            vehicle_det.save()
            return redirect('/companyhome/insert_vehicledetails')
    context['form1']=vehicle_det
    context["vehicledetails"]=Vehicle_detailsModel.objects.all()
    return render(request,"insert_vehicledetails.html",context)

#view vehicle details form
def viewvehicledetails(request):
    context={}
    context["vehicledetails"]=Vehicle_detailsModel.objects.all()
    return render(request,"insert_vehicledetails.html",context)
#update vehicle details form
def updatevehicledetails(request,vehicledetailsid):
    context={}
    vehicle_no=get_object_or_404(Vehicle_detailsModel,id=vehicledetailsid)
    vehicle_det= vehicle_detailsform(request.POST or None,request.FILES or None,instance=vehicle_no)
    if vehicle_det.is_valid():
        vehicle_det.save()
        return HttpResponseRedirect('/companyhome/insert_vehicledetails')
    context['f3']=vehicle_det
    return render(request,"updatevehicledetails.html",context)

#delete vehicle details form
def delvehicledetails(request, vehicledetailsid):
    context={}
    vehicle_det=get_object_or_404(Vehicle_detailsModel,id=vehicledetailsid)
    vehicle_det.delete()
    return HttpResponseRedirect('/companyhome/insert_vehicledetails')

#create tourpackage form
def insert_tourpackage(request):
    context={}
    packform= tourpackageform(request.POST or None,request.FILES or None)
    packname=request.POST.get('Package_Name') #text box name

    if Tour_PackageModel.objects.filter(Package_Name=packname).exists():

        messages.info(request,'Tour Package type  is already exist')
        return redirect('/companyhome/insert_tourpackage')
    else:

        if packform.is_valid():
            packform.save()
            return redirect('/companyhome/insert_tourpackage')
    context['form1']=packform
    context["package"]=Tour_PackageModel.objects.prefetch_related('Destination','pilgrimcenter','Stay_Name')
    return render(request,"insert_tourpackage.html",context)

#view tourpackage form
def viewtourpackage(request):
    context={}
    context["package"]=Tour_PackageModel.objects.all()
    return render(request,"insert_tourpackage.html",context)
#update tourpackage form
def updatetourpackage(request,packageid):
    context={}
    packname=get_object_or_404(Tour_PackageModel,id=packageid)
    packform= tourpackageform(request.POST or None,request.FILES or None,instance=packname)
    if packform.is_valid():
        packform.save()
        return HttpResponseRedirect('/companyhome/insert_tourpackage')
    context['form1']=packform
    return render(request,"updatetourpackage.html",context)

#delete tourpackage form
def deltourpackage(request, packageid):
    context={}
    packobj=get_object_or_404(Tour_PackageModel,id=packageid)
    packobj.delete()
    return HttpResponseRedirect('/companyhome/insert_tourpackage')

#create Pilgrim center form
def insert_Pilgrimcenter(request):
    context={}
    pilg_cet= pilgrim_centerform(request.POST or None,request.FILES or None)
    pilgnme=request.POST.get('Pilg_Name') #text box name

    if PilgrimcenterModel.objects.filter(Pilg_Name=pilgnme).exists():

        messages.info(request,'Pilgrim center Name is already exist')
        return redirect('/companyhome/insert_Pilgrimcenter')
    else:

        if pilg_cet.is_valid():
            pilg_cet.save()
            return redirect('/companyhome/insert_Pilgrimcenter')
    context['form1']=pilg_cet
    context["pilgrimcenter"]=PilgrimcenterModel.objects.all()
    return render(request,"insert_pilgrimcenter.html",context)


#update update pilgrimcenter  form
def updatepilgrimcenter(request,pilgcntrid):
    context={}
    pilg_centr=get_object_or_404(PilgrimcenterModel,id=pilgcntrid)
    pilg_cent= pilgrim_centerform(request.POST or None,request.FILES or None,instance=pilg_centr)
    if pilg_cent.is_valid():
        pilg_cent.save()
        return HttpResponseRedirect('/companyhome/insert_Pilgrimcenter')
    context['f3']=pilg_cent
    return render(request,"updatepilgrimcenter.html",context)

#delete delpilgrimcenter form
def delpilgrimcenter(request, pilgcntrid):
    context={}
    pilg_cent=get_object_or_404(PilgrimcenterModel,id=pilgcntrid)
    pilg_cent.delete()
    return HttpResponseRedirect('/companyhome/insert_Pilgrimcenter')
#update edit company form
def updateeditcompany(request):
    context={}
    cid=request.session["company_id"]
    obj=get_object_or_404(Company_Model,id=cid)
    form= company_editForm(request.POST or None,instance=obj)
    if form.is_valid():
        form.save()
        return HttpResponse("<script>alert('Profile Updated....');window.location='/companyhome';</script>")
    context['form1']=form
    return render(request,"editcompanyform.html",context)



def viewreservation_company(request):
    context = {}
    context["reservation"] = Reservation_Model.objects.filter(Reserv_Date__gt=timezone.now())
    return render(request, "view_reservation_company.html", context)


def viewpayment_company(request):
    context = {}
    context["payment"] =Payment_Model.objects.filter(Trans_Date__gt=timezone.now())
    return render(request, "view_payment_company.html", context)

def viewpaymentall_company(request):
    context = {}
    context["payment"] =Payment_Model.objects.all()
    return render(request, "view_paymentall_company.html", context)

# events 

#insert event  details  in event  table
def insert_event_company(request):
    context={}
    event_det= Event_form(request.POST or None)
    events=request.POST.get('Event') #text box name

    if EventModel.objects.filter(Event=events).exists():

        messages.info(request,'Event is already exist')
        return redirect('/companyhome/insert_event')
    else:

        if event_det.is_valid():
            event_det.save()
            return redirect('/companyhome/insert_event_company')
    context['form1']=event_det
    context["events"]=EventModel.objects.all()
    return render(request,"insert_EventsCompany.html",context)


#views event details
def viewEvent_company(request):
    context={}
    context["events"]= EventModel.objects.all()
    return render(request,"insert_EventsCompany.html",context)


#update stay category form
def updateevents_company(request,eventid):
    context={}
    event=get_object_or_404(EventModel,id=eventid)
    event_det= Event_form(request.POST or None,request.FILES or None,instance=event)
    if event_det.is_valid():
       event_det.save()
       return HttpResponseRedirect('/companyhome/insert_event_company')
    context['f3']=event_det
    return render(request,"updateeventsCompany.html",context)


#delete stay category form
def delevents_company(request,eventid):
    context={}
    event_det=get_object_or_404(EventModel,id=eventid)
    event_det.delete()
    return HttpResponseRedirect('/companyhome/insert_event_company')
