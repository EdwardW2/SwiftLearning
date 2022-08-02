//
//  Strings.swift
//  Basics2
//
//  Created by Edward Wilkins on 29/07/2022.
//

import Foundation

class StringsAndCharacters {
    
    func stringLiteral() {
        // String Literal is a string value with double quotation marks
        let someString = "This is a string literal"
        print(someString)
        
        let quotation = """
        This is a multiline string literal.
        Here you are able to insert multiple lines of characters using 3 double quotations marks next to each other.
        
        You can even put whitespace between the lines if you wanted to.
        """
        print(quotation)
        
        // Example below is just showing how there is no line break in either of the 2
        let singleLineString = "These are the same"
        let multiLineString = """
        These are the same.
        """
        print(singleLineString)
        print(multiLineString)
        
        // The blacklash used at the end of each line is to make it easier to read in code but when printed it will keep the lines together as one.
        let softWrappedQuotation = """
        This is a multiline string literal, \
        here you are able to insert multiple lines of characters using 3 double quotations marks next to each other.
        
        You can even put whitespace between the lines if you wanted to \
        it can help.
        """
        print(softWrappedQuotation)
        
        let lineBreaks = """

        This string starts with a line break.
        It also ends with one.

        """
        print(lineBreaks)
    }
    
    func specialCharacters() {
        /*
         There are a few special characters to make note of in strings:
         \0 is null character
         \\ is simply a backslash
         \t is a horizontal tab
         \n creates a new line
         \r is carriage return
         \" for adding double quotation marks
         \' for adding single quotation marks
         There is also \u{n} which has the value of n become a number value with 1-8 digits which allow you to use unicode characters
         */
        
        let someWordsAboutSomething = "\"Always get enough sleep before the next day\" - Everyone"
        let dollarSign = "\u{24}"
        let blackHeart = "\u{2665}"
        let sparklingHeart = "\u{1F496}"
        
        print(someWordsAboutSomething)
        print(dollarSign)
        print(blackHeart)
        print(sparklingHeart)
    }
    
    func extendedStringDelimiters() {
        // Delimiters are ways of making a string with special characters without invoking their effects
        // For example if I was to put a # in a string next to a /n the /n will be printed as part of the string without its effect invoked.
        
        let someText = #"""
            Some text is here oh and more quote marks: """
            """#
        print(someText)
    }
    
    func emptyStringMethod() {
        // Creating empty strings is as easy as leaving everything in the " blank or just initalizing a string
        let emptyString = ""
        let anotherEmptyString = String()
        
        if emptyString.isEmpty {
            print("Nothing to see here.")
        } else if anotherEmptyString.isEmpty {
            print("Empty String again")
        }
    }
    
    func stringMutability() {
        // Just like numbers/Ints you can mutate the value of strings even using the += operator like so:
        var someString = "Cats"
        someString += " and Dogs"
        
        print(someString)
        
        // Using let is not possible for this since can't modify constants
    }
    
    func workingWithCharacters() {
        // Characters are what we all know to be singular letters, values, emojis and so on.
        
        for character in "House Of Cats" {
            print(character)
        }
        
        let questionMark: Character = "?"
        print(questionMark)
        
        let catCharacters: [Character] = ["C", "a", "t", "s"]
        let catString = String(catCharacters)
        print(catString)
    }
    
    func concatenatingStringsAndCharacters() {
        // You can use the + operator to add 2 strings together
        let someString1 = "Hello"
        let someString2 = " World!"
        var welcome = someString1 + someString2
        print(welcome)
        
        // The += operator also works for this task:
        var someInstruction = "Look there is the"
        someInstruction += someString2
        print(someInstruction)
        
        // You can add strings and characters to existing strings using the .append method
        let exclamationMark: Character = "!"
        welcome.append(exclamationMark)
        print(welcome)
        
        // This can also work with multiline strings but you want to make sure the last line ends with a break or you could get some issues:
        let badString = """
            one
            two
            """
        
        let end = """
            three
            """
        
        // This will print something like twothree because there is no line break seperating the 2
        print(badString + end)
        
        let goodString = """
            one
            two
            
            """
        // Fixed:
        print(goodString + end)
    }
    
