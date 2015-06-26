.PHONY: all web core

all: web core

web:
	cd web && docker build -t zauberpony/icinga2-web --rm .

core:
	cd core && docker build -t zauberpony/icinga2-core --rm .
