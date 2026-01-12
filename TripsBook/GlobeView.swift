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
    // Jak tylko coś się tu zmieni, SwiftUI odświeży ten widok
    @EnvironmentObject var store: TripsStore
    
    func makeUIViewController(context: Context) -> MapViewController {
        let vc = MapViewController()
        vc.store = store
        
        DispatchQueue.main.async {
            self.mapViewController = vc
        }
        return vc
    }

    // Ta funkcja wykonuje się za każdym razem, gdy 'store' się zmieni
    func updateUIViewController(_ uiViewController: MapViewController, context: Context) {
        uiViewController.store = store
        
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

        case "orange": return UIColor(named: "TripOrange") ?? .orange
            

        case "green": return UIColor(named: "TripGreen") ?? .green
            
        default: return .gray
        }
    }
    

    func refreshMapData() {
        guard isStyleLoaded else { return }
        addCountries()
    }

    func addCountries() {
        guard let store = self.store else { return }

        removeAllCountries()

        var countriesToDo: [String: String] = [:]

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

        if !style.sourceExists(withId: sourceId) {
            var source = GeoJSONSource(id: sourceId)
            source.data = .url(url)
            try? style.addSource(source)
        }

        for (country, colorName) in countriesToDo {
            let code = nameToCode(country)
            let uiColor = colorFromString(colorName)

            
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
   
        let cleanedName = name.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        switch cleanedName {
            
        // A
        case "AFGANISTAN": return "AFG"
        case "ALBANIA": return "ALB"
        case "ALGIERIA": return "DZA"
        case "ANDORA": return "AND"
        case "ANGOLA": return "AGO"
        case "ANTIGUA I BARBUDA": return "ATG"
        case "ARABIA SAUDYJSKA": return "SAU"
        case "ARGENTYNA": return "ARG"
        case "ARMENIA": return "ARM"
        case "AUSTRALIA": return "AUS"
        case "AUSTRIA": return "AUT"
        case "AZERBEJDŻAN", "AZERBEJDZAN": return "AZE"
            
        // B
        case "BAHAMY": return "BHS"
        case "BAHRAJN": return "BHR"
        case "BANGLADESZ": return "BGD"
        case "BARBADOS": return "BRB"
        case "BELGIA": return "BEL"
        case "BELIZE": return "BLZ"
        case "BENIN": return "BEN"
        case "BHUTAN": return "BTN"
        case "BIAŁORUŚ", "BIALORUS": return "BLR"
        case "BIRMA", "MJANMA": return "MMR"
        case "BOLIWIA": return "BOL"
        case "BOŚNIA I HERCEGOWINA", "BOSNIA I HERCEGOWINA": return "BIH"
        case "BOTSWANA": return "BWA"
        case "BRAZYLIA": return "BRA"
        case "BRUNEI": return "BRN"
        case "BUŁGARIA", "BULGARIA": return "BGR"
        case "BURKINA FASO": return "BFA"
        case "BURUNDI": return "BDI"
            
        // C
        case "CHILE": return "CHL"
        case "CHINY": return "CHN"
        case "CHORWACJA": return "HRV"
        case "CYPR": return "CYP"
        case "CZAD": return "TCD"
        case "CZARNOGÓRA", "CZARNOGORA": return "MNE"
        case "CZECHY", "REPUBLIKA CZESKA": return "CZE"
            
        // D
        case "DANIA": return "DNK"
        case "DEMOKRATYCZNA REPUBLIKA KONGA", "DR KONGA": return "COD"
        case "DOMINIKA": return "DMA"
        case "DOMINIKANA", "REPUBLIKA DOMINIKANY": return "DOM"
        case "DŻIBUTI", "DZIBUTI": return "DJI"
            
        // E
        case "EGIPT": return "EGY"
        case "EKWADOR": return "ECU"
        case "ERYTREA": return "ERI"
        case "ESTONIA": return "EST"
        case "ESWATINI", "SUAZI": return "SWZ"
        case "ETIOPIA": return "ETH"
            
        // F
        case "FIDŻI", "FIDZI": return "FJI"
        case "FILIPINY": return "PHL"
        case "FINLANDIA": return "FIN"
        case "FRANCJA": return "FRA"
            
        // G
        case "GABON": return "GAB"
        case "GAMBIA": return "GMB"
        case "GHANA": return "GHA"
        case "GRECJA": return "GRC"
        case "GRENADA": return "GRD"
        case "GRUZJA": return "GEO"
        case "GUJANA": return "GUY"
        case "GWATEMALA": return "GTM"
        case "GWINEA": return "GIN"
        case "GWINEA BISSAU": return "GNB"
        case "GWINEA RÓWNIKOWA", "GWINEA ROWNIKOWA": return "GNQ"
            
        // H
        case "HAITI": return "HTI"
        case "HISZPANIA": return "ESP"
        case "HOLANDIA", "NIDERLANDY": return "NLD"
        case "HONDURAS": return "HND"
            
        // I
        case "INDIE": return "IND"
        case "INDONEZJA": return "IDN"
        case "IRAK": return "IRQ"
        case "IRAN": return "IRN"
        case "IRLANDIA": return "IRL"
        case "ISLANDIA": return "ISL"
        case "IZRAEL": return "ISR"
            
        // J
        case "JAMAJKA": return "JAM"
        case "JAPONIA": return "JPN"
        case "JEMEN": return "YEM"
        case "JORDANIA": return "JOR"
            
        // K
        case "KAMBODŻA", "KAMBODZA": return "KHM"
        case "KAMERUN": return "CMR"
        case "KANADA": return "CAN"
        case "KATAR": return "QAT"
        case "KAZACHSTAN": return "KAZ"
        case "KENIA": return "KEN"
        case "KIRGISTAN": return "KGZ"
        case "KIRIBATI": return "KIR"
        case "KOLUMBIA": return "COL"
        case "KOMORY": return "COM"
        case "KONGO": return "COG"
        case "KOREA POŁUDNIOWA", "KOREA POLUDNIOWA": return "KOR"
        case "KOREA PÓŁNOCNA", "KOREA POLNOCNA": return "PRK"
        case "KOSTARYKA": return "CRI"
        case "KUBA": return "CUB"
        case "KUWEJT": return "KWT"
            
        // L
        case "LAOS": return "LAO"
        case "LESOTHO": return "LSO"
        case "LIBAN": return "LBN"
        case "LIBERIA": return "LBR"
        case "LIBIA": return "LBY"
        case "LIECHTENSTEIN": return "LIE"
        case "LITWA": return "LTU"
        case "LUKSEMBURG": return "LUX"
        case "ŁOTWA", "LOTWA": return "LVA"
            
        // M
        case "MACEDONIA PÓŁNOCNA", "MACEDONIA POLNOCNA", "MACEDONIA": return "MKD"
        case "MADAGASKAR": return "MDG"
        case "MALAWI": return "MWI"
        case "MALEDIWY": return "MDV"
        case "MALEZJA": return "MYS"
        case "MALI": return "MLI"
        case "MALTA": return "MLT"
        case "MAROKO": return "MAR"
        case "MAURETANIA": return "MRT"
        case "MAURITIUS": return "MUS"
        case "MEKSYK": return "MEX"
        case "MIKRONEZJA": return "FSM"
        case "MOŁDAWIA", "MOLDAWIA": return "MDA"
        case "MONAKO": return "MCO"
        case "MONGOLIA": return "MNG"
        case "MOZAMBIK": return "MOZ"
            
        // N
        case "NAMIBIA": return "NAM"
        case "NAURU": return "NRU"
        case "NEPAL": return "NPL"
        case "NIEMCY": return "DEU"
        case "NIGER": return "NER"
        case "NIGERIA": return "NGA"
        case "NIKARAGUA": return "NIC"
        case "NORWEGIA": return "NOR"
        case "NOWA ZELANDIA": return "NZL"
            
        // O
        case "OMAN": return "OMN"
            
        // P
        case "PAKISTAN": return "PAK"
        case "PALAU": return "PLW"
        case "PALESTYNA": return "PSE"
        case "PANAMA": return "PAN"
        case "PAPUA-NOWA GWINEA", "PAPUA NOWA GWINEA": return "PNG"
        case "PARAGWAJ": return "PRY"
        case "PERU": return "PER"
        case "POLSKA": return "POL"
        case "PORTUGALIA": return "PRT"
            
        // R
        case "RPA", "REPUBLIKA POŁUDNIOWEJ AFRYKI": return "ZAF"
        case "REPUBLIKA ŚRODKOWOAFRYKAŃSKA", "RESPUBLIKA SRODKOWOAFRYKANSKA": return "CAF"
        case "REPUBLIKA ZIELONEGO PRZYLĄDKA", "ZIELONY PRZYLĄDEK": return "CPV"
        case "ROSJA", "FEDERACJA ROSYJSKA": return "RUS"
        case "RUMUNIA": return "ROU"
        case "RWANDA": return "RWA"
            
        // S
        case "SAINT KITTS I NEVIS": return "KNA"
        case "SAINT LUCIA": return "LCA"
        case "SAINT VINCENT I GRENADYNY": return "VCT"
        case "SALWADOR": return "SLV"
        case "SAMOA": return "WSM"
        case "SAN MARINO": return "SMR"
        case "SENEGAL": return "SEN"
        case "SERBIA": return "SRB"
        case "SESZELE": return "SYC"
        case "SIERRA LEONE": return "SLE"
        case "SINGAPUR": return "SGP"
        case "SŁOWACJA", "SLOWACJA": return "SVK"
        case "SŁOWENIA", "SLOWENIA": return "SVN"
        case "SOMALIA": return "SOM"
        case "SRI LANKA": return "LKA"
        case "STANY ZJEDNOCZONE", "USA", "AMERYKA": return "USA"
        case "SUDAN": return "SDN"
        case "SUDAN POŁUDNIOWY", "SUDAN POLUDNIOWY": return "SSD"
        case "SURINAM": return "SUR"
        case "SYRIA": return "SYR"
        case "SZWAJCARIA": return "CHE"
        case "SZWECJA": return "SWE"
            
        // T
        case "TADŻYKISTAN", "TADZYKISTAN": return "TJK"
        case "TAJLANDIA": return "THA"
        case "TAJWAN": return "TWN"
        case "TANZANIA": return "TZA"
        case "TIMOR WSCHODNI": return "TLS"
        case "TOGO": return "TGO"
        case "TONGA": return "TON"
        case "TRYNIDAD I TOBAGO": return "TTO"
        case "TUNEZJA": return "TUN"
        case "TURCJA": return "TUR"
        case "TURKMENISTAN": return "TKM"
        case "TUVALU": return "TUV"
            
        // U
        case "UGANDA": return "UGA"
        case "UKRAINA": return "UKR"
        case "URUGWAJ": return "URY"
        case "UZBEKISTAN": return "UZB"
            
        // V
        case "VANUATU": return "VUT"
            
        // W
        case "WATYKAN": return "VAT"
        case "WENEZUELA": return "VEN"
        case "WĘGRY", "WEGRY": return "HUN"
        case "WIELKA BRYTANIA", "ANGLIA", "ZJEDNOCZONE KRÓLESTWO": return "GBR"
        case "WIETNAM": return "VNM"
        case "WŁOCHY", "WLOCHY": return "ITA"
        case "WYBRZEŻE KOŚCI SŁONIOWEJ", "WYBRZEZE KOSCI SLONIOWEJ": return "CIV"
        case "WYSPY MARSHALLA": return "MHL"
        case "WYSPY SALOMONA": return "SLB"
        case "WYSPY ŚWIĘTEGO TOMASZA I KSIĄŻĘCA": return "STP"
            
        // Z
        case "ZAMBIA": return "ZMB"
        case "ZIMBABWE": return "ZWE"
        case "ZJEDNOCZONE EMIRATY ARABSKIE", "ZEA": return "ARE"
            
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

#Preview {
    GlobeView()
        .environmentObject(TripsStore())
        .frame(width: 400, height: 600)
}
