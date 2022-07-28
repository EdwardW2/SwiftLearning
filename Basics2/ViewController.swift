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
        // Do statements are required in order to catch errors. Do statements come with the use of both Try and Catch clauses which each serve a purpose.
        // Try is to try the function you wish to find errors for. Catch is to catch the errors and should also go in order of specific to generic.
        // Without this, the app will crash when an error is encountered, which is bad UX.
        do {
            try letTheErrorsFlow()
            unwrappingOptionals()
        } catch {
            tuples()
        }
    }
    
    func debuggingAssertions() {
        // Assertions are around to either debug or ensure that the needs of your method, function or program are met. Example below is to make sure that a person can never input an age below 0, it must be equal or above zero to pass.
        let age = -3
        assert(age >= 0, "A person's age can't be less than zero.")
        
        if age > 10 {
            print("You can ride the rollecoaster or ferris wheel.")
        } else if age >= 0 {
            print("You can only ride the ferris wheel. Too young to go on the coaster.")
        } else {
            // Assertion Failures are around to provide a message if it is hit, providing a assertion failure warning in your debugging and the message you can customize as to why it failed.
            assertionFailure("A person's age can't be les than zero")
        }
        
        // Preconditions also exist. They provide true or false answers which ensure that the condition MUST BE MET before the code will continue. You pass an expression which checks for true or false and then pass a message so if it fails it can present why it failed.
    }
    
    func assignmentOperators() {
        // The = sign here is known as an assignment operator. First it assigns x as 10, y as 140, but then assigns the variable of y to x making y 10.
        let x = 10
        var y = 140
        y = x
        
        // Also works with tuples where you can take 2 values and assign them to another 2 values. So a is assigned as 1 and b is assigned as 2.
        let (a, b) = (1, 2)
        
        if x == y {
            // Do nothing, just an example.
        }
        
        print("Here is what x is: \(x) and y is also \(y). a should be \(a) and b should be \(b)")
    }
    
    func arithmeticOperators() {
        /*
         There is a few Arithmetic Operators which are:
         + is addition
         - is subtraction
         * is multiplication
         / is division
         % is remainder
         */
        print(1 + 2)
        print(5 - 3)
        print(2 * 3)
        print(10.0 / 2.5)
        print(9 % 4)
        
        // Also possible with negative numbers for example:
        print(-9 % 4)
        
        // It also supports strings
        print("Hello, " + "world")
        
        // There is also Unary Minus and Unary Plus operators. Unary minus is prefixed by a - symbol and Unary plus is prefixed with a +
        let four = 4
        let minusFour = -four
        let plusFour = -minusFour
        
        let minusSix = -6
        let alsoMinusSix = +minusSix
    }
    
    func compoundAssignmentOperators() {
        // Compound assignment operators means you take the assignment operator of = with another operator such as a +
        // The example below creates variable x with a assigned value of 1 and then uses += on the next like to add a 2
        // This is short for x = x + 2
        var x = 1
        x += 2
    }
    
    func comparisonOperators() {
        /*
         There is also comparison Operators which have a few uses:
         == simply means equal to. E.g is a == b (Is a equal to value b)
         != not equal to
         > greater than
         < less than
         >= Greater than or equal to
         <= Less than or equal to
         */
        // Here is some examples
        print(10 == 10)
        print(2 != 10)
        print(2 > 1)
        print(1 < 2)
        print(1 >= 1)
        print(2 <= 1)
        
        let nameOfDog = "Sherlock"
        if nameOfDog == "Sherlock" {
            print("Hello, Sherlock")
        } else {
            print("I'm sorry \(nameOfDog), but you are not my dog.")
        }
        
        // It is worth noting that comparison operators won't always work. For example the < and > operators will error if you attempt to compare any form of boolean value. Because true or false is neither greater or less than each other.
    }
    
    func ternaryConditionalOperator() {
        
    }
    
    func nilCoalescingOperator() {
        
    }
    
    func rangeOperators() {
        
    }
    
    func logicalOperations() {
        
    }

}

