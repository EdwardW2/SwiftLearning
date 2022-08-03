//
//  CollectionTypes.swift
//  Basics2
//
//  Created by Edward Wilkins on 03/08/2022.
//

import Foundation

class CollectionTypes {
    
    /*
     There are three collection types in Swift which are all made to store collections of values. These are known as Arrays, Sets and Dictionaries
     Each collection has a clear type and structure to it so trying to inset a wrong type into a collection by mistake won't happen
     These collection sets can be assigned as mutable meaning you can assign them with a var and change them however you want to later on
     */
    
    func arrayStores() {
        // Arrays are ordered lists of values which each "item" in the array has an index starting from 0
        // It allows you to store the same values multiple times over in an Array.
        // The shorthand for an array is [] while the longer version is Array<element>
        
        // Here is an example of an empty array
        var someNumbers: [Int] = []
        print("someNumbers is of type [Int] with \(someNumbers.count) items.")
        
        // YOu can append to an array
        someNumbers.append(3)
        // And then empty it again
        someNumbers = []
        
        // We can of course create an array with default values
        var threeDoubles = Array(repeating: 0.0, count: 3)
        var anotherThreeDobules = Array(repeating: 2.5, count: 3)
        
        // You can now add both of the three doubles together which will merge both arrays together
        let sixDoubles = threeDoubles + anotherThreeDobules
        
        print("\(threeDoubles)")
        print("\(anotherThreeDobules)")
        print("\(sixDoubles)")
        
        
    }
}
