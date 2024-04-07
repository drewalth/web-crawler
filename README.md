# web-crawler

This is an academic exercise to learn how to use Go as a backend for a macOS app built with SwiftUI.

![web-crawler](/hero.png)

## Goals

- [x] Create Go package, compile it to a dynamic library and use it in a macOS app
- [ ] Use Go to crawl a website with [go-rod](https://go-rod.github.io/#/) and extract its links
- [ ] Stream logs from Go to the macOS app
- [ ] Stream the links from Go to the macOS app
- [ ] Use SwiftUI to display the links in a list

## How to run

1. Clone the repository
2. Open the `web-crawler.xcodeproj` file
3. Run the app

## Changes to the Go package

Makes changes to `Backend/Lib/cbridge.go` and run `make build_and_setup` from the `Backend/` dir to compile the dynamic library and add to Xcode.