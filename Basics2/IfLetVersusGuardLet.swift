//
//  IfLetVersusGuardLet.swift
//  Basics2
//
//  Created by Edward Wilkins on 01/08/2022.
//

import Foundation

struct User {
    var firstName: String?
    var lastName: String?
    var email: String?
}

class UserValidation {
    func validateWithIfLet(user: User?) -> Bool {
            if let user = user {
                if let firstName = user.firstName, firstName.count > 3 {
                    if let lastName = user.lastName, lastName.count > 3 {
                        if let email = user.email, email.contains("@") {
                            return true
                        }
                        return false
                    }
                    return false
                }
                return false
            }
            return false
        }
    
    func validateWithGuardLet(user: User?) -> Bool {
            guard let user = user
            else {
                return false
            }
            
            guard let firstName = user.firstName,
                  firstName.count > 3
            else {
                return false
            }
            
            guard let lastName = user.lastName,
                  lastName.count > 3
            else {
                return false
            }
            
            guard let email = user.email,
                    email.contains("@")
            else {
                return false
            }
            
            return true
        }
}
