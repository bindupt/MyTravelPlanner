# Generated by Django 5.0.3 on 2024-05-02 05:09

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('Itinerary', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='reservation_model',
            name='Status',
            field=models.CharField(default='New', max_length=20),
        ),
    ]
