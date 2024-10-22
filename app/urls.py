from django.urls import include, path
from rest_framework import routers


router = routers.SimpleRouter()

# router.register("", ViewSet, basename="")

urlpatterns = [
    path("", include(router.urls)),
]