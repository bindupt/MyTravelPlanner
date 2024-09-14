from django.contrib import messages
from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth import logout

# Create your views here.
from django.http import HttpResponse, HttpResponseRedirect

from .Destination_catform import Destination_cat_form
from .Stay_categoryform import stay_categoryform
from .countryform import Country_form
from .destinationform import Destination_form
from .districtform import District_form
from .eventform import Event_form
from .locationform import Location_form
from .models import CountryModel, StateModel, DistrictModel, LocationModel, Destination_catModel, DestinationModel, \
    Stay_categoryModel, EventModel
from .stateform import State_form
from company.models import Stay_DetailsModel,Vehicle_detailsModel
from Itinerary.models import Reservation_Model,FeedbackModel,Payment_Model
from registration.models import Company_Model

def home(request): 
    return render(request,"adminheader.html")

   

#add country details in the country table
def insert_country(request):
    """
    Handles the insertion of a new country into the CountryModel.
    If the country already exists, an informational message is displayed.
    On successful form submission, the user is redirected to the same page.
    """
    context = {}
    form = Country_form(request.POST or None)  # Instantiate the form with POST data if available

    try:
        # Retrieve the country name from the POST request
        c = request.POST.get('Country')

        # Check if the country already exists in the database
        if c and CountryModel.objects.filter(Country=c).exists():
            messages.info(request, 'Country already exists')
            return redirect('/adminhm/insert_country')  # Redirect to avoid resubmission on page refresh

        if form.is_valid():
            form.save()  # Save the form data to the database
            messages.success(request, 'Country added successfully')  # Inform the user of successful addition
            return redirect('/adminhm/insert_country')  # Redirect to avoid resubmission on page refresh

    except Exception as e:
        # Handle unexpected errors
        messages.error(request, f'An error occurred: {e}')
        return redirect('/adminhm/insert_country')

    # If the form is not valid or no form submission, prepare the context to render the form
    context['form1'] = form
    context["coun"] = CountryModel.objects.all()  # Pass the list of countries to the template

    return render(request, "insert_country.html", context)  # Render the template with the context


#views country details
def viewcountry(request):
    context={}
    context["coun"]=CountryModel.objects.all()
    return render(request,"insert_country.html",context)


#update country details
def updatecountry(request, cid):
    """
    Handles the update of country details in the CountryModel.
    Retrieves the country object based on the provided ID (cid),
    and updates it using the submitted form data.
    If the form is valid, the changes are saved, and the user is redirected.
    """
    context = {}
    
    try:
        # Retrieve the country object by ID, or return a 404 error if not found
        obj = get_object_or_404(CountryModel, id=cid)
        
        # Instantiate the form with POST data if available, or with the existing country object
        form3 = Country_form(request.POST or None, instance=obj)
        
        # Check if the form is valid
        if form3.is_valid():
            form3.save()  # Save the updated country data to the database
            messages.success(request, 'Country details updated successfully')  # Inform the user of successful update
            return HttpResponseRedirect('/adminhm/insert_country')  # Redirect to avoid resubmission on page refresh

    except Exception as e:
        # Handle unexpected errors
        messages.error(request, f'An error occurred: {e}')
        return redirect('/adminhm/insert_country')

    # If the form is not valid or no form submission, prepare the context to render the form
    context['f3'] = form3

    # Render the template with the context, including the form for updating country details
    return render(request, "updatecountry.html", context)


#delete country
def delcountry(request, cid):
    """
    Handles the deletion of a country from the CountryModel.
    Retrieves the country object based on the provided ID (cid),
    deletes it, and then redirects the user to the country insertion page.
    """
    try:
        # Retrieve the country object by ID, or return a 404 error if not found
        obj = get_object_or_404(CountryModel, id=cid)
        
        # Delete the retrieved country object
        obj.delete()
        
        # Inform the user of the successful deletion
        messages.success(request, 'Country deleted successfully')
        
        # Redirect to the page showing the list of countries or insert country page
        return HttpResponseRedirect('/adminhm/insert_country')

    except Exception as e:
        # Handle unexpected errors
        messages.error(request, f'An error occurred while deleting the country: {e}')
        
        # Redirect to the page showing the list of countries or insert country page
        return HttpResponseRedirect('/adminhm/insert_country')


