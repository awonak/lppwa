# Google appengine project id
PROJECT_ID=${PROJECT_ID}


dartbuild:
	@echo "Building AngularDart..."
	pub build
	@echo "Cleaning up temporary build files..."	
	rm `find ./build/web -name *.ng_*.json`

gobuild:
	@echo "Building Go..."
	go build -o lppwa

build: dartbuild gobuild
	@echo "Done!"

run:
	$(shell source .env & ./lppwa)

deploy:
	gcloud app deploy

publish: required
	gcloud app deploy --image-url gcr.io/$(PROJECT_ID)/lppwa


## Ensure this system has the PROJECT_ID defined
required:
	@if [ ! -f $(PROJECT_ID) ]; then \
	    echo "Missing project id. See README for instructions."; \
	    exit 1; \
	fi
