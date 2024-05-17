//
//  JSON.swift
//
//
//  Created by Fernando Fernandes on 17.05.24.
//

import Foundation

/// Loads and decodes `.json files` from the *main bundle* or *"Development Assets"* into a specified `Decodable` type.
///
/// This function attempts to locate a JSON file with the given filename in the main bundle or *"Development Assets"*,
/// read its contents, and decode it into the specified type.
///
/// If any step fails (file not found, data reading error, or decoding error), the function returns `nil`.
///
/// - Parameters:
///   - filename: The name of the JSON file (without the `.json` extension) to be loaded.
///   - type: The type conforming to `Decodable` that the JSON data should be decoded into.
///
/// - Returns: An optional value of the specified type. Returns `nil` if the file is not found,
/// data cannot be read, or decoding fails.
///
/// - Note: Ensure that the JSON file is included in the main bundle of the application or
/// listed under the *"Development Assets"* (target/General/Development Assets).
///
/// - Example:
///   ```swift
///   struct User: Decodable {
///       let id: Int
///       let name: String
///   }
///
///   if let user: User = loadJSONFromFile(filename: "user", type: User.self) {
///       print("User ID: \(user.id), User Name: \(user.name)")
///   } else {
///       print("Failed to load or decode the JSON file.")
///   }
///   ```
public func loadJSONFromFile<T: Decodable>(filename: String, type: T.Type) -> T? {
    guard let url = Bundle.main.url(forResource: filename, withExtension: "json") else {
        return nil
    }
    guard let data = try? Data(contentsOf: url) else {
        return nil
    }
    guard let decodedData = try? JSONDecoder().decode(T.self, from: data) else {
        return nil
    }
    return decodedData
}
