# Generated by Django 5.0.1 on 2024-05-28 23:31

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('Itinerary', '0014_alter_reservation_model_reserv_date'),
    ]

    operations = [
        migrations.RenameField(
            model_name='reservation_model',
            old_name='Country_ID',
            new_name='Country',
        ),
        migrations.RenameField(
            model_name='reservation_model',
            old_name='State_ID',
            new_name='State',
        ),
    ]
