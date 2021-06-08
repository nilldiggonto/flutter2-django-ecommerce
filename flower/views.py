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

class FavoriteView(APIView):
    permission_classess = [IsAuthenticated,]
    authentication_classes = [TokenAuthentication,]
    
    def post(self,request):
        data = request.data['id']
        # print(user)
        # print(data)
        try:

            product_obj = Product.objects.get(id=data)
            user = request.user

            # print('i am here')
            single_favorite_product = Favourite.objects.filter(user=user,product=product_obj).first()
            # print(single_favorite_product)
            if single_favorite_product:
                # print('i am here')
                fav = single_favorite_product.isFavourite
                single_favorite_product.isFavourite = not fav
                single_favorite_product.save()
            else:
                Favourite.objects.create(product=product_obj,user=user,isFavourite=True)
            reposnse_msg = {'error':False}
        except:
            reposnse_msg = {'error':True}
        return Response(reposnse_msg)
        

