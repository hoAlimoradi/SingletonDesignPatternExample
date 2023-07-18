//
//  AppSettings.swift
//  SingletonDesignPatternExample
//
//  Created by hoseinAlimoradi on 7/18/23.
//

import Foundation

final public class AppSettings {
    
    /// Swift guarantees that static properties are threat-safe.
    /// That means that we shouldn't worry about accidentally creating multiple AppSettings
    /// instances if multiple threats access the static property at once.
    /// We can now use the Singleton instance through the shared static property.
    public static let shared = AppSettings()
    
    public enum Constants {
        static var theme = "Theme"
        static var maxConsurrentDownloads = "MaxConsurrentDownloads"
    }
    private var settings: [String: Any] = ["Theme": "Dark",
                                           "MaxConsurrentDownloads": 4]
    
    private init() {}
    
    public func string(forKey key: String) -> String? {
        return settings[key] as? String
    }
    
    public func int(forKey key: String) -> Int? {
        return settings[key] as? Int
    }
}
