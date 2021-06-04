from django.db import models
from django.contrib.auth.models import User
# Create your models here.

class Category(models.Model):
    title   = models.CharField(max_length=120)
    date    = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.title

class Product(models.Model):
    title           = models.CharField(max_length=120)
    date            = models.DateTimeField(auto_now_add=True)
    category        = models.ForeignKey(Category,on_delete=models.CASCADE)
    image           =   models.ImageField(upload_to='products/')
    market_price    = models.PositiveIntegerField()
    selling_price   = models.PositiveIntegerField()
    description     = models.TextField()

    def __str__(self):
        return self.title


class Favourite(models.Model):
    product     = models.ForeignKey(Product,on_delete=models.CASCADE)
    user        = models.ForeignKey(User,on_delete=models.CASCADE)
    isFavourite = models.BooleanField(default=False)

    def __str__(self):
        return f'product-is-{self.product.id}-{self.user.username}-{self.isFavourite}'


class Cart(models.Model):
    user        = models.ForeignKey(User,on_delete=models.CASCADE)
    total       = models.PositiveIntegerField()
    isComplete  = models.BooleanField(default=False)
    date        = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f'{self.user.username}-{self.isComplete}'


class CartProduct(models.Model):
    cart    = models.ForeignKey(Cart,on_delete=models.CASCADE)
    product = models.ManyToManyField(Product)
    price   = models.PositiveIntegerField()
    quantity    = models.PositiveIntegerField()
    subtotal    = models.PositiveIntegerField()
    # models.models.ManyToManyField("app.Model", verbose_name=_(""))

    def __str__(self):
        return f'{self.cart.id}-{self.cart.quantity}'


class Order(models.Model):
    cart    = models.OneToOneField(Cart,on_delete=models.CASCADE)
    email   = models.CharField(max_length=120)
    phone   = models.CharField(max_length=120)
    address = models.CharField(max_length=120)

    def __str__(self):
        return self.email


