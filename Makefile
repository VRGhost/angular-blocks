VERSION=$(grep 'version' package.json | sed 's/.*\"\(.*\)\".*/\1/')

install:
	npm install     # Install node modules
	grunt install   # Build & test client app

release:
	grunt bump
	make install
	git add dist bower.json package.json
	git commit -m "Bumped version to $(value VERSION)"
	git tag -a $(value VERSION) -m "v$(value VERSION)"
