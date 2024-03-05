//
//  AuthenticationManager.swift
//  Cocina
//
//  Created by Blaine Beltran on 2/8/24.
//

import Foundation
import RealmSwift
import FirebaseAuth

enum AuthenticationError: Error {
    case somethingBadHappened
    case invalidToken
    case invalidCredentials
}

class AuthenticationManager {
    let app = App(id: "devicesync-dwnpw")
    lazy var client = app.emailPasswordAuth
    
    func onboardNewUser(with email: String, password: String) async throws {
        try await createAccount(email: email, password: password)
        try await logIntoMongoDB()
    }
    
    func loginUser(with email: String, password: String) async throws -> Bool {
        do {
            let user = try await Auth.auth().signIn(withEmail: email, password: password)
            let isLoggedIn = if Auth.auth().currentUser != nil { true } else { false }
            try await logIntoMongoDB()
            return isLoggedIn
        } catch {
            throw error
        }
    }
    
    /// Creates a new account with an email and password with firebase
    ///
    /// New accounts are automatically signed in.
    private func createAccount(email: String, password: String) async throws {
        try await Auth.auth().createUser(withEmail: email, password: password)
    }
    
    /// Login or create a user in MongoDB
    /// 
    /// logging into Mongo DB with automatically create a user if one does not already exist
    private func logIntoMongoDB() async throws {
        let currentUser = Auth.auth().currentUser
        let token = try await currentUser?.getIDTokenResult(forcingRefresh: true).token
        guard let token else { throw AuthenticationError.invalidToken }
        let mongoDBCredentials = Credentials.jwt(token: token)
        let mongoDBUser = try await app.login(credentials: mongoDBCredentials)
    }
}
