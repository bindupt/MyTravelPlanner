# Generated by Django 5.0.1 on 2024-06-01 09:07

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('registration', '0006_alter_company_model_address_and_more'),
    ]

    operations = [
        migrations.AlterField(
            model_name='company_model',
            name='Address',
            field=models.TextField(max_length=50),
        ),
        migrations.AlterField(
            model_name='company_model',
            name='Address1',
            field=models.TextField(max_length=50),
        ),
    ]