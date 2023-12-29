import os 
from .settings import *
from .settings import BASE_DIR


SECRET_KEY = os.environ['SECRET']
ALLOWED_HOSTS = [os.environ['WEBSITE_HOSTNAME']]
CSRF_TRUSTED_ORIGINS = ['https://' + os.environ['WEBSITE_HOSTNAME']]
DEBUG = True

# WhiteNoise configuration
MIDDLEWARE = [
    'django.middleware.security.SecurityMiddleware',
    'whitenoise.middleware.WhiteNoiseMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
] 

STATICFILES_STORAGE = 'whitenoise.storage.CompressedManifestStaticFilesStorage'
STATIC_ROOT = os.path.join(BASE_DIR, 'staticfiles')


from azure.identity import ClientSecretCredential
import os

tenant_id = os.getenv('AZURE_POSTGRESQL_TENANTID')
client_id = os.getenv('AZURE_POSTGRESQL_CLIENTID')
client_secret = os.getenv('AZURE_POSTGRESQL_CLIENTSECRET')

cred = ClientSecretCredential(tenant_id=tenant_id, client_id=client_id, client_secret=client_secret)

accessToken = cred.get_token('https://ossrdbms-aad.database.windows.net/.default')

host = os.getenv('AZURE_POSTGRESQL_HOST')
user = os.getenv('AZURE_POSTGRESQL_USER')
database = os.getenv('AZURE_POSTGRESQL_NAME')

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql',
        'NAME': database,
        'USER': user,
        'PASSWORD': accessToken.token,  
        'HOST': host,
        'PORT': '5432',
        'OPTIONS': {'sslmode': 'require'},
    }
}