from . import views
from django.urls import path

urlpatterns = [

    path('', views.home,name='home'),
    path('viewtourpackage',views.viewtourpackage,name='viewtourpackage'),
    path('more/<pid>',views.more,name='more'),
    path('reservation/<packid>',views.reservation,name='reservation'),
    path('viewreservation/<rid>/<amt>',views.viewreservation,name='viewreservation'),
    path('Itinerary_child_reg',views.Itinerary_child_reg,name='Itinerary_child_reg'),
    path('payment/<int:rid>/<amt>',views.payment,name='payment'),
    path('receipt/<tid>',views.receipt,name='receipt'),
    path('index',views.index,name='index'),
    path('viewDestination_cust',views.viewDestination_cust,name='viewDestination_cust'),
    path('search_Pilgrimcenter',views.search_Pilgrimcenter,name='search_Pilgrimcenter'),
    path('viewEvent_cust',views.viewEvent_cust,name='viewEvent_cust'),
    path('viewstaydetails_cust',views.viewstaydetails_cust,name='viewstaydetails_cust'),
    path('viewvehicledetails_cust',views.viewvehicledetails_cust,name='viewvehicledetails_cust'),
    path('insert_feedback',views.insert_feedback,name='insert_feedback'),
   path('book_list',views.book_list,name='book_list'),
    ]
 