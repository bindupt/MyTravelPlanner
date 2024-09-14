# Generated by Django 5.0.3 on 2024-04-23 08:19

import django.db.models.deletion
import django.utils.timezone
from django.conf import settings
from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('adminhome', '0012_alter_eventmodel_description_and_more'),
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='Company_Model',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('Company_Name', models.CharField(max_length=50)),
                ('Com_Regist_No', models.CharField(max_length=20)),
                ('Vat_No', models.CharField(max_length=50)),
                ('Tin_No', models.CharField(max_length=50)),
                ('Address', models.TextField(max_length=200)),
                ('Address1', models.TextField(max_length=200)),
                ('ZIP', models.CharField(max_length=50)),
                ('Phone1', models.BigIntegerField()),
                ('Phone2', models.BigIntegerField()),
                ('Fax', models.BigIntegerField()),
                ('Email', models.EmailField(max_length=50)),
                ('Company_Status', models.CharField(default='INACTIVE', max_length=10)),
                ('Registrationdate', models.DateField(default=django.utils.timezone.now)),
                ('Country', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='adminhome.countrymodel')),
                ('Location', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='adminhome.locationmodel')),
                ('Login', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
                ('State', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='adminhome.statemodel')),
            ],
        ),
        migrations.CreateModel(
            name='Role_Model',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('role_type', models.CharField(max_length=30)),
                ('Login', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
    ]
