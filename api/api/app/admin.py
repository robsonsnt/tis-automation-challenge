#from msilib.schema import Class
from django.contrib import admin
from app.models import Texto

class Textos(admin.ModelAdmin):
    list_display = ('id', 'titulo', 'texto')
    list_display_links = ('id', 'titulo')
    list_per_page = 10

admin.site.register(Texto, Textos)