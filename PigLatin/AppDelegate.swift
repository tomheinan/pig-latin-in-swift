//
//  AppDelegate.swift
//  PigLatin
//
//  Created by Tom Heinan on 7/5/14.
//  Copyright (c) 2014 Tom Heinan. All rights reserved.
//

import Cocoa

class AppDelegate: NSObject, NSApplicationDelegate {
                            
	@IBOutlet var window: NSWindow
	//@IBOutlet var inputTextView: NSTextView
	//@IBOutlet var outputTextView: NSTextView


	func applicationDidFinishLaunching(aNotification: NSNotification?) {
		// Insert code here to initialize your application
	}

	func applicationWillTerminate(aNotification: NSNotification?) {
		// Insert code here to tear down your application
	}
	
	func textDidChange(notification:NSNotification) {
		//println(inputTextView.textStorage.string)
	}

}

