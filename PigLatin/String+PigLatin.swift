//
//  String+PigLatin.swift
//  PigLatin
//
//  Created by Tom Heinan on 7/5/14.
//  Copyright (c) 2014 Tom Heinan. All rights reserved.
//

import Foundation

extension String {
	
	func piggify() -> String {
		var words = self.componentsSeparatedByCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
		words = words.map({self._piggifyWord($0)})
		
		return " ".join(words.map({"\($0)"})) // just a fancy way of imploding an array via whitespace
	}
	
	// swift doesn't have access control modifiers yet, so i'm making this syntax up
	// this isn't actually a hidden private function
	func _piggifyWord(word: String) -> String {
		var piggifiedWord:String
		var regex:NSRegularExpression
		var result:NSTextCheckingResult?
		
		// does it start with a capital letter? if so, we'll want to titlecase the output
		regex = NSRegularExpression.regularExpressionWithPattern("^([A-Z])", options: nil, error: nil)
		result = regex.firstMatchInString(word, options: nil, range: NSMakeRange(0, countElements(word)))
		piggifiedWord = word.lowercaseString
		
		var titlecaseOutput = false
		if let match = result {
			titlecaseOutput = true
		}
		
		regex = NSRegularExpression.regularExpressionWithPattern("^(\\w)(\\w*)$", options: .CaseInsensitive, error: nil)
		result = regex.firstMatchInString(piggifiedWord, options: nil, range: NSMakeRange(0, countElements(word)))
		
		if let match = result {
			let firstLetter = String(word.bridgeToObjectiveC().substringWithRange(match.rangeAtIndex(1)))
			let restOfWord = String(word.bridgeToObjectiveC().substringWithRange(match.rangeAtIndex(2)))
			
			piggifiedWord = restOfWord + firstLetter + "ay"
		}
		
		if titlecaseOutput {
			piggifiedWord = piggifiedWord.capitalizedString
		}
		
		return piggifiedWord
	}
	
}
