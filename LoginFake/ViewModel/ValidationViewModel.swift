//
//  ValidationViewModel.swift
//  LoginFake
//
//  Created by Tony Lieu on 3/4/24.
//

import Foundation

protocol Validation {
    //check for correct username
    //check for correct password
    func loginVal(emailID:String?, passwordinput:String?)-> Bool
}

struct ValidationViewModel {
    
}

extension ValidationViewModel:Validation {
    func loginVal(emailID:String?, passwordinput:String?)-> Bool{
        var isValid = false
        guard let emailID = emailID else{
            return isValid
        }
        guard let passwordinput = passwordinput else{
            return isValid
        }
        let isValidPassword = passwordinput.count >= 6
        let emailRegex = "[A-Z0-9a-z.%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        //                  abc           @ gmail          .com
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        let isEmailValid =  emailPredicate.evaluate(with: emailID)
        isValid = isEmailValid && isValidPassword
        return isValid
    }
}
