import CoreLocation

func coordinate(from arguments: [String]) -> Result<CLLocationCoordinate2D> {
    if arguments.count != 2 {
        return .failure("Incorrect number of arguments, expected 2 got \(arguments.count)")
    }

    let latitudeStr = trimCoordinateSymbols(arguments[0])
    let longitudeStr = trimCoordinateSymbols(arguments[1])

    guard let latitude = Double(latitudeStr), let longitude = Double(longitudeStr) else {
        return .failure("Expected 2 numbers, got '\(latitudeStr)' and '\(longitudeStr)'")
    }

    return .success(CLLocationCoordinate2D(latitude: latitude, longitude: longitude))
}

// comma and degrees symbol (º)
private let coordinateSymbolsSet = CharacterSet(charactersIn: ",\u{B0}")

private func trimCoordinateSymbols(_ string: String) -> String {
    return string.trimmingCharacters(in: coordinateSymbolsSet)
}