#insert state details in the state table
def insert_state(request):
    """
    Handle the insertion of a new state into the database.
    Renders a form for input and processes the form submission.
    """
    context = {}

    # Instantiate the form with POST data if it exists, otherwise create an empty form
    form = State_form(request.POST or None)
    
    # Retrieve the state from the form input
    st = request.POST.get('State')  # 'State' should match the name attribute of the input field in the form

    try:
        # Check if the state already exists in the database
        if st and StateModel.objects.filter(State=st).exists():
            messages.info(request, 'State already exists')
            return redirect('/adminhm/insert_state')

        # If the form is valid, save the new state
        if form.is_valid():
            form.save()
            messages.success(request, 'State successfully added')
            return redirect('/adminhm/insert_state')
    
    except Exception as e:
        # Log the exception (optional)
        # logger.error(f"Error inserting state: {e}")  # Uncomment if you have logging configured
        messages.error(request, f"An error occurred: {e}")
        # Handle the exception gracefully
        return redirect('/adminhm/insert_state')
    
    # Populate context with the form and existing states for rendering
    context['form1'] = form
    context["state"] = StateModel.objects.all()

    # Render the form page with the current context
    return render(request, "insert_state.html", context)



#update state details
def updatestate(request, stid):
    # Initialize the context dictionary to pass data to the template
    context = {}
    
    try:
        # Retrieve the StateModel instance by ID, or raise a 404 error if not found
        obj = get_object_or_404(StateModel, id=stid)
        
        # If the form is submitted (POST request), populate it with the request data and bind it to the instance
        # Otherwise, create the form with the existing instance data (for GET request)
        form3 = State_form(request.POST or None, instance=obj)
        
        if form3.is_valid():
            # If the form data is valid, save the changes to the database
            form3.save()
            
            # Redirect to the specified URL after saving
            return HttpResponseRedirect('/adminhm/insert_state')
        
        # If the form is not valid or the request method is GET, pass the form to the context
        context['f3'] = form3
    
    except StateModel.DoesNotExist:
        # Handle the case where the object does not exist
        context['error'] = "State not found."
        # Optionally, you can redirect to an error page or handle it otherwise
        return render(request, "error_page.html", context)
    
    except Exception as e:
        # Handle any other exceptions that may occur
        context['error'] = str(e)
        # Optionally, log the error or take other actions
    
    # Render the template with the context data
    return render(request, "updatestate.html", context)


#delete state
def delstate(request, stid):
    """
    Delete a state from the database.

    Parameters:
    request: The HTTP request object.
    stid: The ID of the state to be deleted.

    Returns:
    HttpResponseRedirect: Redirects to the state insertion page after deletion.
    """
    context = {}
    try:
        # Retrieve the state object by ID or raise a 404 error if not found.
        obj = get_object_or_404(StateModel, id=stid)
        
        # Delete the state object.
        obj.delete()

        # Optionally, add a success message.
        messages.success(request, 'State deleted successfully.')

    except Exception as e:
        # Log the exception or handle it as needed.
        messages.error(request, f'Error deleting state: {str(e)}')

    # Redirect to the state insertion page.
    return HttpResponseRedirect('/adminhm/insert_state')



#insert district details in the district table
def insert_district(request):
    context = {}
    
    try:
        # Initialize the form with POST data if available, otherwise create an empty form.
        form = District_form(request.POST or None)
        
        # Retrieve the district name from the POST data. 'District' is the name of the textbox.
        dist = request.POST.get('District')
        
        # Check if the district already exists in the database.
        if DistrictModel.objects.filter(District=dist).exists():
            # If the district exists, add an informational message and redirect back to the same page.
            messages.info(request, 'District already exists')
            return redirect('/adminhm/insert_district')
        else:
            # If the district doesn't exist and the form is valid, save the new district.
            if form.is_valid():
                form.save()
                # Optionally, you can add a success message here.
                messages.success(request, 'District added successfully.')
                return redirect('/adminhm/insert_district')
        
        # Pass the form and the list of all districts to the context for rendering in the template.
        context['form1'] = form
        context["district"] = DistrictModel.objects.all()
    
    except Exception as e:
        # Handle any exceptions that occur during the process.
        # Add an error message to inform the user about the issue.
        messages.error(request, f"An error occurred: {e}")
        
        # Optionally, log the error or pass the error details to the context.
        # context['error'] = str(e)
        # return render(request, 'error_template.html', context)
    
    # Render the form and the list of districts on the page.
    return render(request, "insert_district.html", context)