    func stringInterpolation() {
        // Like string concatation, interpolation is similar except rather than adding 2 strings together, you are inserting something into an existing string which we used a bit of in the main ViewController.
        
        let multiplier = 5
        let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"
        print(message)
        
        // It also works even if you use string delimiters
        print(#"Write an interpolated string is here using \(multiplier)."#)
        
        // If you want you can also allow the value to print even with delimiters like so:
        print(#"6 times 7 is \#(6 * 7)."#)
    }
    
    /*
     Unicode scalar values as used above in one of our methods is a unique 21-bit number. It is used for characters + modifiers which can allow you to add emojis into your text if you so want to or special types of characters like a small latin A
     */
    
    func graphemeClusters() {
        
        // Comments to be filled in
        let eAcute: Character = "\u{E9}"
        let combineEAcute: Character = "\u{65}\u{301}"
        
        print (eAcute)
        print (combineEAcute)
        
        let precomposed: Character = "\u{D55C}"
        let decomposed: Character = "\u{1112}\u{1161}\u{11AB}"
        
        print (precomposed)
        print(decomposed)
        
        let enclosedEAcute: Character = "\u{E9}\u{20DD}"
        
        print(enclosedEAcute)
        
        let regionalIndictatorForUS: Character = "\u{1F1FA}\u{1F1F8}"
        
        print(regionalIndictatorForUS)
    }
    
    func countingCharacters() {
        // You can count how many characters are present in a string
        let someAnimals = "Cat, Dog, Polar Bear, Tiger, Lion, Lemur"
        print("someAnimals has \(someAnimals.count) characters")
        
        // Note that the count won't always count every character. For example if you concatenate a string or modify it using extended grapheme clusters, it will only count the original number of characters of the string.
        var someWord = "House"
        print("the number of characters in \(someWord) is \(someWord.count)")
        
        someWord += "\u{301}"
        
        // It will still print as 5 as the new character added is both an extended graphene cluster and modified the string so the .count is only counting the original version of the string which is House.
        print("the number of characters in \(someWord) is \(someWord.count)")
    }
    
    // Accesing and modifying a string
    func stringIndices() {
        // You can get specific characters from strings using index
        let someWord = "Dog Walk!"
        // This grabs the start of the index, aka, the start of the string
        print(someWord[someWord.startIndex])
        
        // This line grabs the character just before the end of the index
        print(someWord[someWord.index(before: someWord.endIndex)])
        
        // This is the same as the above but after the start of the index
        print(someWord[someWord.index(after: someWord.startIndex)])
        
        // Unlike the others used, this is taking the start of the index and then wanting an offset by 5 so it counts 5 characters ahead and grabs that one.
        let index = someWord.index(someWord.startIndex, offsetBy: 5)
        print(someWord[index])
        
        // Trying to grab an index outside of the range of the string will cause an runtime error
        
        // FInally there is a indices property you can use t access all characters of a string:
        for index in someWord.indices {
            print("\(someWord[index]) ", terminator: "")
        }
    }
    
    func insertingAndRemoving() {
        // You can insert characters there is a insert(_: at:) function and for inserting strings there is a insert(contentsOf: at:) method
        var pet = "Doggy"
        pet.insert("!", at: pet.endIndex)
        
        pet.insert(contentsOf: " Walk", at: pet.index(before: pet.endIndex))
        
        // You can also remove characters and strings:
        pet.remove(at: pet.index(before: pet.endIndex))
        
        let range = pet.index(pet.endIndex, offsetBy: -4)..<pet.endIndex
        pet.removeSubrange(range)
    }
    
    func substrings() {
        // Coments to be filled in here
        let greeting = "Hello, World!"
        let index = greeting.firstIndex(of: ",") ?? greeting.endIndex
        let beginning = greeting[..<index]
        
        let newString = String(beginning)
        print(newString)
    }
    
    // Comparing Strings
    func stringAndCharacterEquality() {
        /*
         There are 3 ways to compare textual values which are of the following:
         String and Character Equality - Examples in this method but is pretty much comparing a character to a character or string to another string and seeing if they match 1 to 1.
         Prefix equality which compares the start of a string known as the 'Prefix" to see if it matches
         Suffic Equality which is the smae as prefix but at the end instead of the beginning
         */
        
        let sameQuoteString = "This will be the same as the next string"
        let actualQuoteString = "This will be the same as the next string"
        if sameQuoteString == actualQuoteString {
            print("These 2 strings are the exact same and thus are equal")
        }
        
        // Strings can even be compared and considered equal when using unicode/grapheme clusters like so:
        let eAcuteQuote = "Pretend this is some french or spanish text\u{E9}"
        
        let combinedEActueQuote = "Pretend this is some french or spanish text\u{65}\u{301}"
        
        if eAcuteQuote == combinedEActueQuote {
            print("These two are considered the same because E9 and 65 + 301 equal the same character of an latin e")
        }
        
        // However not all comparisons between unicode/grapheme clusters workout as equals, simply because they are all unique and quite often, not the same.
        // Take 2 A's for example. You have a latin and a Cyrillic A. They may both be A but they are not equal
        let latinLetterA: Character = "\u{41}"
        let cryillicLetterA: Character = "\u{0410}"
        
        if latinLetterA == cryillicLetterA {
            print("These 2 characters are equal.")
        } else {
            print("These 2 characters are not equal.")
        }
    }
    
    func prefixAndSuffixEquality() {
        // Just like the above, you can also use prefixes and suffixes to find equals and compare strings
        // Below is an example list of strings for Romeo & Juliet
        let romeoAndJuliet = [
            "Act 1 Scene 1: Verona, A public place",
            "Act 1 Scene 2: Capulet's mansion",
            "Act 1 Scene 3: A room in Capulet's mansion",
            "Act 1 Scene 4: A street outside Capulet's mansion",
            "Act 1 Scene 5: The Great Hall in Capulet's mansion",
            "Act 2 Scene 1: Outside Capulet's mansion",
            "Act 2 Scene 2: Capulet's orchard",
            "Act 2 Scene 3: Outside Friar Lawrence's cell",
            "Act 2 Scene 4: A street in Verona",
            "Act 2 Scene 5: Capulet's mansion",
            "Act 2 Scene 6: Friar Lawrence's cell"
        ]
        
        // Here is finding/comparing strings with a prefix of Act 1 and then counting how many times Act 1 appears.
        var countNumberofAct1 = 0
        for scene in romeoAndJuliet {
            if scene.hasPrefix("Act 1 ") {
                countNumberofAct1 += 1
            }
        }
        print("There is \(countNumberofAct1) scenes in Act 1.")
        
        // The same can be done with the Suffix
        var mansionCount = 0
        var cellCount = 0
        
        for scene in romeoAndJuliet {
            if scene.hasSuffix("Capulet's mansion") {
                mansionCount += 1
            } else if scene.hasSuffix("Friar Lawrence's cell") {
                cellCount += 1
            }
        }
        
        print("\(mansionCount) mansion scenes; \(cellCount) cell scenes")
    }
    
    // Unicode
    
    func unicodeUTF8() {
        
    }
    
    func unicodeUTF16() {
        
    }
    
    func unicodeScalar() {
        
    }
}
