//
//  StorageManager.swift
//  StateAndDataFlow
//
//  Created by Paul Makey on 9.03.24.
//

import SwiftUI

final class StorageManager {
    static let shared = StorageManager()
    
    private init() {}
    
    func create(user: User) {
        do {
            let encodedData = try JSONEncoder().encode(user.self)
            @AppStorage("user") var user = encodedData
        } catch {
            fatalError("Ошибка в сохранении данных")
        }
    }
    
    func fetch() -> User {
        @AppStorage("user") var data = Data()
        do {
            let user = try JSONDecoder().decode(User.self, from: data)
            return user
        } catch {
            fatalError("Ошибка в получении данных")
        }
    }
}
