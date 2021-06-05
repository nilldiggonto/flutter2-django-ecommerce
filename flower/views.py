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
        data = []
        serializer = ProductSerializers(queryset,many=True)
        for product in serializer.data:
            fav_query = Favourite.objects.filter(user=request.user,product__id= product['id'])
            # print(fav_query)
            if fav_query:
                product['favourite'] = fav_query[0].isFavourite
            else:
                product['favourite'] = False
            data.append(product)
        return Response(data)

