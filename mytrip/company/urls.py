from . import views
from django.urls import path

urlpatterns = [

    path('',views.home,name='home'),
    path('insert_staydetails',views.insert_staydetails,name='insert_staydetails'),
    path('updatestaydetails/<staydetailsid>',views.updatestaydetails,name='updatestaydetails'),
    path('delstaydetails/<staydetailsid>',views.delstaydetails,name='delstaydetails'),

    path('insert_vehicletype',views.insert_vehicletype,name='insert_vehicletype'),
    path('updatevehicletype/<vehicleid>',views.updatevehicletype,name='updatevehicletype'),
    path('delvehicletype/<vehicleid>',views.delvehicletype,name='delvehicletype'),

    path('insert_vehicledetails',views.insert_vehicledetails,name='insert_vehicledetails'),
    path('updatevehicledetails/<vehicledetailsid>',views.updatevehicledetails,name='updatevehicledetails'),
    path('delvehicledetails/<vehicledetailsid>',views.delvehicledetails,name='delvehicledetails'),

    path('insert_tourpackage',views.insert_tourpackage,name='insert_tourpackage'),
    path('updatetourpackage/<packageid>',views.updatetourpackage,name='updatetourpackage'),
    path('deltourpackage/<packageid>',views.deltourpackage,name='deltourpackage'),

    path('insert_Pilgrimcenter',views.insert_Pilgrimcenter,name='insert_Pilgrimcenter'),
    path('updatepilgrimcenter/<pilgcntrid>',views.updatepilgrimcenter,name='updatepilgrimcenter'),
    path('delpilgrimcenter/<pilgcntrid>',views.delpilgrimcenter,name='delpilgrimcenter'),
    path('updateeditcompany',views.updateeditcompany,name='updateeditcompany'),
    path('viewreservation_company',views.viewreservation_company,name='viewreservation_company'),
    path('viewpayment_company',views.viewpayment_company,name='viewpayment_company'),
    path('viewpaymentall_company',views.viewpaymentall_company,name='viewpaymentall_company'),
     path('insert_event_company',views.insert_event_company,name='insert_event_company'),
    path('updateevents_company/<eventid>', views.updateevents_company,name='updateevents_company'),
    path('delevents_company/<eventid>',views.delevents_company,name='delevents_company'),
 ]

