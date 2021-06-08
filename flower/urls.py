from django.urls import path
from .views import *
from rest_framework.authtoken.views import obtain_auth_token

urlpatterns = [
    path('products/',ProductView.as_view(),name='product-view'),
    path('favorite/',FavoriteView.as_view(),name='fav-view'),
    path('login/',obtain_auth_token),
    path('register/',RegisterView.as_view(),name='register-view'),
]