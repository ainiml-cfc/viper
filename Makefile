all: build

build:
	python setup.py build

install:
	python setup.py install --record installed_files.txt
	mkdir -p /usr/share/viper
	cp -rf data/* /usr/share/viper
	mkdir -p /etc/viper
	cp viper.conf.sample /etc/viper/viper.conf

uninstall:
	cat installed_files.txt | xargs rm -rf
	rm -rf /usr/share/viper /etc/viper

dist:
	python setup.py sdist

clean:
	find . -name '*.pyc' -delete
	rm -rf dist build viper.egg-info installed_files.txt