# View District Details
def viewdistrict(request):
    context = {}
    
    try:
        # Fetch all district records from the database.
        context["district"] = DistrictModel.objects.all()
    
    except Exception as e:
        # Handle any exceptions that occur during the process.
        messages.error(request, f"An error occurred while fetching district data: {e}")
    
    # Render the district details in the template.
    return render(request, "insert_district.html", context)


# Update District Details
def updatedistrict(request, distid):
    context = {}
    
    try:
        # Attempt to retrieve the district object by its ID.
        obj = get_object_or_404(DistrictModel, id=distid)
        
        # Initialize the form with POST data if available, or with the existing district object.
        form3 = District_form(request.POST or None, instance=obj)
        
        if form3.is_valid():
            # If the form is valid, save the changes to the district.
            form3.save()
            # Optionally, add a success message.
            messages.success(request, "District updated successfully.")
            return HttpResponseRedirect('/adminhm/insert_district')
        
        # Pass the form to the context to be rendered in the template.
        context['f3'] = form3
    
    except Exception as e:
        # Handle any exceptions that occur during the process.
        messages.error(request, f"An error occurred while updating the district: {e}")
    
    # Render the update form in the template.
    return render(request, "updatedistrict.html", context)



# Delete District
def deldistrict(request, distid):
    context = {}
    
    try:
        # Attempt to retrieve the district object by its ID.
        obj = get_object_or_404(DistrictModel, id=distid)
        
        # Delete the district object from the database.
        obj.delete()
        # Optionally, add a success message.
        messages.success(request, "District deleted successfully.")
    
    except Exception as e:
        # Handle any exceptions that occur during the deletion process.
        messages.error(request, f"An error occurred while deleting the district: {e}")
    
    # Redirect to the district management page after deletion.
    return HttpResponseRedirect('/adminhm/insert_district')


# Insert Location Details
def insert_location(request):
    context = {}
    
    try:
        # Initialize the form with POST data if available, otherwise create an empty form.
        locationform = Location_form(request.POST or None)
        
        # Retrieve the location name from the POST data. 'Location' is the name of the textbox.
        loc = request.POST.get('Location')
        
        # Check if the location already exists in the database.
        if LocationModel.objects.filter(Location=loc).exists():
            # If the location exists, add an informational message and redirect back to the same page.
            messages.info(request, 'Location already exists')
            return redirect('/adminhm/insert_location')
        else:
            # If the location doesn't exist and the form is valid, save the new location.
            if locationform.is_valid():
                locationform.save()
                # Optionally, you can add a success message here.
                messages.success(request, 'Location added successfully.')
                return redirect('/adminhm/insert_location')
        
        # Pass the form and the list of all locations to the context for rendering in the template.
        context['form1'] = locationform
        context["location"] = LocationModel.objects.all()
    
    except Exception as e:
        # Handle any exceptions that occur during the process.
        messages.error(request, f"An error occurred: {e}")
        # Optionally, you could log the error or handle it differently.
    
    # Render the form and the list of locations on the page.
    return render(request, "insert_location.html", context)


# Update Location Details
def updatelocation(request, locid):
    context = {}
    
    try:
        # Attempt to retrieve the location object by its ID.
        locat = get_object_or_404(LocationModel, id=locid)
        
        # Initialize the form with POST data if available, or with the existing location object.
        locationform = Location_form(request.POST or None, instance=locat)
        
        if locationform.is_valid():
            # If the form is valid, save the changes to the location.
            locationform.save()
            # Optionally, add a success message.
            messages.success(request, "Location updated successfully.")
            return HttpResponseRedirect('/adminhm/insert_location')
        
        # Pass the form to the context to be rendered in the template.
        context['f3'] = locationform
    
    except Exception as e:
        # Handle any exceptions that occur during the process.
        messages.error(request, f"An error occurred while updating the location: {e}")
    
    # Render the update form in the template.
    return render(request, "updatelocation.html", context)


