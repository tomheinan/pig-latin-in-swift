//
//  String+PigLatin.swift
//  PigLatin
//
//  Created by Tom Heinan on 7/5/14.
//  Copyright (c) 2014 Tom Heinan. All rights reserved.
//

import Foundation

extension String {
	
	// translates the string to pig latin
	func piggify() -> String {
		var words = self.componentsSeparatedByCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
		words = words.map({self._piggifyWord($0)})
		
		return " ".join(words.map({"\($0)"}))
	}
	
	// swift doesn't have access control modifiers yet, so i'm making this syntax up
	// this isn't actually a hidden private function
	func _piggifyWord(word: String) -> String {
		var piggifiedWord:String
		var regex:NSRegularExpression
		var result:NSTextCheckingResult?
		
		// does it start with a capital letter? if so, we'll want to titlecase the output
		regex = NSRegularExpression.regularExpressionWithPattern("^[A-Z]", options: nil, error: nil)
		result = regex.firstMatchInString(word, options: nil, range: NSMakeRange(0, countElements(word)))
		piggifiedWord = word.lowercaseString
		
		var titlecaseOutput = false
		if let match = result {
			titlecaseOutput = true
		}
		
		// if it starts with a vowel, we'll just leave it alone
		regex = NSRegularExpression.regularExpressionWithPattern("^[aeiou]", options: .CaseInsensitive, error: nil)
		result = regex.firstMatchInString(piggifiedWord, options: nil, range: NSMakeRange(0, countElements(word)))
		
		if let match = result {
			piggifiedWord += "ay"
		} else {
			// if not, separate the word into its constituent coponents and rearrange them accordingly
			// dr, str, and qu are special cases, otherwise just move the first consonant
			regex = NSRegularExpression.regularExpressionWithPattern("^((?:dr)|(?:str)|(?:qu)|\\w)(\\w*)(\\W*)$", options: .CaseInsensitive, error: nil)
			result = regex.firstMatchInString(piggifiedWord, options: nil, range: NSMakeRange(0, countElements(word)))
			
			if let match = result {
				let firstLetter = String(word.bridgeToObjectiveC().substringWithRange(match.rangeAtIndex(1)))
				let restOfWord = String(word.bridgeToObjectiveC().substringWithRange(match.rangeAtIndex(2)))
				
				piggifiedWord = restOfWord + firstLetter + "ay"
				
				if match.numberOfRanges > 3 {
					let punctuation = String(word.bridgeToObjectiveC().substringWithRange(match.rangeAtIndex(3)))
					piggifiedWord += punctuation
				}
			}
		}
		
		if titlecaseOutput {
			piggifiedWord = piggifiedWord.capitalizedString
		}
		
		return piggifiedWord
	}
	
}
