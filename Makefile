dartbuild:
	@echo "Building AngularDart..."
	pub build
	@echo "Cleaning up temporary build files..."	
	rm `find ./build/web -name *.ng_*.json`

gobuild:
	@echo "Building Go..."
	cd ./server && go build -o ../build/web/server    

build: dartbuild gobuild
	@echo "Done!"

run:
	$(shell source ./server/.env)
	cd ./build/web/ && ./server
