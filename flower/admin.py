from django.contrib import admin
from .models import Cart,Product,CartProduct,Favourite,Order,Category
# Register your models here.

admin.site.register([Cart,Product,CartProduct,Favourite,Order,Category])
