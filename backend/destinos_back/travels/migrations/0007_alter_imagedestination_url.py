# Generated by Django 4.2 on 2023-05-30 20:39

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('travels', '0006_alter_imagedestination_destination_and_more'),
    ]

    operations = [
        migrations.AlterField(
            model_name='imagedestination',
            name='url',
            field=models.FileField(upload_to='destinos-cba'),
        ),
    ]
