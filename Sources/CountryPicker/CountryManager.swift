//
//  CountryManager.swift
//  CountryPicker
//
//  Created by Samet Macit on 31.12.2020.
//  Copyright © 2021 Mobven. All rights reserved.

import Foundation
import UIKit

public final class CountryManager {
    public static let shared = CountryManager()
    private init() {}

    // Default theme is support dark mode
    public var config: Configuration = Config()

    // For localization we use current locale by default but you can change localeIdentifier for specific cases
    public var localeIdentifier: String = NSLocale.current.identifier

    /// - Returns: Country array
    func getCountries() -> [Country] {
        if let path = Bundle.module.path(forResource: "countries", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path))
                return try JSONDecoder().decode([Country].self, from: data)
            } catch {
                print("error", error)
            }
        }
        return []
    }
}
