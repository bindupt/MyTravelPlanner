# Generated by Django 5.0.7 on 2024-08-22 06:00

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('company', '0013_alter_pilgrimcentermodel_pilg_description'),
    ]

    operations = [
        migrations.AlterField(
            model_name='pilgrimcentermodel',
            name='Pilg_Address',
            field=models.TextField(max_length=200, null=True),
        ),
        migrations.AlterField(
            model_name='pilgrimcentermodel',
            name='Pilg_Description',
            field=models.TextField(max_length=200, null=True),
        ),
    ]
