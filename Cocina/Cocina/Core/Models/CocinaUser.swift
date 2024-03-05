//
//  CocinaUser.swift
//  Cocina
//
//  Created by Blaine Beltran on 2/8/24.
//

import RealmSwift
import Foundation

class CocinaUser: Object {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var email: String
    @Persisted var password: String
    @Persisted var firstName: String
    @Persisted var lastName: String
}
