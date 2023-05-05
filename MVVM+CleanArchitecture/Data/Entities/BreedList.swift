//
//  BreedList.swift
//  MVVM+CleanArchitecture
//
//  Created by DM on 02/05/23.
//

import Foundation

public enum BreedListStatus: String, Codable {
    case success
    case failure
}

public struct BreedList: Codable {
    let message: [String: [String]]
    let status: BreedListStatus
    
    
}

extension BreedList {
    var names: [BreedName] {
        message.map { key, value in
            value.isEmpty ? BreedName(name: key) : BreedName(name: "\(key) \(value.joined(separator: " "))")
        }
    }
}

public struct BreedName: Identifiable {
    public let id: String = UUID().uuidString
    let name: String
}

extension BreedList {
    
}