# Delete Location
def dellocation(request, locid):
    context = {}
    
    try:
        # Attempt to retrieve the location object by its ID.
        locat = get_object_or_404(LocationModel, id=locid)
        
        # Delete the location object from the database.
        locat.delete()
        # Optionally, add a success message.
        messages.success(request, "Location deleted successfully.")
    
    except Exception as e:
        # Handle any exceptions that occur during the deletion process.
        messages.error(request, f"An error occurred while deleting the location: {e}")
    
    # Redirect to the location management page after deletion.
    return HttpResponseRedirect('/adminhm/insert_location')




# Insert Destination Category
def insert_destination_cat(request):
    context = {}
    
    try:
        # Initialize the form with POST data if available, otherwise create an empty form.
        destination_cat = Destination_cat_form(request.POST or None)
        
        # Retrieve the destination category name from the POST data. 'Destination_cat' is the name of the textbox.
        destcat = request.POST.get('Destination_cat')
        
        # Check if the destination category already exists in the database.
        if Destination_catModel.objects.filter(Destination_cat=destcat).exists():
            # If the category exists, add an informational message and redirect back to the same page.
            messages.info(request, 'Destination category already exists')
            return redirect('/adminhm/insert_destination_cat')
        else:
            # If the category doesn't exist and the form is valid, save the new category.
            if destination_cat.is_valid():
                destination_cat.save()
                # Optionally, add a success message.
                messages.success(request, 'Destination category added successfully.')
                return redirect('/adminhm/insert_destination_cat')
        
        # Pass the form and the list of all destination categories to the context for rendering in the template.
        context['form1'] = destination_cat
        context["destination_cat"] = Destination_catModel.objects.all()
    
    except Exception as e:
        # Handle any exceptions that occur during the process.
        messages.error(request, f"An error occurred: {e}")
        # Optionally, you could log the error or handle it differently.
    
    # Render the form and the list of destination categories on the page.
    return render(request, "insert_Destination_cat.html", context)


#views Destination category details
# View Destination Category Details
def viewDestination_cat(request):
    context = {}
    
    try:
        # Fetch all destination category records from the database.
        context["destination_cat"] = Destination_catModel.objects.all()
    
    except Exception as e:
        # Handle any exceptions that occur during the process.
        messages.error(request, f"An error occurred while fetching destination category data: {e}")
    
    # Render the destination category details in the template.
    return render(request, "insert_Destination_cat.html", context)




# Update Destination Category Details
def updateDestination_cat(request, destcatid):
    context = {}
    
    try:
        # Attempt to retrieve the destination category object by its ID.
        destcat = get_object_or_404(Destination_catModel, id=destcatid)
        
        # Initialize the form with POST data if available, or with the existing destination category object.
        destination_cat = Destination_cat_form(request.POST or None, instance=destcat)
        
        if destination_cat.is_valid():
            # If the form is valid, save the changes to the destination category.
            destination_cat.save()
            # Optionally, add a success message.
            messages.success(request, "Destination category updated successfully.")
            return HttpResponseRedirect('/adminhm/insert_destination_cat')
        
        # Pass the form to the context to be rendered in the template.
        context['f3'] = destination_cat
    
    except Exception as e:
        # Handle any exceptions that occur during the process.
        messages.error(request, f"An error occurred while updating the destination category: {e}")
    
    # Render the update form in the template.
    return render(request, "updatedestination_cat.html", context)


#delete Destination
# Delete Destination Category
def delDestination_cat(request, destcatid):
    context = {}
    
    try:
        # Attempt to retrieve the destination category object by its ID.
        destcat = get_object_or_404(Destination_catModel, id=destcatid)
        
        # Delete the destination category object from the database.
        destcat.delete()
        # Optionally, add a success message.
        messages.success(request, "Destination category deleted successfully.")
    
    except Exception as e:
        # Handle any exceptions that occur during the deletion process.
        messages.error(request, f"An error occurred while deleting the destination category: {e}")
    
    # Redirect to the destination category management page after deletion.
    return HttpResponseRedirect('/adminhm/insert_destination_cat')


