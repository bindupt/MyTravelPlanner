
from django.contrib import messages
from django.contrib.auth import authenticate #code for login authentication
from django.contrib.auth.models import User
from django.http import HttpResponse, HttpResponseRedirect
from django.shortcuts import render,redirect

from .Itinerary_regform import Itinerary_regForm
from .company_regform import company_regForm

from adminhome.models import StateModel, LocationModel, CountryModel

from .models import Role_Model, Company_Model, Itinerary_Model


def home(request):
    return redirect(login)

# Create your views here.
def company_reg(request, companyreg_Model=None):
    context= {}

    frm=company_regForm(request.POST or None)
    try:
        if request.POST:
            uname=request.POST.get('UserName')
            passw = request.POST.get('Password')
            Cname = request.POST.get('Company_Name')
            Cregn = request.POST.get('Com_Regist_No')
            Vat_No = request.POST.get('Vat_No')
            Tin_No = request.POST.get('Tin_No')
            addr = request.POST.get('Address')
            addr1 = request.POST.get('Address1')
            ZIP = request.POST.get('ZIP')
            ph1 = request.POST.get('Phone1')
            ph2 = request.POST.get('Phone2')
            Fax = request.POST.get('Fax')
            Email = request.POST.get('Email')
            if frm.is_valid():
                loc_id=frm.cleaned_data['Location']
                location=LocationModel.objects.get(Location=loc_id)
                state_id=frm.cleaned_data['State']
                state=StateModel.objects.get(State=state_id)
                cntry_id=frm.cleaned_data['Country']
                country=CountryModel.objects.get(Country=cntry_id)

                user_id = User.objects.create_user( username=uname,password=passw)
                role=Role_Model.objects.create(role_type='Company',Login=user_id)
                # pdb.set_trace()
                company= Company_Model.objects.create(Company_Name=Cname,Com_Regist_No=Cregn,Vat_No=Vat_No,Tin_No=Tin_No,
                                                      Address=addr,Address1=addr1,Location= location,State=state,
                                                      Country= country,ZIP=ZIP,Phone1=ph1,Phone2=ph2,Fax=Fax,
                                                      Email=Email,Login=user_id)



                return HttpResponseRedirect('/Login')
    except Exception as e:
        msg = e
        messages.error(request,msg)
    context["form"] = frm
    return render(request,'insert_companyreg.html',context)

## Itinerary registration function
def itinerary_reg(request, Itineraryreg_Model=None):
    context= {}

    Itiform=Itinerary_regForm(request.POST or None)
    try:
        if request.POST:
            uname=request.POST.get('UserName')
            passw = request.POST.get('Password')
            Fname = request.POST.get('First_name')
            Lname = request.POST.get('Last_name')
            addr = request.POST.get('Address')
            ZIP = request.POST.get('ZIP')
            mno = request.POST.get('Mobno')
            Email = request.POST.get('Email')
            if Itiform.is_valid():
                loc_id=Itiform.cleaned_data['Location']
                location=LocationModel.objects.get(Location=loc_id)
                state_id=Itiform.cleaned_data['State']
                state=StateModel.objects.get(State=state_id)
                cntry_id=Itiform.cleaned_data['Country']
                country=CountryModel.objects.get(Country=cntry_id)

                user_id = User.objects.create_user( username=uname,password=passw)
                role=Role_Model.objects.create(role_type='Itinerary',Login=user_id)
                itinerary =Itinerary_Model.objects.create(First_name=Fname,Last_name=Lname,Address=addr,Location= location,State=state,Country= country,ZIP=ZIP,Mobno=mno,Email=Email,Login=user_id)

                return HttpResponseRedirect('/Login')
    except Exception as e:
        msg = e
        messages.error(request,msg)
    context["form"] = Itiform
    return render(request,'insert_itineraryreg.html',context)

#code for login authentication
def login(request):
    if request.POST:
        context={}
        Uname=request.POST.get('uname')
        paswrd=request.POST.get('passw')
        user=authenticate(username=Uname,password=paswrd)
        print(user)
        if user is not None:
            user_id=user.id
            sp=user.is_superuser
            if sp is True:
                return HttpResponseRedirect('/adminhm')
            roll_obj= Role_Model.objects.filter(Login=user_id)
            for role_obj in roll_obj:
                type=role_obj.role_type


                if type=='Company':

                    company_object=Company_Model.objects.filter(Login=user_id)
                    for obj in company_object:
                        request.session["company_id"]=obj.id
                        request.session["company_name"]=obj.Company_Name

                        return HttpResponseRedirect('/companyhome')
                elif type=='Itinerary':

                    itinerary_object=Itinerary_Model.objects.filter(Login=user_id)
                    for obj in itinerary_object:
                        request.session["itinerary_id"]=obj.id
                        request.session["itinerary_name"]=obj.First_name

                        return HttpResponseRedirect('/itineraryhome')
                else:
                    return HttpResponse("<script>alert('Invalid Credential !!!');window.location='/login';</script>")

        else:
            return HttpResponse("<script>alert('Invalid Credential !!!');window.location='/login';</script>")
    return render(request, "loginform.html")


