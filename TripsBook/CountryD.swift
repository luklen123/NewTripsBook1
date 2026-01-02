import Foundation
import SwiftUI // Jeśli używasz tego w widokach SwiftUI

// MARK: - Modele Danych

struct Info: Codable, Identifiable {
    var id = UUID() // Dodane automatyczne ID dla pętli ForEach
    var name: String
    var description: String
    var imageURL: String
    var wikipediaURL: String
    
    // Customowy init pozwala pominąć podawanie ID przy tworzeniu danych
    init(name: String, description: String, imageURL: String, wikipediaURL: String) {
        self.name = name
        self.description = description
        self.imageURL = imageURL
        self.wikipediaURL = wikipediaURL
    }
}

struct CountryD: Identifiable, Codable {
    let id = UUID()
    
    var name: String
    var capital: String
    var continent: String
    var flag: String
    var lang: [String]
    var population: Int
    var visited: Bool = false
    var culture: [Info]
    var cities: [Info]
    var nature: [Info]
}

// MARK: - Dane

class CountryRepository {
    static let countries: [CountryD] = [
        
        // 1. POLSKA 🇵🇱
        CountryD(
            name: "Polska",
            capital: "Warszawa",
            continent: "Europa",
            flag: "🇵🇱",
            lang: ["Polski"],
            population: 38_000_000,
            visited: true,
            culture: [
                Info(name: "Zamek Królewski na Wawelu",
                     description: "Historyczna siedziba królów Polski w Krakowie, symbol polskiej państwowości i kultury.",
                     imageURL: "https://source.unsplash.com/featured/?wawel,castle",
                     wikipediaURL: "https://pl.wikipedia.org/wiki/Zamek_Kr%C3%B3lewski_na_Wawelu"),
                Info(name: "Pierogi",
                     description: "Tradycyjne danie kuchni polskiej, znane i lubiane na całym świecie.",
                     imageURL: "https://source.unsplash.com/featured/?dumplings,food",
                     wikipediaURL: "https://pl.wikipedia.org/wiki/Pierogi")
            ],
            cities: [
                Info(name: "Kraków",
                     description: "Dawna stolica Polski z pięknym Starym Miastem wpisanym na listę UNESCO.",
                     imageURL: "https://source.unsplash.com/featured/?krakow,market",
                     wikipediaURL: "https://pl.wikipedia.org/wiki/Krak%C3%B3w"),
                Info(name: "Gdańsk",
                     description: "Nadmorskie miasto o bogatej historii hanzeatyckiej, miejsce narodzin Solidarności.",
                     imageURL: "https://source.unsplash.com/featured/?gdansk,oldtown",
                     wikipediaURL: "https://pl.wikipedia.org/wiki/Gda%C5%84sk"),
                Info(name: "Zakopane",
                     description: "Zimowa stolica Polski położona u podnóża Tatr.",
                     imageURL: "https://source.unsplash.com/featured/?zakopane,mountains",
                     wikipediaURL: "https://pl.wikipedia.org/wiki/Zakopane")
            ],
            nature: [
                Info(name: "Puszcza Białowieska",
                     description: "Ostatni fragment lasu pierwotnego na Niżu Europejskim, dom żubra.",
                     imageURL: "https://source.unsplash.com/featured/?forest,bison",
                     wikipediaURL: "https://pl.wikipedia.org/wiki/Puszcza_Bia%C5%82owieska"),
                Info(name: "Morskie Oko",
                     description: "Największe jezioro w Tatrach, otoczone szczytami górskimi.",
                     imageURL: "https://source.unsplash.com/featured/?lake,mountains",
                     wikipediaURL: "https://pl.wikipedia.org/wiki/Morskie_Oko"),
                Info(name: "Wydmy w Słowińskim PN",
                     description: "Ruchome wydmy nad Morzem Bałtyckim, unikalny krajobraz w skali Europy.",
                     imageURL: "https://source.unsplash.com/featured/?dunes,sand",
                     wikipediaURL: "https://pl.wikipedia.org/wiki/S%C5%82owi%C5%84ski_Park_Narodowy")
            ]
        ),
        
        // 2. JAPONIA 🇯🇵
        CountryD(
            name: "Japonia",
            capital: "Tokio",
            continent: "Azja",
            flag: "🇯🇵",
            lang: ["Japoński"],
            population: 125_800_000,
            visited: false,
            culture: [
                Info(name: "Świątynia Senso-ji",
                     description: "Najstarsza świątynia buddyjska w Tokio, symbol tradycyjnej kultury Japonii.",
                     imageURL: "https://source.unsplash.com/featured/?temple,japan",
                     wikipediaURL: "https://pl.wikipedia.org/wiki/Sens%C5%8D-ji"),
                Info(name: "Sushi",
                     description: "Potrawa japońska złożona z gotowanego ryżu zaprawionego octem ryżowym oraz dodatków.",
                     imageURL: "https://source.unsplash.com/featured/?sushi",
                     wikipediaURL: "https://pl.wikipedia.org/wiki/Sushi")
            ],
            cities: [
                Info(name: "Tokio",
                     description: "Stolica i największa metropolia świata, łącząca nowoczesność z tradycją.",
                     imageURL: "https://source.unsplash.com/featured/?tokyo,city",
                     wikipediaURL: "https://pl.wikipedia.org/wiki/Tokio"),
                Info(name: "Kioto",
                     description: "Miasto tysiąca świątyń, dawna stolica cesarska znana z dzielnic gejsz.",
                     imageURL: "https://source.unsplash.com/featured/?kyoto",
                     wikipediaURL: "https://pl.wikipedia.org/wiki/Kioto"),
                Info(name: "Osaka",
                     description: "Miasto znane z nowoczesnej architektury, życia nocnego i ulicznego jedzenia.",
                     imageURL: "https://source.unsplash.com/featured/?osaka",
                     wikipediaURL: "https://pl.wikipedia.org/wiki/Osaka")
            ],
            nature: [
                Info(name: "Góra Fudżi",
                     description: "Czynny stratowulkan i najwyższy szczyt Japonii, święta góra.",
                     imageURL: "https://source.unsplash.com/featured/?mountfuji",
                     wikipediaURL: "https://pl.wikipedia.org/wiki/Fud%C5%BCi"),
                Info(name: "Las Bambusowy Arashiyama",
                     description: "Malownicza aleja w Kioto otoczona wysokimi bambusami.",
                     imageURL: "https://source.unsplash.com/featured/?bamboo,forest",
                     wikipediaURL: "https://en.wikipedia.org/wiki/Arashiyama"),
                Info(name: "Kwiaty Wiśni (Sakura)",
                     description: "Okres kwitnienia wiśni to narodowe święto podziwiania przyrody.",
                     imageURL: "https://source.unsplash.com/featured/?cherryblossom",
                     wikipediaURL: "https://pl.wikipedia.org/wiki/Hanami")
            ]
        ),

        // 3. WŁOCHY 🇮🇹
        CountryD(
            name: "Włochy",
            capital: "Rzym",
            continent: "Europa",
            flag: "🇮🇹",
            lang: ["Włoski"],
            population: 59_000_000,
            visited: false,
            culture: [
                Info(name: "Koloseum",
                     description: "Antyczny amfiteatr w Rzymie, jeden z cudów świata.",
                     imageURL: "https://source.unsplash.com/featured/?colosseum",
                     wikipediaURL: "https://pl.wikipedia.org/wiki/Koloseum"),
                Info(name: "Pizza",
                     description: "Danie kuchni włoskiej, szeroko rozpowszechnione na całym świecie.",
                     imageURL: "https://source.unsplash.com/featured/?pizza",
                     wikipediaURL: "https://pl.wikipedia.org/wiki/Pizza")
            ],
            cities: [
                Info(name: "Rzym",
                     description: "Wieczne Miasto, pełne zabytków starożytności i siedziba Watykanu.",
                     imageURL: "https://source.unsplash.com/featured/?rome",
                     wikipediaURL: "https://pl.wikipedia.org/wiki/Rzym"),
                Info(name: "Wenecja",
                     description: "Miasto na wodzie, słynące z kanałów, mostów i karnawału.",
                     imageURL: "https://source.unsplash.com/featured/?venice",
                     wikipediaURL: "https://pl.wikipedia.org/wiki/Wenecja"),
                Info(name: "Florencja",
                     description: "Kolebka renesansu, miasto sztuki i architektury.",
                     imageURL: "https://source.unsplash.com/featured/?florence",
                     wikipediaURL: "https://pl.wikipedia.org/wiki/Florencja")
            ],
            nature: [
                Info(name: "Dolomity",
                     description: "Pasmo górskie w Alpach, znane z niesamowitych formacji skalnych.",
                     imageURL: "https://source.unsplash.com/featured/?dolomites",
                     wikipediaURL: "https://pl.wikipedia.org/wiki/Dolomity"),
                Info(name: "Wybrzeże Amalfi",
                     description: "Malowniczy odcinek wybrzeża z klifami i kolorowymi miasteczkami.",
                     imageURL: "https://source.unsplash.com/featured/?amalfi",
                     wikipediaURL: "https://pl.wikipedia.org/wiki/Wybrze%C5%BCe_Amalfita%C5%84skie"),
                Info(name: "Etna",
                     description: "Czynny stratowulkan na Sycylii, najwyższy w Europie.",
                     imageURL: "https://source.unsplash.com/featured/?volcano,etna",
                     wikipediaURL: "https://pl.wikipedia.org/wiki/Etna")
            ]
        ),

        // 4. STANY ZJEDNOCZONE 🇺🇸
        CountryD(
            name: "Stany Zjednoczone",
            capital: "Waszyngton",
            continent: "Ameryka Północna",
            flag: "🇺🇸",
            lang: ["Angielski"],
            population: 331_000_000,
            visited: false,
            culture: [
                Info(name: "Statua Wolności",
                     description: "Symbol wolności i demokracji, dar od narodu francuskiego.",
                     imageURL: "https://source.unsplash.com/featured/?statueofliberty",
                     wikipediaURL: "https://pl.wikipedia.org/wiki/Statua_Wolno%C5%9Bci"),
                Info(name: "Hollywood",
                     description: "Dzielnica w Los Angeles, światowe centrum przemysłu filmowego.",
                     imageURL: "https://source.unsplash.com/featured/?hollywood",
                     wikipediaURL: "https://pl.wikipedia.org/wiki/Hollywood")
            ],
            cities: [
                Info(name: "Nowy Jork",
                     description: "Miasto, które nigdy nie śpi, centrum finansowe i kulturalne świata.",
                     imageURL: "https://source.unsplash.com/featured/?nyc",
                     wikipediaURL: "https://pl.wikipedia.org/wiki/Nowy_Jork"),
                Info(name: "Los Angeles",
                     description: "Miasto aniołów, znane z plaż, celebrytów i przemysłu rozrywkowego.",
                     imageURL: "https://source.unsplash.com/featured/?losangeles",
                     wikipediaURL: "https://pl.wikipedia.org/wiki/Los_Angeles"),
                Info(name: "Las Vegas",
                     description: "Światowa stolica hazardu i rozrywki na pustyni w Nevadzie.",
                     imageURL: "https://source.unsplash.com/featured/?lasvegas",
                     wikipediaURL: "https://pl.wikipedia.org/wiki/Las_Vegas")
            ],
            nature: [
                Info(name: "Wielki Kanion",
                     description: "Ogromny przełom rzeki Kolorado, jeden z cudów natury.",
                     imageURL: "https://source.unsplash.com/featured/?grandcanyon",
                     wikipediaURL: "https://pl.wikipedia.org/wiki/Wielki_Kanion_Kolorado"),
                Info(name: "Park Yellowstone",
                     description: "Najstarszy park narodowy na świecie, słynący z gejzerów.",
                     imageURL: "https://source.unsplash.com/featured/?yellowstone",
                     wikipediaURL: "https://pl.wikipedia.org/wiki/Park_Narodowy_Yellowstone"),
                Info(name: "Yosemite",
                     description: "Park znany z granitowych urwisk, wodospadów i sekwoi.",
                     imageURL: "https://source.unsplash.com/featured/?yosemite",
                     wikipediaURL: "https://pl.wikipedia.org/wiki/Park_Narodowy_Yosemite")
            ]
        ),

        // 5. EGIPT 🇪🇬
        CountryD(
            name: "Egipt",
            capital: "Kair",
            continent: "Afryka",
            flag: "🇪🇬",
            lang: ["Arabski"],
            population: 104_000_000,
            visited: false,
            culture: [
                Info(name: "Piramidy w Gizie",
                     description: "Grobowce faraonów, jedyny z siedmiu cudów świata starożytnego, który przetrwał.",
                     imageURL: "https://source.unsplash.com/featured/?pyramids",
                     wikipediaURL: "https://pl.wikipedia.org/wiki/Piramidy_w_Gizie"),
                Info(name: "Hieroglify",
                     description: "Starożytne pismo egipskie, klucz do zrozumienia historii cywilizacji.",
                     imageURL: "https://source.unsplash.com/featured/?hieroglyphs",
                     wikipediaURL: "https://pl.wikipedia.org/wiki/Pismo_hieroglificzne")
            ],
            cities: [
                Info(name: "Kair",
                     description: "Chaotyczna i fascynująca stolica, dom Muzeum Egipskiego.",
                     imageURL: "https://source.unsplash.com/featured/?cairo",
                     wikipediaURL: "https://pl.wikipedia.org/wiki/Kair"),
                Info(name: "Luksor",
                     description: "Często nazywany największym muzeum na wolnym powietrzu.",
                     imageURL: "https://source.unsplash.com/featured/?luxor",
                     wikipediaURL: "https://pl.wikipedia.org/wiki/Luksor"),
                Info(name: "Hurghada",
                     description: "Popularny kurort turystyczny nad Morzem Czerwonym.",
                     imageURL: "https://source.unsplash.com/featured/?hurghada",
                     wikipediaURL: "https://pl.wikipedia.org/wiki/Hurghada")
            ],
            nature: [
                Info(name: "Rzeka Nil",
                     description: "Najdłuższa rzeka świata, życiodajna arteria Egiptu.",
                     imageURL: "https://source.unsplash.com/featured/?nileriver",
                     wikipediaURL: "https://pl.wikipedia.org/wiki/Nil"),
                Info(name: "Morze Czerwone",
                     description: "Znane z przepięknych raf koralowych i bogatego życia podwodnego.",
                     imageURL: "https://source.unsplash.com/featured/?redsea,coral",
                     wikipediaURL: "https://pl.wikipedia.org/wiki/Morze_Czerwone"),
                Info(name: "Pustynia Biała",
                     description: "Park narodowy słynący z wapiennych formacji skalnych o białym kolorze.",
                     imageURL: "https://source.unsplash.com/featured/?whitedesert",
                     wikipediaURL: "https://pl.wikipedia.org/wiki/Park_Narodowy_Bia%C5%82a_Pustynia")
            ]
        ),
        
        // 6. BRAZYLIA 🇧🇷
        CountryD(
            name: "Brazylia",
            capital: "Brasília",
            continent: "Ameryka Południowa",
            flag: "🇧🇷",
            lang: ["Portugalski"],
            population: 214_000_000,
            visited: false,
            culture: [
                Info(name: "Karnawał w Rio",
                     description: "Największy karnawał na świecie, słynący z samby i barwnych parad.",
                     imageURL: "https://source.unsplash.com/featured/?carnival,brazil",
                     wikipediaURL: "https://pl.wikipedia.org/wiki/Karnawa%C5%82_w_Rio_de_Janeiro"),
                Info(name: "Chrystus Odkupiciel",
                     description: "Gigantyczny pomnik Jezusa na szczycie góry Corcovado w Rio.",
                     imageURL: "https://source.unsplash.com/featured/?christredeemer",
                     wikipediaURL: "https://pl.wikipedia.org/wiki/Chrystus_Odkupiciel_(pomnik)")
            ],
            cities: [
                Info(name: "Rio de Janeiro",
                     description: "Miasto znane z plaż Copacabana i Ipanema oraz niesamowitych widoków.",
                     imageURL: "https://source.unsplash.com/featured/?riodejaneiro",
                     wikipediaURL: "https://pl.wikipedia.org/wiki/Rio_de_Janeiro"),
                Info(name: "Sāo Paulo",
                     description: "Największe miasto Ameryki Południowej, centrum finansowe.",
                     imageURL: "https://source.unsplash.com/featured/?saopaulo",
                     wikipediaURL: "https://pl.wikipedia.org/wiki/S%C3%A3o_Paulo"),
                Info(name: "Salvador",
                     description: "Miasto o silnych wpływach kultury afrykańskiej i kolonialnej architekturze.",
                     imageURL: "https://source.unsplash.com/featured/?salvador,brazil",
                     wikipediaURL: "https://pl.wikipedia.org/wiki/Salvador_(Brazylia)")
            ],
            nature: [
                Info(name: "Amazonia",
                     description: "Największy las deszczowy na świecie, płuca Ziemi.",
                     imageURL: "https://source.unsplash.com/featured/?amazon,rainforest",
                     wikipediaURL: "https://pl.wikipedia.org/wiki/Amazonia"),
                Info(name: "Wodospady Iguazu",
                     description: "Potężny kompleks wodospadów na granicy z Argentyną.",
                     imageURL: "https://source.unsplash.com/featured/?iguazufalls",
                     wikipediaURL: "https://pl.wikipedia.org/wiki/Wodospad_Iguaz%C3%BA"),
                Info(name: "Pantanal",
                     description: "Rozległa równina aluwialna, idealne miejsce do obserwacji dzikich zwierząt.",
                     imageURL: "https://source.unsplash.com/featured/?pantanal",
                     wikipediaURL: "https://pl.wikipedia.org/wiki/Pantanal")
            ]
        )
    ]
}
