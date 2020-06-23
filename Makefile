NAME = foramontano/grav
VERSION = 0.1.0
NOMBRE_CONTENEDOR_LDAP=openldap

.PHONY: all build build-nocache

all: build deploy

build:
	docker build -t $(NAME):$(VERSION) --rm .

deploy:
	docker run -d -p 8000:80 \
		--name $(NOMBRE_CONTENEDOR_LDAP) \
		--restart always \
		--volume grav_data:/var/www/html \
		--detach $(NAME):$(VERSION)

build-nocache:
	docker build -t $(NAME):$(VERSION) --no-cache --rm .
