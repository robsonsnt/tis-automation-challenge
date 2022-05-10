from django.db import models

class Texto(models.Model):

    class Meta:

        db_table = 'texto'

    titulo = models.CharField(max_length=240)
    texto = models.CharField(max_length=500)

    #def __str__(self) -> str:
    #    return super().__str__()

    def __str__(self):
        return self.titulo