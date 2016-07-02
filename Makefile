NAME?="default"
target=index
url?=https://github.com/hakimel/reveal.js/archive/master.zip

all: ${target}.html

%.html: %.org Makefile
	NAME=${NAME} emacs --batch\
 -u ${USER} \
  --eval '(load user-init-file)' \
  $< \
  -f org-reveal-export-to-html
	x-www-browser $@
help:
	@echo "https://github.com/yjwen/org-reveal/issues/171"

clean:
	rm -rfv *~ tmp

setup:
	wget -O- ${url} > tmp.zip && unzip tmp.zip

deploy: all
	git add .
	git commit -sam 'WIP'
	git push origin -f  HEAD:gh-pages

web_url?=https://${USER}.github.io/${USER}-example/
test:
	x-www-browser ${web_url}

