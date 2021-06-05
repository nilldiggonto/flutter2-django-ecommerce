from django.shortcuts import render
from .serializers import *
from .models import *
from rest_framework.views import APIView
from rest_framework.response import Response
# Create your views here.
class ProductView(APIView):
    def get(self,request):
        queryset = Product.objects.all()
        serializer = ProductSerializers(queryset,many=True)
        return Response(serializer.data)

