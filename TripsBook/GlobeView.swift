//
//  Globe.swift
//  TripsBook
//
//  Created by Łukasz Lenart on 11/01/2026.
//

import SwiftUI
import MapboxMaps
import CoreLocation

// MARK: - Model danych
struct CountryColor {
    let countryCode: String
    let colorName: String
}

// MARK: - SwiftUI View
struct GlobeView: View {
    @State private var mapViewController: MapViewController?

    var body: some View {
        ZStack {
            MapboxGlobeWrapper(mapViewController: $mapViewController)
        }
    }
}

// MARK: - Wrapper SwiftUI → UIKit
struct MapboxGlobeWrapper: UIViewControllerRepresentable {
    @Binding var mapViewController: MapViewController?
    
    // 1. Tu odbieramy dane ze środowiska SwiftUI
    // Jak tylko coś się tu zmieni (dodasz podróż), SwiftUI odświeży ten widok
    @EnvironmentObject var store: TripsStore
    
    func makeUIViewController(context: Context) -> MapViewController {
        let vc = MapViewController()
        vc.store = store
        
        DispatchQueue.main.async {
            self.mapViewController = vc
        }
        return vc
    }

    // 2. ✅ TO JEST KLUCZ DO AKTUALIZACJI
    // Ta funkcja wykonuje się za każdym razem, gdy 'store' się zmieni
    func updateUIViewController(_ uiViewController: MapViewController, context: Context) {
        // Aktualizujemy store w kontrolerze (na wszelki wypadek)
        uiViewController.store = store
        
        // Wywołujemy odświeżenie mapy
        uiViewController.refreshMapData()
    }
}

// MARK: - Map Controller
class MapViewController: UIViewController {
    
    var store: TripsStore?
    var mapView: MapView!
    var addedCountryIds: [String] = []
    
    // Flaga sprawdzająca, czy styl mapy jest gotowy
    var isStyleLoaded: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let mapInitOptions = MapInitOptions()
        mapView = MapView(frame: view.bounds, mapInitOptions: mapInitOptions)
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(mapView)

