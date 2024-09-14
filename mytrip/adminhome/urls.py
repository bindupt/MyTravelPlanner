from . import views

from django.urls import path
from django.contrib.auth import views as auth_views

urlpatterns = [

    path('',views.home,name='home'),
    path('insert_country',views.insert_country,name='insert_country'),
    path('updatecountry/<cid>', views.updatecountry,name='upcountry'),
    path('delcountry/<cid>',views.delcountry,name='delcountry'),
    path('insert_state',views.insert_state,name='insert_state'),
    path('updatestate/<stid>', views.updatestate,name='updatestate'),
    path('delstate/<stid>',views.delstate,name='delstate'),
    path('insert_district',views.insert_district,name='insert_district'),
    path('updatedistrict/<distid>', views.updatedistrict,name='updatedistrict'),
    path('deldistrict/<distid>',views.deldistrict,name='deldistrict'),

    path('insert_location',views.insert_location,name='insert_location'),
    path('updatelocation/<locid>', views.updatelocation,name='updatelocation'),
    path('dellocation/<locid>',views.dellocation,name='dellocation'),

    path('insert_event',views.insert_event,name='insert_event'),
    path('updateevents/<eventid>', views.updateevents,name='updateevents'),
    path('dellocation/<eventid>',views.dellocation,name='dellocation'),

    path('insert_destination_cat',views.insert_destination_cat,name='insert_destination_cat'),
    path('updateDestination_cat/<destcatid>', views.updateDestination_cat,name='updateDestination_cat'),
    path('delDestination_cat/<destcatid>',views.delDestination_cat,name='delDestination_cat'),

    path('insert_destination',views.insert_destination,name='insert_destination'),
    path('updateDestination/<destid>', views.updateDestination,name='updateDestination'),
    path('delDestination/<destid>',views.delDestination,name='delDestination'),

    path('insert_staycategory',views.insert_staycategory,name='insert_staycategory'),
    path('updatestaycategory/<staycatid>',views.updatestaycategory,name='updatestaycategory'),
    path('delstaycategory/<staycatid>',views.delstaycategory,name='delstaycategory'),

    path('insert_event',views.insert_event,name='insert_event'),
    path('updateevents/<eventid>',views.updateevents,name='updateevents'),
    path('delevents/<eventid>',views.delevents,name='delevents'),
    path('logout/', views.logout_view, name='logout'),
    path('viewstaydetails_admin',views.viewstaydetails_admin,name='viewstaydetails_admin'),
    path('viewvehicledetails_admin',views.viewvehicledetails_admin,name='viewvehicledetails_admin'), 
    path('viewreservation_admin',views.viewreservation_admin,name='viewreservation_admin'),
    path('viewfeedback_admin',views.viewfeedback_admin,name='viewfeedback_admin'),
    path('delfeedback/<fid>',views.delfeedback,name='delfeedback'),
    path('viewpaymentall_admin',views.viewpaymentall_admin,name='viewpaymentall_admin'),
    path('viewcompanyall_admin',views.viewcompanyall_admin,name='viewcompanyall_admin'),
    path('activatecompany/<cid>',views.activatecompany,name='activatecompany'),
     path('viewcompany_activate',views.viewcompany_activate,name='viewcompany_activate'),
    ]

