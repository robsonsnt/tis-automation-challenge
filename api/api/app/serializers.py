from dataclasses import fields
from rest_framework import serializers
from .models import Texto

class TextoSerializer(serializers.ModelSerializer):

    class Meta:

        model = Texto
        fields = '__all__'