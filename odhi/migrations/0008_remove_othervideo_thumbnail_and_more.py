# Generated by Django 5.1.3 on 2025-07-21 10:48

from django.db import migrations


class Migration(migrations.Migration):
    dependencies = [
        ("odhi", "0007_othervideo_historicalothervideo"),
    ]

    operations = [
        migrations.RemoveField(
            model_name="othervideo",
            name="thumbnail",
        ),
        migrations.DeleteModel(
            name="HistoricalOtherVideo",
        ),
    ]
