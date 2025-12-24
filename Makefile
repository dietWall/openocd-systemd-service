.PHONY: install


all:
	mkdir -p openocd-service_0.0.1
	mkdir -p openocd-service_0.0.1/usr/bin
	cp openocd-starter.sh openocd-service_0.0.1/usr/bin/openocd-starter
	mkdir -p openocd-service_0.0.1/etc/systemd/system
	cp openocd-service@.service openocd-service_0.0.1/etc/systemd/system/openocd-service@.service
	cp default_args.txt openocd-service_0.0.1/etc/openocd-args.txt
	dpkg-deb --root-owner-group --build openocd-service_0.0.1 

uninstall:
	rm -f $(DESTDIR)/usr/bin/openocd-starter
	rm -f $(DESTDIR)/etc/systemd/system/openocd-service@.service
	rm -f $(DESTDIR)/etc/openocd-args.txt

clean:
	rm -rf *.tar.gz
	rm -rf *.deb
	rm -rf openocd-service_0.0.1/
	