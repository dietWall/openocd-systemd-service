.PHONY: install


all:
	mkdir -p build/openocd-service_0.0.1
	mkdir -p build/openocd-service_0.0.1/usr/bin
	cp openocd-starter.sh build/openocd-service_0.0.1/usr/bin/openocd-starter
	mkdir -p build/openocd-service_0.0.1/etc/systemd/system
	cp openocd-service@.service build/openocd-service_0.0.1/etc/systemd/system/openocd-service@.service
	cp default_args.txt build/openocd-service_0.0.1/etc/openocd-args.txt
	mkdir -p build/openocd-service_0.0.1/DEBIAN
	cp control build/openocd-service_0.0.1/DEBIAN/control
	dpkg-deb --root-owner-group --build build/openocd-service_0.0.1
	

uninstall:
	rm -f /usr/bin/openocd-starter
	rm -f /etc/systemd/system/openocd-service@.service
	rm -f /etc/openocd-args.txt

clean:
	rm -rf *.tar.gz
	rm -rf *.deb
	rm -rf build/openocd-service_0.0.1/
