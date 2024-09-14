from django.contrib import messages
from django.http import HttpResponse, HttpResponseRedirect
from django.shortcuts import render, redirect, get_object_or_404

from company.models import Tour_PackageModel,PilgrimcenterModel,Stay_DetailsModel,Vehicle_detailsModel

from .models import Reservation_Model
from .reservationform import reservationform

from adminhome.models import LocationModel, StateModel, CountryModel,DestinationModel

from registration.models import Itinerary_Model

#from Itinerary.Itinerary_chidform import Itinerary_childform
from .models import Itinerarychild_Model
from adminhome.models import EventModel
from .models import Payment_Model
from django.urls import reverse

from .Itinerary_chidform import Itinerary_childform
from.models import FeedbackModel
from .feedbackform import feedback_form




# from mytrip.Itinerary.Itinerary_chidform import Itinerary_childform


# Create your views here.
def home(request):
    return render(request,"customerheader1.html")

    # return HttpResponse("Welcome to My Travel Planner<br>"
    #                     "<a href='viewtourpackage'>Search_Tour_Pcakage</a><br>"
    #                     "<a href='index'>home page</a><br>"
    #
    #
    #
    #                     )




def index(request):
     return render(request,"index1.html")

#view tourpackage form
def viewtourpackage(request):
    context={}
    context["package"]=Tour_PackageModel.objects.all()
    return render(request,"search_tourpackage.html",context)
def more(request,pid):
    context={}
    context["package"]=Tour_PackageModel.objects.prefetch_related('Destination','pilgrimcenter','Stay_Name').filter(id=pid)
    return render(request,"view_tourpackage1.html",context)

## Itinerary reservation function
def reservation(request,packid):
    context= {}
    ItiId=request.session["itinerary_id"]
    itineraryId=Itinerary_Model.objects.get(pk=ItiId)
    Tpackid=Tour_PackageModel.objects.get(pk=packid)
    packamount=Tour_PackageModel.objects.filter(pk=packid)

    resform=reservationform(request.POST or None)
    try:
        if request.POST:
            name=request.POST.get('Name')
            addr = request.POST.get('Street_Address')
            age=request.POST.get('Age')
            gender = request.POST.get('Gender')
            mob = request.POST.get('Mobile')
            email = request.POST.get('email')
            prof = request.POST.get('Profession')
            org = request.POST.get('Organization')
            city = request.POST.get('City')
            ZIP= request.POST.get('ZIP')
            nop = request.POST.get('No_of_Persons')
            adlts = request.POST.get('Adults')
            chld = request.POST.get('Children')
            date = request.POST.get('Reserv_Date')
            amount=request.POST.get('TotalAmount')
            print('amount',amount)
            if resform.is_valid():
                state_id=resform.cleaned_data['State']
                state=StateModel.objects.get(State=state_id)
                cntry_id=resform.cleaned_data['Country']
                country=CountryModel.objects.get(Country=cntry_id)


                reservation =Reservation_Model.objects.create(Itinerary=itineraryId,Package=Tpackid,Name=name,Street_Address=addr,Mobile=mob,email=email,
                                                              Profession=prof,Organization=org,City=city,ZIP=ZIP,No_of_Persons=nop,
                                                              Adults=adlts,Children=chld,State=state,Country= country,Age=age,Gender=gender)

                url = reverse('viewreservation', kwargs={'rid': reservation.id,'amt':amount})
                return redirect(url)
    except Exception as e:
        msg = e
        messages.error(request,msg)
    context["form"] = resform
    for obj in packamount:

        context["packamount"] = obj.Price
    # context["reservation"]=Reservation_Model.objects.all()
    return render(request,"insert_reservation.html",context)



def viewreservation(request,rid,amt):
    context={}
    context["reservation"]=Reservation_Model.objects.filter(pk=rid)
    context["tamount"] = amt
    return render(request,"insert_itinerary_child.html",context)




#Itinerary child registration function
def Itinerary_child_reg(request):
    context= {}
    ItiId=request.session["itinerary_id"]
    Itichild=Itinerary_childform(request.POST or None)
    if request.POST:
            resrid=request.POST.get('rid')
            amount=request.POST.get('TotalAmount')


            count=request.POST.get('count')

            resid=Reservation_Model.objects.get(pk=resrid)

            for i in range(int(count)):

                itcname=request.POST.get('n1[{}]'.format(i))

                age = request.POST.get('n2[{}]'.format(i))
                gender= request.POST.get('n3[{}]'.format(i))
                itinerarechild =Itinerarychild_Model.objects.create(Reservation=resid,ItineraryName=itcname,Age=age,Gender=gender)

            # return HttpResponseRedirect('payment',rid=resrid)
            url = reverse('payment', kwargs={'rid': resid.id,'amt':amount})

            return redirect(url)


# Payment Functions

def payment(request,rid,amt):
    context={}
    resid=Reservation_Model.objects.get(pk=rid)

    if request.POST:



        chname= request.POST.get('Card_Holder_Name')
        cno = request.POST.get('card_no')
        cvvno = request.POST.get('cvv_no')



        transaction =Payment_Model.objects.create(Amount=amt,
                          Card_Holder_Name=chname,card_no=cno,cvv_no=cvvno,Reservation=resid)
        url = reverse('receipt', kwargs={'tid': transaction.id})
        return redirect(url)
    # except Exception as e:
    #         msg = e
    #     messages.error(request,msg)
    context["amount"]=amt
    # payment=paymentform(initial={'Amount': amt})
    # context["form"] = payment

    #get reservation details

    context["reservation"]=Reservation_Model.objects.filter(pk=rid)
    context["tamount"] = amt



    return render(request,"insert_payment.html",context)



def receipt(request,tid):
    context= {}

    context["payments"]=Payment_Model.objects.filter(pk=tid)
    return render(request,"receipt.html",context)

#views Destination details
def viewDestination_cust(request):
    context={}
    context["destination"]=DestinationModel.objects.all()
    return render(request,"search_Destination.html",context)

    
def search_Pilgrimcenter(request):
    context={}
    context["pilgrimcenter"]=PilgrimcenterModel.objects.all()
    return render(request,"search_pilgrim.html",context)

#list event details in plan your trip menu
def viewEvent_cust(request):
    context={}
    context["events"]= EventModel.objects.all()
    return render(request,"search_Events.html",context)


#view stay details form
def viewstaydetails_cust(request):
    context={}
    context["staydetails"]= Stay_DetailsModel.objects.all()
    return render(request,"search_staydetailscust.html",context)

#view vehicle details form
def viewvehicledetails_cust(request):
    context={}
    context["vehicledetails"]=Vehicle_detailsModel.objects.all()
    return render(request,"search_vehicledetails.html",context)


def insert_feedback(request):
    context={}
    ItiId=request.session["itinerary_id"]
    itineraryId=Itinerary_Model.objects.get(pk=ItiId)
    feedback=feedback_form(request.POST or None,)
    if request.POST:    
        fbackmail=request.POST.get('Email') #text box name
        fbackmsg=request.POST.get('Message')
        fback=FeedbackModel.objects.create(Email=fbackmail,
                            Message=fbackmsg,Itinarery=itineraryId)
        
        return redirect('/itineraryhome/insert_feedback')
    context['form1']=feedback    
    return render(request,"insert_feedback.html",context)


def book_list(request):
    context ={}
    ItiId=request.session["itinerary_id"]
    itineraryId=Itinerary_Model.objects.get(pk=ItiId)
    context['book_list']=Reservation_Model.objects.select_related('Package').filter(Itinerary=itineraryId)
    return render(request,"booklist.html",context)