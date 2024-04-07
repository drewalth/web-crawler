package main

import (
	"C"
	"fmt"
	// "github.com/go-rod/rod"
	// "github.com/go-rod/rod/lib/launcher"
)

//export SayHello
func SayHello(name *C.char) *C.char {
	goName := C.GoString(name)

	greeting := fmt.Sprintf("%s, and returned from Go!", goName)

	// l := launcher.New().
	// 	Headless(false).
	// 	Devtools(false)

	// defer l.Cleanup()

	// url := l.MustLaunch()

	// browser := rod.New().
	// 	ControlURL(url).
	// 	Trace(false).
	// 	MustConnect()

	// defer browser.MustClose()

	// page := browser.MustPage("https://www.google.com")

	// page.MustWaitStable().MustScreenshot("a.png")

	// Convert Go string back to C string

	return C.CString(greeting)
}

func main() {}
