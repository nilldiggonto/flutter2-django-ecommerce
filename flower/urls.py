from django.urls import path
from .views import *

urlpatterns = [
    path('products/',ProductView.as_view(),name='product-view'),
    path('favorite/',FavoriteView.as_view(),name='fav-view'),
]