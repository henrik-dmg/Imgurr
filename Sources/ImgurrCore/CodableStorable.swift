import Foundation

@propertyWrapper public struct CodableStorable<T: Codable> {

    private let key: String
    private let defaultValue: T
    private let defaults: UserDefaults

    public init(key: String, defaultValue: T, defaults: UserDefaults = .standard) {
        self.key = key
        self.defaultValue = defaultValue
        self.defaults = defaults
    }

    public var wrappedValue: T {
        get {
            print("accessing data")
            // Read value from UserDefaults
            guard let data = defaults.object(forKey: key) as? Data else {
                // Return defaultValue when no data in UserDefaults
                return defaultValue
            }
            // Convert data to the desire data type
            let value = try? JSONDecoder().decode(T.self, from: data)
            return value ?? defaultValue
        }
        set {
            // Convert newValue to data
            let data = try? JSONEncoder().encode(newValue)
            // Set value to UserDefaults
            defaults.set(data, forKey: key)
        }
    }

}

