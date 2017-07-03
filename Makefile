all: fresh build install

fresh:
	./fresh.sh

install: 
	./prepack.sh
	
build:
	./build.sh

clean:
	rm -rf Codeception/*.phar
	rm -rf debian/php-codeception

deb:
	debuild -i -us -uc -b

.PHONY : install
	