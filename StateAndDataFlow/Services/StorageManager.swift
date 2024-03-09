//
//  StorageManager.swift
//  StateAndDataFlow
//
//  Created by Paul Makey on 9.03.24.
//

import SwiftUI

final class StorageManager {
    static let shared = StorageManager()
    @AppStorage("User") private var savedUser: Data?
    
    private init() {}
    
    func save(user: User) {
        do {
            let encodedData = try JSONEncoder().encode(user.self)
            savedUser = encodedData
        } catch {
            print("Ошибка в сохранении данных")
        }
    }
    
    func fetch() -> User? {
        guard let savedUser else { return User(name: "", isLoggedIn: true) }
        do {
            let user = try JSONDecoder().decode(User.self, from: savedUser)
            return user
        } catch {
            print("Ошибка в получении данных")
        }
        return User(name: "", isLoggedIn: true)
    }
}
