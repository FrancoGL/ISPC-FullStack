# Generated by Django 4.2 on 2023-05-30 20:24

import cloudinary.models
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('travels', '0005_remove_package_accommodation_and_more'),
    ]

    operations = [
        migrations.AlterField(
            model_name='imagedestination',
            name='destination',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='images', to='travels.destination'),
        ),
        migrations.AlterField(
            model_name='imagedestination',
            name='url',
            field=cloudinary.models.CloudinaryField(max_length=255, verbose_name='image'),
        ),
    ]