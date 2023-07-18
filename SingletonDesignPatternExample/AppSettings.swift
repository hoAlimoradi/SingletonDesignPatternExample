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
    private let concurrentQueue = DispatchQueue(label: "concurrentQueue", attributes: .concurrent)
    
    private init() {}
    
    public func string(forKey key: String) -> String? {
        var result: String?
        concurrentQueue.sync {
            result = settings[key] as? String
        }
        return result
    }
    
    public func int(forKey key: String) -> Int? {
        var result: Int?
        concurrentQueue.sync {
            result = settings[key] as? Int
        }
        return result
    }
    
    public func set(value: Any, forKey key: String) {
        concurrentQueue.async( flags: .barrier ) {
            self.settings[key] = value
        }
    }
}
