# Generated by Django 5.0.3 on 2024-04-03 01:03

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('jpartyapp', '0002_alter_user_username'),
    ]

    operations = [
        migrations.AlterField(
            model_name='events',
            name='image',
            field=models.CharField(max_length=255, null=True),
        ),
        migrations.AlterField(
            model_name='events',
            name='link',
            field=models.URLField(null=True),
        ),
        migrations.AlterField(
            model_name='events',
            name='secretkey',
            field=models.CharField(max_length=7, null=True),
        ),
    ]
