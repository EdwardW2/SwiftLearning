//
//  ViewController.swift
//  Basics2
//
//  Created by Edward Wilkins on 28/07/2022.
//

import UIKit

class ViewController: UIViewController {
    
    let randomConstant = 5
    // Let is to always be used on values you know will never change.
    
    var randomVariable = 0
    // Variables are made to be changed unlike constants, you use these if you know a value will be modified.
    
    var randomVariables = 0.0, y = 0.5
    // Possible to declare mupitple variables on 1 line.
    
    // var red, green, blue: Double
    // It is also possible to declare multiple variables in 1 line of the same type.
    // I have commented out the above for the sake of the compiler not complaining about initilization due to no provided default.

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        aHelloFunction()
        printCat()
        playIntegers()
        typeInference()
        typeAliasAndBoolean()
        tuples()
        funWithOptionals()
    }

    func aHelloFunction() {
        var welcomingMessage: String
        // You can declare types in variables and constants using : symbol.
        welcomingMessage = "Hello There"
        // Then you may freely edit them without issue.
        
        print(welcomingMessage)
        print("This should output the following message: \(welcomingMessage)")
        // The above is known as String Interpolation.
    }
    
    func printCat() {
        let cat = "Cat"; print(cat)
        // Semicolons are not needed but must be used if you want multiple statements on 1 line
    }
    
    func playIntegers() {
        let minimumNumber = UInt8.min
        let maximumNumber = UInt8.max
        // UInt is a unsigned integer type and is only to be used when you need a integer the same size as the platforms native size.
        
        var doubleNumber: Double
        var floatingNumber: Float
        
        doubleNumber = 35364.12
        floatingNumber = 12.5
        
        print("Here is some numbers: \(minimumNumber), \(maximumNumber), \(doubleNumber), \(floatingNumber)")
    }
    
    func typeInference() {
        let aInferredType = 100
        let anotherType = 3.14159
        // No type needs to be stated, swift will infer the first as Int and the second as Double.
        
        let addingTwoNumbers = 3 + 0.14159
        // This will also be registered as a Double
        
        print("Here is more numbers: \(aInferredType), \(anotherType), \(addingTwoNumbers)")
    }
    
    func typeAliasAndBoolean() {
        typealias LieOrNot = Bool
        // TypeAlias allows us to give type Bool a unique name
        
        let catsAreGood: LieOrNot = true
        let dogsAreAnnoying = false
        
        if dogsAreAnnoying {
            print("Dogs can be quite annoying, espically puppies.")
        } else {
            print("Dogs are not that annoying")
        }
        
        if catsAreGood == true && dogsAreAnnoying == false {
            print("Cats are good and so are dogs, just dogs can be a bit annoying.")
        } else {
            return
        }
        // If statement containing equals operators and AND symbols
        // Return statement within which simply exits the if statement
    }
    
    func tuples() {
        let http404Error = (404, "Not Found")
        // Tuples are multiple values placed into a singular value. This example above simply privdes a 404 as an Int and a String of Not Found.
        
        let (statusCode, statusMessage) = http404Error
        print("The status code is \(statusCode) an the message is \(statusMessage)")
        
        //Alternative method for using statusCode and statusMessage is:
        print("The status code is \(http404Error.0) and the message is \(http404Error.1)")
        
        // You can also give your tuples names for each input:
        let http200Status = (statusCode: 200, description: "OK")
        print("Code: \(http200Status.statusCode). Message: \(http200Status.description)")
    }
    
    func funWithOptionals() {
        let couldBeNumber = "8120"
        let whatNumber = Int(couldBeNumber)
        // By default, the compiler will now automatically infer that whatNumber is a Int?, a optional as it could fail.
        // Optionals are marked with a ? and simply means that the answer could be "Nil"
        
        var exampleNil: String?
        // This is automatically marked as "nil"
        var serverResponseCode: Int? = 404
        serverResponseCode = nil
        
        print("Examples of potential nil are: \(whatNumber ?? 0), \(exampleNil ?? "Blank"), \(serverResponseCode ?? 0)")
        // In this print statement, we use a bunch of potential optionals, but the compiler does not like it because the answer could be blank and not user friendly. To fix this problem, we use ?? to provide a default value if the response is nil.
        
        if whatNumber != nil {
            print("whatNumber contains a value.")
        }
        
        if whatNumber != nil {
            print("whatNumber has a value of \(whatNumber!)")
        }
        
        if let actualNumber = Int(couldBeNumber) {
            print("The string \"\(couldBeNumber)\" has an integer value of \(actualNumber)")
        } else {
            print("The string \"\(couldBeNumber)\" couldn't be converted to an integer")
        }
        
        if let firstNumber = Int("8"), let secondNumber = Int("64"), firstNumber < secondNumber && secondNumber < 100 {
            print("\(firstNumber) < \(secondNumber) < 100")
        }
        
        if let firstNumber = Int("8") {
            if let secondNumber = Int("64") {
                if firstNumber < secondNumber && secondNumber < 100 {
                    print("\(firstNumber) < \(secondNumber) < 100")
                }
            }
        }
    }
    
    func unwrappingOptionals() {
        // The example below is an optional string which is then forcefully unwrapped by forcedString using an ! symbol
        let potentialString: String? = "An optional string"
        let forcedString: String = potentialString!
        
        // The example below is similar to the above, except this time the String is unwrapped from the get go and thus does not need a ! when implicitString uses it unlike forcedString did.
        let assumedString: String! = "An implicitly unwrapped optional string"
        let implicitString: String = assumedString
        
        // Here the type of optionalString is recognized as String? and assumedString isn't force unwrapped.
        let optionalString = assumedString
        
        if assumedString != nil {
            print(assumedString!)
        }
        
        if let definiteString = assumedString {
            print(definiteString)
        }
    }
    
    func letTheErrorsFlow() throws {
        // The sole purpose of this function is to potentially throw an error during runtime which should be handled with a do statement.
    }
    
    func catchError() {
        do {
            try letTheErrorsFlow()
            unwrappingOptionals()
        } catch {
            tuples()
        }
    }
    
    func debuggingAssertions() {
        
    }

}

