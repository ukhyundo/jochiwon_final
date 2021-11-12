from django.urls import path
from . import views

app_name = 'dongariapp'

urlpatterns = [
    path('list/', views.PostList.as_view(), name='post_list'),
    path('<int:pk>/', views.PostDetail.as_view()),
    #path('<int:pk>/', views.single_post_page),
    #path('', views.index),
]