# Define variables
GOLANG_PROJECT_PATH=./
DYLIB_NAME=libyourlib.dylib
DYLIB_PATH=$(GOLANG_PROJECT_PATH)Lib/cbridge
XCODE_PROJECT_PATH=../WebCrawler/WebCrawler
DYLIB_DEST=$(XCODE_PROJECT_PATH)/Libraries

# Default target
all: build_dylib

# Target for building the Go shared library
build_dylib:
	@echo "Building Go shared library..."
	go build -o $(DYLIB_NAME) -buildmode=c-shared $(DYLIB_PATH)/cbridge.go
	@echo "Go shared library built."

# Target for setting up the dylib in the Xcode project scope
setup_xcode:
	@echo "Copying dylib to Xcode project..."
	mkdir -p $(DYLIB_DEST)
	cp $(DYLIB_NAME) $(DYLIB_DEST)/$(DYLIB_NAME)
	cp $(DYLIB_PATH)/cbridge.h $(DYLIB_DEST)/cbridge.h
	@echo "Dylib and header file copied to Xcode project."
	cd $(XCODE_PROJECT_PATH)/Libraries && install_name_tool -id @rpath/libyourlib.dylib libyourlib.dylib

# Combine targets for convenience
build_and_setup: build_dylib setup_xcode

.PHONY: all build_dylib setup_xcode build_and_setup
