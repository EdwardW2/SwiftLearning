//
//  Strings.swift
//  Basics2
//
//  Created by Edward Wilkins on 29/07/2022.
//

import Foundation

class StringsAndCharacters {
    
    func testMethod() {
        
    }
    
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
}