# Insert a new destination
def insert_destination(request):
    # Initialize an empty context dictionary to store data for rendering the template.
    context = {}

    try:
        # Initialize the form with POST data if available, and also handle file uploads.
        destination = Destination_form(request.POST or None, request.FILES or None)
        
        # Retrieve the destination name from the POST data. 'Destination' is the name of the textbox.
        dest = request.POST.get('Destination')

        # Check if the destination already exists in the database.
        if DestinationModel.objects.filter(Destination=dest).exists():
            # If the destination exists, add an informational message and redirect back to the same page.
            messages.info(request, 'Destination already exists')
            return redirect('/adminhm/insert_destination')
        else:
            # If the destination doesn't exist and the form is valid, save the new destination.
            if destination.is_valid():
                destination.save()
                # Optionally, you can add a success message here.
                messages.success(request, 'Destination added successfully.')
                return redirect('/adminhm/insert_destination')
        
        # Pass the form and the list of all destinations to the context for rendering in the template.
        context['form1'] = destination
        context["destination"] = DestinationModel.objects.all()
    
    except Exception as e:
        # Handle any exceptions that occur during the process by displaying an error message to the user.
        messages.error(request, f"An error occurred: {e}")
    
    # Render the form and the list of destinations on the page.
    return render(request, "insert_Destination.html", context)

# View Destination details
def viewDestination(request):
    # Initialize an empty context dictionary
    context = {}

    try:
        # Retrieve all destination records and store them in the context
        context["destination"] = DestinationModel.objects.all()
    except Exception as e:
        # Handle any exceptions by displaying an error message to the user
        messages.error(request, f"An error occurred while retrieving destinations: {e}")
        return HttpResponse("An error occurred while retrieving destinations.", status=500)
    
    # Render the destination list on the page
    return render(request, "insert_Destination.html", context)

# Update Destination details
def updateDestination(request, destid):
    # Initialize an empty context dictionary
    context = {}

    try:
        # Retrieve the destination object by id or return a 404 error if not found
        dest = get_object_or_404(DestinationModel, id=destid)
        
        # Initialize the form with POST data, file uploads, and the existing destination instance
        destination = Destination_form(request.POST or None, request.FILES or None, instance=dest)
        
        # If the form is valid, save the updated destination and redirect
        if destination.is_valid():
            destination.save()
            messages.success(request, 'Destination updated successfully.')
            return HttpResponseRedirect('/adminhm/insert_destination')
        
        # Pass the form to the context for rendering in the template
        context['f3'] = destination
    
    except Exception as e:
        # Handle any exceptions that occur during the process by displaying an error message to the user
        messages.error(request, f"An error occurred while updating the destination: {e}")
    
    # Render the update form on the page
    return render(request, "updatedestination.html", context)

# Delete Destination
def delDestination(request, destid):
    try:
        # Retrieve the destination object by id or return a 404 error if not found
        dest = get_object_or_404(DestinationModel, id=destid)
        
        # Delete the destination from the database
        dest.delete()
        messages.success(request, 'Destination deleted successfully.')
    
    except Exception as e:
        # Handle any exceptions that occur during the process by displaying an error message to the user
        messages.error(request, f"An error occurred while deleting the destination: {e}")
    
    # Redirect back to the destination list page
    return HttpResponseRedirect('/adminhm/insert_destination')




# Create stay category form
def insert_staycategory(request):
    context = {}
    
    # Initialize the form with POST data and files if available
    stay_cat = stay_categoryform(request.POST or None, request.FILES or None)
    
    # Get the Stay_type from the form data
    stay = request.POST.get('Stay_type')  # Text box name

    try:
        # Check if the stay category already exists
        if Stay_categoryModel.objects.filter(Stay_type=stay).exists():
            messages.info(request, 'Stay category already exists')
            return redirect('/adminhm/insert_staycategory')
        else:
            # If the form is valid, save the new stay category
            if stay_cat.is_valid():
                stay_cat.save()
                return redirect('/adminhm/insert_staycategory')
    except Exception as e:
        # Handle any unexpected errors
        messages.error(request, f"An error occurred: {e}")
    
    context['form1'] = stay_cat
    context["staycategory"] = Stay_categoryModel.objects.all()
    return render(request, "insert_staycategory.html", context)

