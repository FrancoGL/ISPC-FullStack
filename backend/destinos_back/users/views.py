from rest_framework import generics, status
from django.contrib.auth import get_user_model
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework.exceptions import AuthenticationFailed
from .serializers import UserSerializer
from rest_framework_simplejwt.serializers import TokenObtainPairSerializer
from rest_framework_simplejwt.views import TokenObtainPairView
import datetime,jwt
from rest_framework.decorators import permission_classes
from rest_framework.permissions import AllowAny, IsAdminUser

User = get_user_model()

    



@permission_classes([AllowAny])
class UserList(generics.ListCreateAPIView):
    queryset = User.objects.all().order_by('id')
    serializer_class = UserSerializer

class UserByUsernameView(APIView):
    def get(self, request, username):
        
        user = User.objects.get(username=username)
        serialized_user = UserSerializer(user)
        return Response(serialized_user.data)

        
class UserDetail(generics.RetrieveAPIView):
    queryset = User.objects.all()
    serializer_class = UserSerializer
    lookup_field = 'pk'
    
    def put(self, request, pk=None):
        users = User.objects.get(pk=pk)
        serializer = UserSerializer(users, request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(status=status.HTTP_204_NO_CONTENT)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    
    @permission_classes([IsAdminUser])
    def delete(self, request, pk=None):
        users = User.objects.filter(pk=pk)
        users.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)

class MyTokenObtainPairSerializer(TokenObtainPairSerializer):
    @classmethod
    def get_token(cls, user):
        token = super().get_token(user)

        # Add custom claims
        token['username'] = user.username

        # ...

        return token
class MyTokenObtainPairView(TokenObtainPairView):
    serializer_class = MyTokenObtainPairSerializer
