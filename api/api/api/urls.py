from django.contrib import admin
from django.urls import path, include
from app.views import TextoList
from rest_framework import routers

router = routers.DefaultRouter()
router.register('textos', TextoList, basename='Textos')

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include(router.urls) ),
]
