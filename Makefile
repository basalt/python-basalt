SHELL := /bin/bash

NAME=basalt-tasks
VERSION=0.1

.PHONY: all clean prepare package_deb
.SILENT: desc

all: desc

desc:
	echo "usage: please use either make package_deb"

clean:
	rm -f python-$(NAME)*.deb

prepare:
	# nothing to do here

package_deb: clean prepare
	fpm -s python \
	    -t deb \
	    -m "Jochen Breuer <brejoc@gmail.com>" \
	    --license "MIT" \
	    -v $(VERSION) \
	    --deb-user root \
	    --deb-group root \
	    --no-auto-depends \
	    -d "python2.7" \
            -d "python (>=2.7.5)" \
            -d "python (<<2.8)" \
	    -d "python-invoke (<=0.7.0)" \
	    -d "python-yaml" \
	    -d "python-jinja2" \
	    -d "python-sh" \
	    $(NAME)
