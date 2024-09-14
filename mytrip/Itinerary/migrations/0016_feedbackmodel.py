# Generated by Django 5.0.7 on 2024-08-17 04:47

import django.db.models.deletion
import django.utils.timezone
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('Itinerary', '0015_rename_country_id_reservation_model_country_and_more'),
        ('registration', '0007_alter_company_model_address_and_more'),
    ]

    operations = [
        migrations.CreateModel(
            name='FeedbackModel',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('Email', models.EmailField(max_length=20)),
                ('Message', models.TextField(max_length=100, null=True)),
                ('Date', models.DateField(default=django.utils.timezone.now, max_length=8)),
                ('Itinarery', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='registration.itinerary_model')),
            ],
        ),
    ]
