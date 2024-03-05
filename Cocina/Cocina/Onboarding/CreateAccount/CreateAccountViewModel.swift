//
//  CreateAccountViewModel.swift
//  Cocina
//
//  Created by Blaine Beltran on 2/17/24.
//

import Foundation
import RegexBuilder
import Combine

class CreateAccountViewModel: ObservableObject {
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var password: String = ""
    @Published var email: String = ""
    @Published var number: String = ""
    @Published var user = CocinaUser()
    
    @Published var passwordContainsAtLeastOneDigit = false
    @Published var passwordContainsAtLeastOneLetter = false
    @Published var passwordContainsAtLeastOneSpecialCharacter = false
    @Published var passwordIsAtLeast12Characters = false
    @Published var passwordFieldState: FieldState = .neutral
    
    @Published var emailErrorMessage: String?
    @Published var emailFieldState: FieldState = .neutral
    
    @Published var isUserSignedIn = false
    
    var cancellables: Set<AnyCancellable> = []
    
    init() {
        setupListeners()
    }
    
    private func setupListeners() {
        $password
            .map { password in
                return self.validateOneDigitInPassword(password)
            }
            .assign(to: \.passwordContainsAtLeastOneDigit, on: self)
            .store(in: &cancellables)
        
        $password
            .map { password in
                return self.validateOneLetterInPassword(password)
            }
            .assign(to: \.passwordContainsAtLeastOneLetter, on: self)
            .store(in: &cancellables)
        
        $password
            .map { password in
                return self.validateOneSpecialCharacterInPassword(password)
            }
            .assign(to: \.passwordContainsAtLeastOneSpecialCharacter, on: self)
            .store(in: &cancellables)
        
        $password
            .map { password in
                return self.validatePasswordIsAtLeast12Characters(password)
            }
            .assign(to: \.passwordIsAtLeast12Characters, on: self)
            .store(in: &cancellables)
    }
    
    // Public facing API to check for email validation
    @discardableResult
    func checkForValidEmail() -> Bool {
        validateEmail(email)
    }
    
    private func validateEmail(_ email: String) -> Bool {
        let emailRegex = Regex {
            OneOrMore(.word)
            Optionally {
              "."
            }
            OneOrMore(.word)
            "@"
            OneOrMore(.word)
            "."
            OneOrMore(.word)
        }
        if let _ = try? emailRegex.wholeMatch(in: email)?.output {
            return true
        } else {
            emailFieldState = .negative
            emailErrorMessage = "Please enter a valid email"
            return false
        }
    }
    
    func validateOneLetterInPassword(_ password: String) -> Bool {
        let oneOrMoreLetter = Regex {
            ("a"..."z")
        }.ignoresCase()
        return password.contains(oneOrMoreLetter)
    }

    func validateOneDigitInPassword(_ password: String) -> Bool {
        let oneOrMoreDigit = Regex { OneOrMore(.digit) }
        return password.contains(oneOrMoreDigit)
    }
    
    func validateOneSpecialCharacterInPassword(_ password: String) -> Bool {
        let oneOrMoreDigit = Regex {
            One(.anyOf("@$!%*#?&"))
        }
        return password.contains(oneOrMoreDigit)
    }
    
    func validatePasswordIsAtLeast12Characters(_ password: String) -> Bool {
        let twelveCharactersLong = Regex {
            Repeat(12...) {
                /./
            }
        }
        return password.contains(twelveCharactersLong)
    }
    
    @MainActor
    func signInUser() async {
        do {
            isUserSignedIn = try await AuthenticationManager().loginUser(with: email, password: password)
        } catch {
            print(error)
        }
    }
}
