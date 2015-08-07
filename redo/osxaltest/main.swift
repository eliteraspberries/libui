// 31 july 2015
import Cocoa

var spaced = false
var firstvert = true

func appLaunched() {
	var hbox: tBox
	var spinbox: tSpinbox
	var button: tButton
	var entry: tEntry
	var label: tLabel

	var mainwin = tWindow()
	mainwin.tSetMargined(spaced)

	var box = tBox(vertical: firstvert, spaced: spaced)

	spinbox = tSpinbox()
	box.tAddControl(spinbox, stretchy: false)

	mainwin.tSetControl(box)

	hbox = tBox(vertical: !firstvert, spaced: spaced)
	button = tButton("Button")
	hbox.tAddControl(button, stretchy: true)
	button = tButton("Button")
	hbox.tAddControl(button, stretchy: true)
	box.tAddControl(hbox, stretchy: false)

	hbox = tBox(vertical: !firstvert, spaced: spaced)
	button = tButton("Button")
	hbox.tAddControl(button, stretchy: true)
	button = tButton("Button")
	hbox.tAddControl(button, stretchy: true)
	box.tAddControl(hbox, stretchy: false)

	// TODO in vertical mode the three non-stretchy buttons are smaller than they should be
	hbox = tBox(vertical: !firstvert, spaced: spaced)
	button = tButton("Button")
	hbox.tAddControl(button, stretchy: true)
	button = tButton("A")
	hbox.tAddControl(button, stretchy: false)
	button = tButton("BB")
	hbox.tAddControl(button, stretchy: false)
	button = tButton("CCC")
	hbox.tAddControl(button, stretchy: false)
	box.tAddControl(hbox, stretchy: false)

	// TODO this isn't stretchy in the proper order
	hbox = tBox(vertical: !firstvert, spaced: spaced)
	spinbox = tSpinbox()
	hbox.tAddControl(spinbox, stretchy: false)
	spinbox = tSpinbox()
	hbox.tAddControl(spinbox, stretchy: true)
	box.tAddControl(hbox, stretchy: false)

	hbox = tBox(vertical: !firstvert, spaced: spaced)
	entry = tEntry()
	hbox.tAddControl(entry, stretchy: true)
	entry = tEntry()
	hbox.tAddControl(entry, stretchy: false)
	box.tAddControl(hbox, stretchy: false)

	hbox = tBox(vertical: !firstvert, spaced: spaced)
	label = tLabel()
	hbox.tAddControl(label, stretchy: false)
	box.tAddControl(hbox, stretchy: false)

	mainwin.tShow()
}

class appDelegate : NSObject, NSApplicationDelegate {
	func applicationDidFinishLaunching(note: NSNotification) {
		appLaunched()
	}

	func applicationShouldTerminateAfterLastWindowClosed(app: NSApplication) -> Bool {
		return true
	}
}

func main() {
	spaced = Process.arguments.count > 1

	var app = NSApplication.sharedApplication()
	app.setActivationPolicy(NSApplicationActivationPolicy.Regular)
	// NSApplication.delegate is weak; if we don't use the temporary variable, the delegate will die before it's used
	var delegate = appDelegate()
	app.delegate = delegate
	app.run()
}

main()
