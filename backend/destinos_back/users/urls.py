from django.contrib import admin
from django.urls import path
from . import views

urlpatterns = [
    path('users', views.UserList.as_view()),
    path('auth/login', views.LoginView.as_view()),
]