# View stay category form
def viewstaycategory(request):
    context = {}
    
    try:
        # Fetch all stay categories
        context["staycategory"] = Stay_categoryModel.objects.all()
    except Exception as e:
        # Handle any unexpected errors
        messages.error(request, f"An error occurred while fetching stay categories: {e}")
    
    return render(request, "insert_staycategory.html", context)

# Update stay category form
def updatestaycategory(request, staycatid):
    context = {}
    
    # Fetch the stay category instance by ID
    staycat = get_object_or_404(Stay_categoryModel, id=staycatid)
    
    # Initialize the form with POST data, files, and the instance to update
    staycategory = stay_categoryform(request.POST or None, request.FILES or None, instance=staycat)
    
    try:
        # If the form is valid, save the updated stay category
        if staycategory.is_valid():
            staycategory.save()
            return HttpResponseRedirect('/adminhm/insert_staycategory')
    except Exception as e:
        # Handle any unexpected errors
        messages.error(request, f"An error occurred while updating the stay category: {e}")
    
    context['f3'] = staycategory
    return render(request, "updatestaycategory.html", context)

# Delete stay category form
def delstaycategory(request, staycatid):
    context = {}
    
    try:
        # Fetch the stay category instance by ID and delete it
        staycat = get_object_or_404(Stay_categoryModel, id=staycatid)
        staycat.delete()
    except Exception as e:
        # Handle any unexpected errors
        messages.error(request, f"An error occurred while deleting the stay category: {e}")
    
    return HttpResponseRedirect('/adminhm/insert_staycategory')




# Insert event details into the event table
def insert_event(request):
    context = {}
    
    # Initialize the form with POST data if available
    event_det = Event_form(request.POST or None)
    
    # Get the event name from the form data
    event_name = request.POST.get('Event')  # Text box name
    
    try:
        # Check if the event already exists
        if EventModel.objects.filter(Event=event_name).exists():
            messages.info(request, 'Event already exists')
            return redirect('/adminhm/insert_event')
        
        # If the form is valid, save the new event
        if event_det.is_valid():
            event_det.save()
            messages.success(request, 'Event created successfully')
            return redirect('/adminhm/insert_event')
        
        # If form is not valid, render the form with existing data
        context['form1'] = event_det
        context["events"] = EventModel.objects.all()
        return render(request, "insert_Events.html", context)
    
    except Exception as e:
        # Handle any unexpected errors
        messages.error(request, f"An error occurred while inserting the event: {e}")
        context['form1'] = event_det
        context["events"] = EventModel.objects.all()
        return render(request, "insert_Events.html", context)

# View event details
def viewEvent(request):
    context = {}
    
    try:
        # Fetch all events
        context["events"] = EventModel.objects.all()
        return render(request, "insert_Events.html", context)
    
    except Exception as e:
        # Handle any unexpected errors
        messages.error(request, f"An error occurred while fetching event details: {e}")
        context["events"] = EventModel.objects.all()  # Ensure context is set even on error
        return render(request, "insert_Events.html", context)

# Update event details
def updateevents(request, eventid):
    context = {}
    
    # Fetch the event instance by ID
    event = get_object_or_404(EventModel, id=eventid)
    
    # Initialize the form with POST data, files, and the instance to update
    event_det = Event_form(request.POST or None, request.FILES or None, instance=event)
    
    try:
        # If the form is valid, save the updated event
        if event_det.is_valid():
            event_det.save()
            messages.success(request, 'Event updated successfully')
            return HttpResponseRedirect('/adminhm/insert_event')
        
        # If form is not valid, render the form with existing data
        context['f3'] = event_det
        return render(request, "updateevents.html", context)
    
    except Exception as e:
        # Handle any unexpected errors
        messages.error(request, f"An error occurred while updating the event: {e}")
        context['f3'] = event_det
        return render(request, "updateevents.html", context)

