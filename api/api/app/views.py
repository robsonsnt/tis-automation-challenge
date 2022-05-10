from django.shortcuts import render
from rest_framework import viewsets
from .models import Texto
from .serializers import TextoSerializer

class TextoList(viewsets.ModelViewSet):

    queryset = Texto.objects.all()
    serializer_class = TextoSerializer