        mapView.ornaments.options.compass.visibility = .hidden
        mapView.ornaments.options.scaleBar.visibility = .hidden
        mapView.mapboxMap.loadStyleURI(.light) { [weak self] _ in
            guard let self = self else { return }

            try? self.mapView.mapboxMap.style.setProjection(
                StyleProjection(name: .globe)
            )
            try? self.mapView.mapboxMap.style.setAtmosphere(Atmosphere())

            let cameraOptions = CameraOptions(
                center: CLLocationCoordinate2D(latitude: 52.0, longitude: 19.0),
                zoom: 0.60
            )
            self.mapView.mapboxMap.setCamera(to: cameraOptions)

            // Oznaczamy, że styl jest gotowy i można rysować
            self.isStyleLoaded = true
            self.refreshMapData()
        }
    }

    // MARK: - String → UIColor
    func colorFromString(_ name: String) -> UIColor {
        switch name.lowercased() {
        // Próbuje wziąć z Assets "TripOrange". Jak nie ma -> bierze zwykły .orange
        case "orange": return UIColor(named: "TripOrange") ?? .orange
            
        // Próbuje wziąć z Assets "TripGreen". Jak nie ma -> bierze zwykły .green
        case "green": return UIColor(named: "TripGreen") ?? .green
            
        default: return .gray
        }
    }
    
    // Funkcja pomocnicza wywoływana przez SwiftUI update
    func refreshMapData() {
        // Jeśli styl się jeszcze nie załadował, nie rób nic (viewDidLoad to załatwi)
        guard isStyleLoaded else { return }
        addCountries()
    }

    // MARK: - Główna funkcja kolorująca
    func addCountries() {
        guard let store = self.store else { return }

        // 3. ✅ WAŻNE: Wyczyść stare kraje przed dodaniem nowych!
        // Inaczej po zmianie statusu wycieczki stary kolor zostanie pod spodem.
        removeAllCountries()

        var countriesToDo: [String: String] = [:]

        // 4. ✅ POPRAWKA: Usunąłem @State (nie wolno tego używać wewnątrz funkcji w klasie)
        let finished = store.trips.filter { $0.status == .completed }
        let planned = store.trips.filter { $0.status == .planned }
        
        for trip in planned {
            countriesToDo[trip.country] = "orange"
        }
        for trip in finished {
            countriesToDo[trip.country] = "green"
        }
        
        let style = mapView.mapboxMap.style
        let sourceId = "countries-source"

        guard let url = Bundle.main.url(
            forResource: "countries",
            withExtension: "geo.json"
        ) else { return }

        // Źródło dodajemy tylko raz
        if !style.sourceExists(withId: sourceId) {
            var source = GeoJSONSource(id: sourceId)
            source.data = .url(url)
            try? style.addSource(source)
        }

        for (country, colorName) in countriesToDo {
            let code = nameToCode(country)
            let uiColor = colorFromString(colorName)

            // removeSingleCountry nie jest tu potrzebne bo użyliśmy removeAllCountries na górze,
            // ale nie zaszkodzi.
            
            let fillLayerId = "layer-\(country)"
            let outlineLayerId = "outline-\(country)"

            let filter = Exp(.eq) {
                Exp(.id)
                code
            }

            var fillLayer = FillLayer(id: fillLayerId, source: sourceId)
            fillLayer.filter = filter
            fillLayer.fillColor = .constant(StyleColor(uiColor))
            fillLayer.fillOpacity = .constant(0.8)

            var outlineLayer = LineLayer(id: outlineLayerId, source: sourceId)
            outlineLayer.filter = filter
            outlineLayer.lineColor = .constant(StyleColor(.white))
            outlineLayer.lineWidth = .constant(1.2)

            try? style.addLayer(fillLayer, layerPosition: .above("water"))
            try? style.addLayer(outlineLayer, layerPosition: .above(fillLayerId))

            if !addedCountryIds.contains(country) {
                addedCountryIds.append(country)
            }
        }
    }
    
    func nameToCode(_ name: String) -> String {
        let cleanedName = name.trimmingCharacters(in: .whitespacesAndNewlines).capitalized
        switch cleanedName {
        case "Polska": return "POL"
        case "Niemcy": return "DEU"
        case "Czechy", "Republika Czeska": return "CZE"
        case "Słowacja": return "SVK"
        case "Ukraina": return "UKR"
        case "Białoruś": return "BLR"
        case "Litwa": return "LTU"
        case "Rosja": return "RUS"
        case "Węgry": return "HUN"
        case "Austria": return "AUT"
        case "Szwajcaria": return "CHE"
        case "Francja": return "FRA"
        case "Hiszpania": return "ESP"
        case "Włochy": return "ITA"
        case "Portugalia": return "PRT"
        case "Wielka Brytania", "Anglia": return "GBR"
        case "Szwecja": return "SWE"
        case "Norwegia": return "NOR"
        case "Dania": return "DNK"
        case "Finlandia": return "FIN"
        case "Islandia": return "ISL"
        case "Usa", "Stany Zjednoczone": return "USA"
        case "Kanada": return "CAN"
        case "Chiny": return "CHN"
        case "Japonia": return "JPN"
        case "Australia": return "AUS"
        default: return "UNK"
        }
    }

    func removeSingleCountry(country: String) {
        let style = mapView.mapboxMap.style
        try? style.removeLayer(withId: "layer-\(country)")
        try? style.removeLayer(withId: "outline-\(country)")
    }

    func removeAllCountries() {
        for country in addedCountryIds {
            removeSingleCountry(country: country)
        }
        addedCountryIds.removeAll()
    }
}

// MARK: - Preview
#Preview {
    GlobeView()
        .environmentObject(TripsStore())
        .frame(width: 400, height: 600)
}
