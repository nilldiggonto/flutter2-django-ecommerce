from django.shortcuts import render
from .serializers import *
from .models import *
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework.permissions import IsAuthenticated,IsAuthenticatedOrReadOnly
from rest_framework.authentication import TokenAuthentication
# Create your views here.
class ProductView(APIView):
    permission_classes = [IsAuthenticated,]
    authentication_classes = [TokenAuthentication,]
    def get(self,request):
        queryset = Product.objects.all()
        serializer = ProductSerializers(queryset,many=True)
        return Response(serializer.data)

