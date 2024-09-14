# Generated by Django 5.0.3 on 2024-04-22 10:16

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('adminhome', '0011_alter_eventmodel_country'),
    ]

    operations = [
        migrations.AlterField(
            model_name='eventmodel',
            name='Description',
            field=models.TextField(max_length=100, null=True),
        ),
        migrations.AlterField(
            model_name='eventmodel',
            name='Importance',
            field=models.TextField(max_length=50, null=True),
        ),
        migrations.AlterModelTable(
            name='eventmodel',
            table='event_table',
        ),
    ]