# Delete event details
def delevents(request, eventid):
    context = {}
    
    try:
        # Fetch the event instance by ID and delete it
        event_det = get_object_or_404(EventModel, id=eventid)
        event_det.delete()
        messages.success(request, 'Event deleted successfully')
    
    except Exception as e:
        # Handle any unexpected errors
        messages.error(request, f"An error occurred while deleting the event: {e}")
    
    return HttpResponseRedirect('/adminhm/insert_event')


# Logout

def logout_view(request):
    """
    Handles user logout by calling Django's built-in logout function.
    After logging out, redirects the user to the login page or another desired page.
    """
    try:
        # Perform the logout operation
        logout(request)
        
        # Redirect to the login page or any other desired page after logout
        return HttpResponseRedirect('/login')
    
    except Exception as e:
        # Handle any unexpected errors that may occur during the logout process
        messages.error(request, f"An error occurred during logout: {e}")
        
        # Redirect to the login page or any other desired page in case of error
        return HttpResponseRedirect('/login')


# View stay details form
def viewstaydetails_admin(request):
    """
    Fetches and displays all stay details.
    """
    context = {}
    try:
        context["staydetails"] = Stay_DetailsModel.objects.all()
        return render(request, "search_staydetails.html", context)
    except Exception as e:
        messages.error(request, f"An error occurred while fetching stay details: {e}")
        return render(request, "search_staydetails.html", context)

# View vehicle details form
def viewvehicledetails_admin(request):
    """
    Fetches and displays all vehicle details.
    """
    context = {}
    try:
        context["vehicledetails"] = Vehicle_detailsModel.objects.all()
        return render(request, "search_vehicledetails.html", context)
    except Exception as e:
        messages.error(request, f"An error occurred while fetching vehicle details: {e}")
        return render(request, "search_vehicledetails.html", context)

# View reservation details
def viewreservation_admin(request):
    """
    Fetches and displays all reservation details.
    """
    context = {}
    try:
        context["reservation"] = Reservation_Model.objects.all()
        return render(request, "view_reservation_admin.html", context)
    except Exception as e:
        messages.error(request, f"An error occurred while fetching reservation details: {e}")
        return render(request, "view_reservation_admin.html", context)

# View feedback form
def viewfeedback_admin(request):
    """
    Fetches and displays all feedback.
    """
    context = {}
    try:
        context["feedback"] = FeedbackModel.objects.all()
        return render(request, "view_feedback.html", context)
    except Exception as e:
        messages.error(request, f"An error occurred while fetching feedback: {e}")
        return render(request, "view_feedback.html", context)

# Delete feedback form
def delfeedback(request, fid):
    """
    Deletes a feedback entry based on its ID.
    """
    try:
        feed = get_object_or_404(FeedbackModel, pk=fid)
        feed.delete()
        messages.success(request, 'Feedback deleted successfully')
    except Exception as e:
        messages.error(request, f"An error occurred while deleting feedback: {e}")
    return redirect(viewfeedback_admin)

# View all payment details
def viewpaymentall_admin(request):
    """
    Fetches and displays all payment details.
    """
    context = {}
    try:
        context["payment"] = Payment_Model.objects.all()
        return render(request, "view_paymentall_admin.html", context)
    except Exception as e:
        messages.error(request, f"An error occurred while fetching payment details: {e}")
        return render(request, "view_paymentall_admin.html", context)



def viewcompanyall_admin(request):
    context = {}
    context["company"] = Company_Model.objects.filter(Company_Status='ACTIVE')
    return render(request, "view_companyall_admin .html", context)


def viewcompany_activate(request):
    context = {}
    context["company"] = Company_Model.objects.filter(Company_Status='INACTIVE')
    return render(request, "view_companyall_activate.html", context)

def activatecompany(request,cid):
    obj=get_object_or_404(Company_Model ,pk=cid)
    obj.Company_Status='ACTIVE'
    obj.save()
    return HttpResponse("<script>alert('Company Activated');window.location='/adminhm/viewcompany_activate';</script>")
