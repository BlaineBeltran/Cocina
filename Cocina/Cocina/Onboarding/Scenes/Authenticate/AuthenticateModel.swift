//
//  AuthenticateModel.swift
//  Cocina
//
//  Created by Blaine Beltran on 1/26/24.
//

import Foundation

enum Authenticate {
    enum LogUserIn {
        struct Request {
            let nameEnteredByUser: String
        }
        
        struct Response {
            var user: TestUser
        }
        
        struct ViewModel {
            var name: String 
        }
    }
}
