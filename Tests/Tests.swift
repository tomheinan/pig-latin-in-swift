//
//  Tests.swift
//  PigLatin
//
//  Created by Tom Heinan on 7/5/14.
//  Copyright (c) 2014 Tom Heinan. All rights reserved.
//

import XCTest
import PigLatin

class Tests: XCTestCase {
    
    func testBasicFunctionality() {
        XCTAssertEqualObjects("hello".piggify(), "ellohay")
    }
	
	func testMultipleWords() {
		XCTAssertEqualObjects("hello world".piggify(), "ellohay orldway")
	}
	
	func testCapitalization() {
		XCTAssertEqualObjects("Hello world".piggify(), "Ellohay orldway")
	}
	
	func testPunctuation() {
		XCTAssertEqualObjects("Hello, world!".piggify(), "Ellohay, orldway!")
	}
	
	func testDiphthongs() {
		XCTAssertEqualObjects("eat apples".piggify(), "eatay applesay")
	}
	
	func testPhonemes() {
		XCTAssertEqualObjects("dragons strike quickly".piggify(), "agonsdray ikestray icklyquay")
	}
	
}
