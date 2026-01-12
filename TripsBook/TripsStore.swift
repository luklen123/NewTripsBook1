import Foundation
import SwiftUI
import Combine

class TripsStore: ObservableObject {
    
    @Published var countries: [Country] = [
            Country(name: "Albania", continent: "Europa", flag: "🇦🇱", visited: true),
            Country(name: "Andora", continent: "Europa", flag: "🇦🇩", visited: false),
            Country(name: "Austria", continent: "Europa", flag: "🇦🇹", visited: false),
            Country(name: "Belgia", continent: "Europa", flag: "🇧🇪", visited: false),
            Country(name: "Białoruś", continent: "Europa", flag: "🇧🇾", visited: false),
            Country(name: "Bośnia i Hercegowina", continent: "Europa", flag: "🇧🇦", visited: false),
            Country(name: "Bułgaria", continent: "Europa", flag: "🇧🇬", visited: false),
            Country(name: "Chorwacja", continent: "Europa", flag: "🇭🇷", visited: false),
            Country(name: "Czarnogóra", continent: "Europa", flag: "🇲🇪", visited: false),
            Country(name: "Czechy", continent: "Europa", flag: "🇨🇿", visited: false),
            Country(name: "Dania", continent: "Europa", flag: "🇩🇰", visited: false),
            Country(name: "Estonia", continent: "Europa", flag: "🇪🇪", visited: false),
            Country(name: "Finlandia", continent: "Europa", flag: "🇫🇮", visited: false),
            Country(name: "Francja", continent: "Europa", flag: "🇫🇷", visited: false),
            Country(name: "Grecja", continent: "Europa", flag: "🇬🇷", visited: false),
            Country(name: "Hiszpania", continent: "Europa", flag: "🇪🇸", visited: false),
            Country(name: "Holandia", continent: "Europa", flag: "🇳🇱", visited: false),
            Country(name: "Irlandia", continent: "Europa", flag: "🇮🇪", visited: false),
            Country(name: "Islandia", continent: "Europa", flag: "🇮🇸", visited: false),
            Country(name: "Liechtenstein", continent: "Europa", flag: "🇱🇮", visited: false),
            Country(name: "Litwa", continent: "Europa", flag: "🇱🇹", visited: false),
            Country(name: "Luksemburg", continent: "Europa", flag: "🇱🇺", visited: false),
            Country(name: "Łotwa", continent: "Europa", flag: "🇱🇻", visited: false),
            Country(name: "Malta", continent: "Europa", flag: "🇲🇹", visited: false),
            Country(name: "Mołdawia", continent: "Europa", flag: "🇲🇩", visited: false),
            Country(name: "Monako", continent: "Europa", flag: "🇲🇨", visited: false),
            Country(name: "Niemcy", continent: "Europa", flag: "🇩🇪", visited: false),
            Country(name: "Norwegia", continent: "Europa", flag: "🇳🇴", visited: false),
            Country(name: "Polska", continent: "Europa", flag: "🇵🇱", visited: false),
            Country(name: "Portugalia", continent: "Europa", flag: "🇵🇹", visited: false),
            Country(name: "Rumunia", continent: "Europa", flag: "🇷🇴", visited: false),
            Country(name: "San Marino", continent: "Europa", flag: "🇸🇲", visited: false),
            Country(name: "Serbia", continent: "Europa", flag: "🇷🇸", visited: false),
            Country(name: "Słowacja", continent: "Europa", flag: "🇸🇰", visited: false),
            Country(name: "Słowenia", continent: "Europa", flag: "🇸🇮", visited: false),
            Country(name: "Szwajcaria", continent: "Europa", flag: "🇨🇭", visited: false),
            Country(name: "Szwecja", continent: "Europa", flag: "🇸🇪", visited: false),
            Country(name: "Ukraina", continent: "Europa", flag: "🇺🇦", visited: false),
            Country(name: "Watykan", continent: "Europa", flag: "🇻🇦", visited: false),
            Country(name: "Wielka Brytania", continent: "Europa", flag: "🇬🇧", visited: false),
            Country(name: "Węgry", continent: "Europa", flag: "🇭🇺", visited: false),
            Country(name: "Włochy", continent: "Europa", flag: "🇮🇹", visited: false),
            Country(name: "Afganistan", continent: "Azja", flag: "🇦🇫", visited: false),
            Country(name: "Arabia Saudyjska", continent: "Azja", flag: "🇸🇦", visited: false),
            Country(name: "Armenia", continent: "Azja", flag: "🇦🇲", visited: false),
            Country(name: "Azerbejdżan", continent: "Azja", flag: "🇦🇿", visited: false),
            Country(name: "Bahrajn", continent: "Azja", flag: "🇧🇭", visited: false),
            Country(name: "Bangladesz", continent: "Azja", flag: "🇧🇩", visited: false),
            Country(name: "Bhutan", continent: "Azja", flag: "🇧🇹", visited: false),
            Country(name: "Brunei", continent: "Azja", flag: "🇧🇳", visited: false),
            Country(name: "Chiny", continent: "Azja", flag: "🇨🇳", visited: false),
            Country(name: "Filipiny", continent: "Azja", flag: "🇵🇭", visited: false),
            Country(name: "Gruzja", continent: "Azja", flag: "🇬🇪", visited: false),
            Country(name: "Indie", continent: "Azja", flag: "🇮🇳", visited: false),
            Country(name: "Indonezja", continent: "Azja", flag: "🇮🇩", visited: false),
            Country(name: "Iran", continent: "Azja", flag: "🇮🇷", visited: false),
            Country(name: "Irak", continent: "Azja", flag: "🇮🇶", visited: false),
            Country(name: "Izrael", continent: "Azja", flag: "🇮🇱", visited: false),
            Country(name: "Japonia", continent: "Azja", flag: "🇯🇵", visited: false),
            Country(name: "Jemen", continent: "Azja", flag: "🇾🇪", visited: false),
            Country(name: "Jordania", continent: "Azja", flag: "🇯🇴", visited: false),
            Country(name: "Kambodża", continent: "Azja", flag: "🇰🇭", visited: false),
            Country(name: "Katar", continent: "Azja", flag: "🇶🇦", visited: false),
            Country(name: "Kazachstan", continent: "Azja", flag: "🇰🇿", visited: false),
            Country(name: "Kirgistan", continent: "Azja", flag: "🇰🇬", visited: false),
            Country(name: "Korea Południowa", continent: "Azja", flag: "🇰🇷", visited: false),
            Country(name: "Korea Północna", continent: "Azja", flag: "🇰🇵", visited: false),
            Country(name: "Kuwejt", continent: "Azja", flag: "🇰🇼", visited: false),
            Country(name: "Laos", continent: "Azja", flag: "🇱🇦", visited: false),
            Country(name: "Liban", continent: "Azja", flag: "🇱🇧", visited: false),
            Country(name: "Malezja", continent: "Azja", flag: "🇲🇾", visited: false),
            Country(name: "Malediwy", continent: "Azja", flag: "🇲🇻", visited: false),
            Country(name: "Mjanma", continent: "Azja", flag: "🇲🇲", visited: false),
            Country(name: "Mongolia", continent: "Azja", flag: "🇲🇳", visited: false),
            Country(name: "Nepal", continent: "Azja", flag: "🇳🇵", visited: false),
            Country(name: "Oman", continent: "Azja", flag: "🇴🇲", visited: false),
            Country(name: "Pakistan", continent: "Azja", flag: "🇵🇰", visited: false),
            Country(name: "Singapur", continent: "Azja", flag: "🇸🇬", visited: false),
            Country(name: "Sri Lanka", continent: "Azja", flag: "🇱🇰", visited: false),
            Country(name: "Syria", continent: "Azja", flag: "🇸🇾", visited: false),
            Country(name: "Tadżykistan", continent: "Azja", flag: "🇹🇯", visited: false),
            Country(name: "Tajlandia", continent: "Azja", flag: "🇹🇭", visited: false),
            Country(name: "Timor Wschodni", continent: "Azja", flag: "🇹🇱", visited: false),
            Country(name: "Turcja", continent: "Azja", flag: "🇹🇷", visited: false),
            Country(name: "Turkmenistan", continent: "Azja", flag: "🇹🇲", visited: false),
            Country(name: "Uzbekistan", continent: "Azja", flag: "🇺🇿", visited: false),
            Country(name: "Wietnam", continent: "Azja", flag: "🇻🇳", visited: false),
            Country(name: "Algieria", continent: "Afryka", flag: "🇩🇿", visited: false),
            Country(name: "Angola", continent: "Afryka", flag: "🇦🇴", visited: false),
            Country(name: "Benin", continent: "Afryka", flag: "🇧🇯", visited: false),
            Country(name: "Botswana", continent: "Afryka", flag: "🇧🇼", visited: false),
            Country(name: "Burkina Faso", continent: "Afryka", flag: "🇧🇫", visited: false),
            Country(name: "Burundi", continent: "Afryka", flag: "🇧🇮", visited: false),
            Country(name: "Czad", continent: "Afryka", flag: "🇹🇩", visited: false),
            Country(name: "Demokratyczna Republika Konga", continent: "Afryka", flag: "🇨🇩", visited: false),
            Country(name: "Dżibuti", continent: "Afryka", flag: "🇩🇯", visited: false),
            Country(name: "Egipt", continent: "Afryka", flag: "🇪🇬", visited: false),
            Country(name: "Erytrea", continent: "Afryka", flag: "🇪🇷", visited: false),
            Country(name: "Etiopia", continent: "Afryka", flag: "🇪🇹", visited: false),
            Country(name: "Gabon", continent: "Afryka", flag: "🇬🇦", visited: false),
            Country(name: "Gambia", continent: "Afryka", flag: "🇬🇲", visited: false),
            Country(name: "Ghana", continent: "Afryka", flag: "🇬🇭", visited: false),
            Country(name: "Gwinea", continent: "Afryka", flag: "🇬🇳", visited: false),
            Country(name: "Gwinea Bissau", continent: "Afryka", flag: "🇬🇼", visited: false),
            Country(name: "Gwinea Równikowa", continent: "Afryka", flag: "🇬🇶", visited: false),
            Country(name: "Kamerun", continent: "Afryka", flag: "🇨🇲", visited: false),
            Country(name: "Kenia", continent: "Afryka", flag: "🇰🇪", visited: false),
            Country(name: "Komory", continent: "Afryka", flag: "🇰🇲", visited: false),
            Country(name: "Kongo", continent: "Afryka", flag: "🇨🇬", visited: false),
            Country(name: "Lesotho", continent: "Afryka", flag: "🇱🇸", visited: false),
            Country(name: "Liberia", continent: "Afryka", flag: "🇱🇷", visited: false),
            Country(name: "Libia", continent: "Afryka", flag: "🇱🇾", visited: false),
            Country(name: "Madagaskar", continent: "Afryka", flag: "🇲🇬", visited: false),
            Country(name: "Malawi", continent: "Afryka", flag: "🇲🇼", visited: false),
            Country(name: "Mali", continent: "Afryka", flag: "🇲🇱", visited: false),
            Country(name: "Maroko", continent: "Afryka", flag: "🇲🇦", visited: false),
            Country(name: "Mauretania", continent: "Afryka", flag: "🇲🇷", visited: false),
            Country(name: "Mauritius", continent: "Afryka", flag: "🇲🇺", visited: false),
            Country(name: "Mozambik", continent: "Afryka", flag: "🇲🇿", visited: false),
            Country(name: "Namibia", continent: "Afryka", flag: "🇳🇦", visited: false),
            Country(name: "Niger", continent: "Afryka", flag: "🇳🇪", visited: false),
            Country(name: "Nigeria", continent: "Afryka", flag: "🇳🇬", visited: false),
            Country(name: "RPA", continent: "Afryka", flag: "🇿🇦", visited: false),
            Country(name: "Rwanda", continent: "Afryka", flag: "🇷🇼", visited: false),
            Country(name: "Senegal", continent: "Afryka", flag: "🇸🇳", visited: false),
            Country(name: "Seszele", continent: "Afryka", flag: "🇸🇨", visited: false),
            Country(name: "Sierra Leone", continent: "Afryka", flag: "🇸🇱", visited: false),
            Country(name: "Somalia", continent: "Afryka", flag: "🇸🇴", visited: false),
            Country(name: "Sudan", continent: "Afryka", flag: "🇸🇩", visited: false),
            Country(name: "Sudan Południowy", continent: "Afryka", flag: "🇸🇸", visited: false),
            Country(name: "Tanzania", continent: "Afryka", flag: "🇹🇿", visited: false),
            Country(name: "Togo", continent: "Afryka", flag: "🇹🇬", visited: false),
            Country(name: "Tunezja", continent: "Afryka", flag: "🇹🇳", visited: false),
            Country(name: "Uganda", continent: "Afryka", flag: "🇺🇬", visited: false),
            Country(name: "Wybrzeże Kości Słoniowej", continent: "Afryka", flag: "🇨🇮", visited: false),
            Country(name: "Zambia", continent: "Afryka", flag: "🇿🇲", visited: false),
            Country(name: "Zimbabwe", continent: "Afryka", flag: "🇿🇼", visited: false),
            Country(name: "Antigua i Barbuda", continent: "Ameryka Płn.", flag: "🇦🇬", visited: false),
            Country(name: "Bahamy", continent: "Ameryka Płn.", flag: "🇧🇸", visited: false),
            Country(name: "Barbados", continent: "Ameryka Płn.", flag: "🇧🇧", visited: false),
            Country(name: "Belize", continent: "Ameryka Płn.", flag: "🇧🇿", visited: false),
            Country(name: "Dominika", continent: "Ameryka Płn.", flag: "🇩🇲", visited: false),
            Country(name: "Dominikana", continent: "Ameryka Płn.", flag: "🇩🇴", visited: false),
            Country(name: "Grenada", continent: "Ameryka Płn.", flag: "🇬🇩", visited: false),
            Country(name: "Gwatemala", continent: "Ameryka Płn.", flag: "🇬🇹", visited: false),
            Country(name: "Haiti", continent: "Ameryka Płn.", flag: "🇭🇹", visited: false),
            Country(name: "Honduras", continent: "Ameryka Płn.", flag: "🇭🇳", visited: false),
            Country(name: "Jamajka", continent: "Ameryka Płn.", flag: "🇯🇲", visited: false),
            Country(name: "Kanada", continent: "Ameryka Płn.", flag: "🇨🇦", visited: false),
            Country(name: "Kostaryka", continent: "Ameryka Płn.", flag: "🇨🇷", visited: false),
            Country(name: "Kuba", continent: "Ameryka Płn.", flag: "🇨🇺", visited: false),
            Country(name: "Meksyk", continent: "Ameryka Płn.", flag: "🇲🇽", visited: false),
            Country(name: "Nikaragua", continent: "Ameryka Płn.", flag: "🇳🇮", visited: false),
            Country(name: "Panama", continent: "Ameryka Płn.", flag: "🇵🇦", visited: false),
            Country(name: "Salwador", continent: "Ameryka Płn.", flag: "🇸🇻", visited: false),
            Country(name: "Saint Kitts i Nevis", continent: "Ameryka Płn.", flag: "🇰🇳", visited: false),
            Country(name: "Saint Lucia", continent: "Ameryka Płn.", flag: "🇱🇨", visited: false),
            Country(name: "Saint Vincent i Grenadyny", continent: "Ameryka Płn.", flag: "🇻🇨", visited: false),
            Country(name: "Trynidad i Tobago", continent: "Ameryka Płn.", flag: "🇹🇹", visited: false),
            Country(name: "Stany Zjednoczone", continent: "Ameryka Płn.", flag: "🇺🇸", visited: false),
            Country(name: "Argentyna", continent: "Ameryka Płd.", flag: "🇦🇷", visited: false),
            Country(name: "Boliwia", continent: "Ameryka Płd.", flag: "🇧🇴", visited: false),
            Country(name: "Brazylia", continent: "Ameryka Płd.", flag: "🇧🇷", visited: false),
            Country(name: "Chile", continent: "Ameryka Płd.", flag: "🇨🇱", visited: false),
            Country(name: "Kolumbia", continent: "Ameryka Płd.", flag: "🇨🇴", visited: false),
            Country(name: "Ekwador", continent: "Ameryka Płd.", flag: "🇪🇨", visited: false),
            Country(name: "Gujana", continent: "Ameryka Płd.", flag: "🇬🇾", visited: false),
            Country(name: "Paragwaj", continent: "Ameryka Płd.", flag: "🇵🇾", visited: false),
            Country(name: "Peru", continent: "Ameryka Płd.", flag: "🇵🇪", visited: false),
            Country(name: "Surinam", continent: "Ameryka Płd.", flag: "🇸🇷", visited: false),
            Country(name: "Urugwaj", continent: "Ameryka Płd.", flag: "🇺🇾", visited: false),
            Country(name: "Wenezuela", continent: "Ameryka Płd.", flag: "🇻🇪", visited: false),
            Country(name: "Australia", continent: "Oceania", flag: "🇦🇺", visited: false),
            Country(name: "Fidżi", continent: "Oceania", flag: "🇫🇯", visited: false),
            Country(name: "Kiribati", continent: "Oceania", flag: "🇰🇮", visited: false),
            Country(name: "Mikronezja", continent: "Oceania", flag: "🇫🇲", visited: false),
            Country(name: "Nauru", continent: "Oceania", flag: "🇳🇷", visited: false),
            Country(name: "Nowa Zelandia", continent: "Oceania", flag: "🇳🇿", visited: false),
            Country(name: "Palau", continent: "Oceania", flag: "🇵🇼", visited: false),
            Country(name: "Papua-Nowa Gwinea", continent: "Oceania", flag: "🇵🇬", visited: false),
            Country(name: "Samoa", continent: "Oceania", flag: "🇼🇸", visited: false),
            Country(name: "Tonga", continent: "Oceania", flag: "🇹🇴", visited: false),
            Country(name: "Tuvalu", continent: "Oceania", flag: "🇹🇻", visited: false),
            Country(name: "Vanuatu", continent: "Oceania", flag: "🇻🇺", visited: false)
        ]
    
    @Published var countryDetails: [CountryD] = [
        // 1. ALBANIA 🇦🇱
        // 1. ALBANIA 🇦🇱
                CountryD(
                    name: "Albania",
                    capital: "Tirana",
                    continent: "Europa",
                    currency: "Lek (ALL)",
                    flag: "🇦🇱",
                    lang: ["Albański"],
                    population: 2_800_000,
                    culture: [
                        Info(name: "Bunkry", description: "Tysiące betonowych bunkrów z czasów komunistycznych.", imageURL: "https://loremflickr.com/800/600/bunker,albania", wikipediaURL: "https://pl.wikipedia.org/wiki/Bunkry_w_Albanii"),
                        Info(name: "Iso-polifonia", description: "Tradycyjny albański śpiew ludowy (UNESCO).", imageURL: "https://loremflickr.com/800/600/choir,folk", wikipediaURL: "https://pl.wikipedia.org/wiki/Alba%C5%84ska_muzyka_ludowa")
                    ],
                    cities: [
                        Info(name: "Tirana", description: "Kolorowa stolica z Placem Skanderbega.", imageURL: "https://loremflickr.com/800/600/tirana", wikipediaURL: "https://pl.wikipedia.org/wiki/Tirana"),
                        Info(name: "Berat", description: "Miasto tysiąca okien, wpisane na listę UNESCO.", imageURL: "https://loremflickr.com/800/600/berat", wikipediaURL: "https://pl.wikipedia.org/wiki/Berat"),
                        Info(name: "Ksamil", description: "Nadmorski kurort zwany 'Malediwami Europy'.", imageURL: "https://loremflickr.com/800/600/ksamil", wikipediaURL: "https://pl.wikipedia.org/wiki/Ksamil")
                    ],
                    nature: [
                        Info(name: "Góry Przeklęte", description: "Dzika część Alp Albańskich.", imageURL: "https://loremflickr.com/800/600/mountains,albania", wikipediaURL: "https://pl.wikipedia.org/wiki/G%C3%B3ry_P%C3%B3%C5%82nocnoalba%C5%84skie"),
                        Info(name: "Blue Eye", description: "Błękitne oko – źródło wybijające z głębin.", imageURL: "https://loremflickr.com/800/600/blueeye,spring", wikipediaURL: "https://pl.wikipedia.org/wiki/Syri_i_Kalt%C3%ABr"),
                        Info(name: "Jezioro Ochrydzkie", description: "Jedno z najstarszych jezior na świecie.", imageURL: "https://loremflickr.com/800/600/lakeohrid", wikipediaURL: "https://pl.wikipedia.org/wiki/Jezioro_Ochrydzkie")
                    ]
                ),

                // 2. ANDORA 🇦🇩
                CountryD(
                    name: "Andora",
                    capital: "Andora",
                    continent: "Europa",
                    currency: "Euro (EUR)",
                    flag: "🇦🇩",
                    lang: ["Kataloński"],
                    population: 77_000,
                    culture: [
                        Info(name: "Casa de la Vall", description: "Historyczny dom z XVI wieku, siedziba parlamentu.", imageURL: "https://loremflickr.com/800/600/stonehouse,andorra", wikipediaURL: "https://pl.wikipedia.org/wiki/Casa_de_la_Vall"),
                        Info(name: "Romańskie Kościoły", description: "Szlak małych, kamiennych kościołów w górach.", imageURL: "https://loremflickr.com/800/600/church,stone", wikipediaURL: "https://pl.wikipedia.org/wiki/Andora")
                    ],
                    cities: [
                        Info(name: "Andora la Vella", description: "Najwyżej położona stolica w Europie.", imageURL: "https://loremflickr.com/800/600/andorralavella", wikipediaURL: "https://pl.wikipedia.org/wiki/Andora_(miasto)"),
                        Info(name: "Encamp", description: "Baza wypadowa do ośrodków narciarskich.", imageURL: "https://loremflickr.com/800/600/encamp", wikipediaURL: "https://pl.wikipedia.org/wiki/Encamp"),
                        Info(name: "Pas de la Casa", description: "Popularny kurort narciarski na granicy z Francją.", imageURL: "https://loremflickr.com/800/600/skiing,snow", wikipediaURL: "https://pl.wikipedia.org/wiki/Pas_de_la_Casa")
                    ],
                    nature: [
                        Info(name: "Pireneje", description: "Wysokie góry otaczające całe państwo.", imageURL: "https://loremflickr.com/800/600/pyrenees", wikipediaURL: "https://pl.wikipedia.org/wiki/Pireneje"),
                        Info(name: "Dolina Madriu", description: "Lodowcowa dolina wpisana na listę UNESCO.", imageURL: "https://loremflickr.com/800/600/valley,green", wikipediaURL: "https://en.wikipedia.org/wiki/Madriu-Perafita-Claror_Valley"),
                        Info(name: "Jeziora Tristaina", description: "Grupa malowniczych jezior wysokogórskich.", imageURL: "https://loremflickr.com/800/600/mountainlake", wikipediaURL: "https://pl.wikipedia.org/wiki/Andora")
                    ]
                ),

                // 3. AUSTRIA 🇦🇹
                CountryD(
                    name: "Austria",
                    capital: "Wiedeń",
                    continent: "Europa",
                    currency: "Euro (EUR)",
                    flag: "🇦🇹",
                    lang: ["Niemiecki"],
                    population: 9_000_000,
                    culture: [
                        Info(name: "Muzyka Klasyczna", description: "Ojczyzna Mozarta i walca wiedeńskiego.", imageURL: "https://loremflickr.com/800/600/violin,orchestra", wikipediaURL: "https://pl.wikipedia.org/wiki/Muzyka_Austrii"),
                        Info(name: "Pałac Schönbrunn", description: "Letnia rezydencja Habsburgów.", imageURL: "https://loremflickr.com/800/600/schonbrunn", wikipediaURL: "https://pl.wikipedia.org/wiki/Pa%C5%82ac_Sch%C3%B6nbrunn")
                    ],
                    cities: [
                        Info(name: "Wiedeń", description: "Stolica pełna pałaców i kawiarni.", imageURL: "https://loremflickr.com/800/600/vienna", wikipediaURL: "https://pl.wikipedia.org/wiki/Wiede%C5%84"),
                        Info(name: "Salzburg", description: "Miasto urodzenia Mozarta i barokowej architektury.", imageURL: "https://loremflickr.com/800/600/salzburg", wikipediaURL: "https://pl.wikipedia.org/wiki/Salzburg"),
                        Info(name: "Hallstatt", description: "Najbardziej fotogeniczna wioska nad jeziorem.", imageURL: "https://loremflickr.com/800/600/hallstatt", wikipediaURL: "https://pl.wikipedia.org/wiki/Hallstatt")
                    ],
                    nature: [
                        Info(name: "Alpy Austriackie", description: "Raj dla narciarzy i turystów.", imageURL: "https://loremflickr.com/800/600/alps,austria", wikipediaURL: "https://pl.wikipedia.org/wiki/Alpy"),
                        Info(name: "Wodospady Krimml", description: "Jedne z najwyższych wodospadów w Europie.", imageURL: "https://loremflickr.com/800/600/waterfall,krimml", wikipediaURL: "https://pl.wikipedia.org/wiki/Wodospady_Krimml"),
                        Info(name: "Grossglockner", description: "Najwyższy szczyt Austrii z lodowcem Pasterze.", imageURL: "https://loremflickr.com/800/600/grossglockner", wikipediaURL: "https://pl.wikipedia.org/wiki/Gro%C3%9Fglockner")
                    ]
                ),

                // 4. BELGIA 🇧🇪
                CountryD(
                    name: "Belgia",
                    capital: "Bruksela",
                    continent: "Europa",
                    currency: "Euro (EUR)",
                    flag: "🇧🇪",
                    lang: ["Niderlandzki", "Francuski", "Niemiecki"],
                    population: 11_500_000,
                    culture: [
                        Info(name: "Czekolada", description: "Kraj słynący z najlepszych pralin na świecie.", imageURL: "https://loremflickr.com/800/600/chocolate,praline", wikipediaURL: "https://pl.wikipedia.org/wiki/Czekolada"),
                        Info(name: "Komiksy", description: "Ojczyzna Tintina i Smerfów.", imageURL: "https://loremflickr.com/800/600/comics,tintin", wikipediaURL: "https://pl.wikipedia.org/wiki/Komiks_belgijski")
                    ],
                    cities: [
                        Info(name: "Bruksela", description: "Siedziba UE i symbolu Atomium.", imageURL: "https://loremflickr.com/800/600/brussels", wikipediaURL: "https://pl.wikipedia.org/wiki/Bruksela"),
                        Info(name: "Brugia", description: "Średniowieczne miasto kanałów (Wenecja Północy).", imageURL: "https://loremflickr.com/800/600/bruges", wikipediaURL: "https://pl.wikipedia.org/wiki/Brugia"),
                        Info(name: "Antwerpia", description: "Światowe centrum handlu diamentami.", imageURL: "https://loremflickr.com/800/600/antwerp", wikipediaURL: "https://pl.wikipedia.org/wiki/Antwerpia")
                    ],
                    nature: [
                        Info(name: "Ardeny", description: "Zalesione pasmo górskie.", imageURL: "https://loremflickr.com/800/600/forest,ardennes", wikipediaURL: "https://pl.wikipedia.org/wiki/Ardeny"),
                        Info(name: "Jaskinie Han", description: "Spektakularne jaskinie naciekowe.", imageURL: "https://loremflickr.com/800/600/cave", wikipediaURL: "https://pl.wikipedia.org/wiki/Han-sur-Lesse"),
                        Info(name: "Wybrzeże Morza Północnego", description: "Szerokie plaże z wydmami.", imageURL: "https://loremflickr.com/800/600/northsea,beach", wikipediaURL: "https://pl.wikipedia.org/wiki/Morze_P%C3%B3%C5%82nocne")
                    ]
                ),

                // 5. BIAŁORUŚ 🇧🇾
                CountryD(
                    name: "Białoruś",
                    capital: "Mińsk",
                    continent: "Europa",
                    currency: "Rubel białoruski (BYN)",
                    flag: "🇧🇾",
                    lang: ["Białoruski", "Rosyjski"],
                    population: 9_300_000,
                    culture: [
                        Info(name: "Zamek w Mirze", description: "Gotycko-renesansowy zespół zamkowy (UNESCO).", imageURL: "https://loremflickr.com/800/600/mircastle", wikipediaURL: "https://pl.wikipedia.org/wiki/Zamek_w_Mirze"),
                        Info(name: "Wyszywanka", description: "Tradycyjne hafty ludowe na odzieży.", imageURL: "https://loremflickr.com/800/600/embroidery,folk", wikipediaURL: "https://pl.wikipedia.org/wiki/Wyszywanka")
                    ],
                    cities: [
                        Info(name: "Mińsk", description: "Stolica z szerokimi prospektami i socrealizmem.", imageURL: "https://loremflickr.com/800/600/minsk", wikipediaURL: "https://pl.wikipedia.org/wiki/Mi%C5%84sk"),
                        Info(name: "Grodno", description: "Miasto z królewskimi zamkami Batorego.", imageURL: "https://loremflickr.com/800/600/grodno", wikipediaURL: "https://pl.wikipedia.org/wiki/Grodno"),
                        Info(name: "Brześć", description: "Miasto znane z Twierdzy Brzeskiej.", imageURL: "https://loremflickr.com/800/600/brest,fortress", wikipediaURL: "https://pl.wikipedia.org/wiki/Brze%C5%9B%C4%87")
                    ],
                    nature: [
                        Info(name: "Puszcza Białowieska", description: "Dom żubrów, las pierwotny.", imageURL: "https://loremflickr.com/800/600/bison", wikipediaURL: "https://pl.wikipedia.org/wiki/Puszcza_Bia%C5%82owieska"),
                        Info(name: "Jezioro Narocz", description: "Największe jezioro Białorusi.", imageURL: "https://loremflickr.com/800/600/lake,nature", wikipediaURL: "https://pl.wikipedia.org/wiki/Narocz_(jezioro)"),
                        Info(name: "Polesie", description: "Kraina bagien i mokradeł.", imageURL: "https://loremflickr.com/800/600/swamp,wetland", wikipediaURL: "https://pl.wikipedia.org/wiki/Polesie")
                    ]
                ),

                // 6. BOŚNIA I HERCEGOWINA 🇧🇦
                CountryD(
                    name: "Bośnia i Hercegowina",
                    capital: "Sarajewo",
                    continent: "Europa",
                    currency: "Marka zamienna (BAM)",
                    flag: "🇧🇦",
                    lang: ["Bośniacki", "Chorwacki", "Serbski"],
                    population: 3_300_000,
                    culture: [
                        Info(name: "Stary Most", description: "Symbol Mostaru, wpisany na listę UNESCO.", imageURL: "https://loremflickr.com/800/600/mostarbridge", wikipediaURL: "https://pl.wikipedia.org/wiki/Stary_Most_w_Mostarze"),
                        Info(name: "Kawa po bośniacku", description: "Ceremoniał picia kawy z tygielka.", imageURL: "https://loremflickr.com/800/600/bosniancoffee", wikipediaURL: "https://pl.wikipedia.org/wiki/Kawa_po_bo%C5%9Bniacku")
                    ],
                    cities: [
                        Info(name: "Sarajewo", description: "Jerozolima Europy, styk kultur wschodu i zachodu.", imageURL: "https://loremflickr.com/800/600/sarajevo", wikipediaURL: "https://pl.wikipedia.org/wiki/Sarajewo"),
                        Info(name: "Mostar", description: "Miasto słynące z mostu i architektury osmańskiej.", imageURL: "https://loremflickr.com/800/600/mostar", wikipediaURL: "https://pl.wikipedia.org/wiki/Mostar"),
                        Info(name: "Banja Luka", description: "Drugie co do wielkości miasto, pełne zieleni.", imageURL: "https://loremflickr.com/800/600/banjaluka", wikipediaURL: "https://pl.wikipedia.org/wiki/Banja_Luka")
                    ],
                    nature: [
                        Info(name: "Wodospady Kravica", description: "Spektakularny amfiteatr wodospadów.", imageURL: "https://loremflickr.com/800/600/kravicawaterfall", wikipediaURL: "https://pl.wikipedia.org/wiki/Wodospady_Kravica"),
                        Info(name: "Rzeka Neretwa", description: "Szmaragdowa rzeka płynąca przez kaniony.", imageURL: "https://loremflickr.com/800/600/river,canyon", wikipediaURL: "https://pl.wikipedia.org/wiki/Neretwa"),
                        Info(name: "Perućica", description: "Jeden z ostatnich lasów pierwotnych w Europie.", imageURL: "https://loremflickr.com/800/600/primevalforest", wikipediaURL: "https://pl.wikipedia.org/wiki/Park_Narodowy_Sutjeska")
                    ]
                ),

                // 7. BUŁGARIA 🇧🇬
                CountryD(
                    name: "Bułgaria",
                    capital: "Sofia",
                    continent: "Europa",
                    currency: "Lew (BGN)",
                    flag: "🇧🇬",
                    lang: ["Bułgarski"],
                    population: 6_900_000,
                    culture: [
                        Info(name: "Monastyr Rylski", description: "Najważniejszy klasztor prawosławny w Bułgarii.", imageURL: "https://loremflickr.com/800/600/rilamonastery", wikipediaURL: "https://pl.wikipedia.org/wiki/Monastyr_Rylski"),
                        Info(name: "Olejek Różany", description: "Bułgaria to królestwo róż.", imageURL: "https://loremflickr.com/800/600/rose,oil", wikipediaURL: "https://pl.wikipedia.org/wiki/Dolina_R%C3%B3%C5%BC")
                    ],
                    cities: [
                        Info(name: "Sofia", description: "Stolica z rzymskimi ruinami i cerkwiami.", imageURL: "https://loremflickr.com/800/600/sofia,cathedral", wikipediaURL: "https://pl.wikipedia.org/wiki/Sofia"),
                        Info(name: "Płowdiw", description: "Jedno z najstarszych miast Europy z antycznym teatrem.", imageURL: "https://loremflickr.com/800/600/plovdiv", wikipediaURL: "https://pl.wikipedia.org/wiki/P%C5%82owdiw"),
                        Info(name: "Warna", description: "Letnia stolica nad Morzem Czarnym.", imageURL: "https://loremflickr.com/800/600/varna", wikipediaURL: "https://pl.wikipedia.org/wiki/Warna")
                    ],
                    nature: [
                        Info(name: "Siedem Jezior Rilskich", description: "Polodowcowe jeziora w górach Riła.", imageURL: "https://loremflickr.com/800/600/lakes,mountains", wikipediaURL: "https://pl.wikipedia.org/wiki/Siedem_Jezior_Rilskich"),
                        Info(name: "Morze Czarne", description: "Złote plaże i ciepła woda.", imageURL: "https://loremflickr.com/800/600/blacksea,beach", wikipediaURL: "https://pl.wikipedia.org/wiki/Morze_Czarne"),
                        Info(name: "Skały w Bełogradcziku", description: "Niesamowite formacje skalne.", imageURL: "https://loremflickr.com/800/600/rocks,bulgaria", wikipediaURL: "https://en.wikipedia.org/wiki/Belogradchik_Rocks")
                    ]
                ),

                // 8. CHORWACJA 🇭🇷
                CountryD(
                    name: "Chorwacja",
                    capital: "Zagrzeb",
                    continent: "Europa",
                    currency: "Euro (EUR)",
                    flag: "🇭🇷",
                    lang: ["Chorwacki"],
                    population: 4_000_000,
                    culture: [
                        Info(name: "Mury Dubrownika", description: "Potężne fortyfikacje starego miasta.", imageURL: "https://loremflickr.com/800/600/dubrovnikwall", wikipediaURL: "https://pl.wikipedia.org/wiki/Mury_miejskie_w_Dubrowniku"),
                        Info(name: "Krawat", description: "Element stroju pochodzący od chorwackich najemników.", imageURL: "https://loremflickr.com/800/600/tie,fashion", wikipediaURL: "https://pl.wikipedia.org/wiki/Krawat")
                    ],
                    cities: [
                        Info(name: "Dubrownik", description: "Perła Adriatyku znana z Gry o Tron.", imageURL: "https://loremflickr.com/800/600/dubrovnik", wikipediaURL: "https://pl.wikipedia.org/wiki/Dubrownik"),
                        Info(name: "Split", description: "Miasto wewnątrz pałacu cesarza Dioklecjana.", imageURL: "https://loremflickr.com/800/600/split,croatia", wikipediaURL: "https://pl.wikipedia.org/wiki/Split"),
                        Info(name: "Zagrzeb", description: "Kulturalna stolica w głębi lądu.", imageURL: "https://loremflickr.com/800/600/zagreb", wikipediaURL: "https://pl.wikipedia.org/wiki/Zagrzeb")
                    ],
                    nature: [
                        Info(name: "Jeziora Plitwickie", description: "16 jezior połączonych wodospadami.", imageURL: "https://loremflickr.com/800/600/plitvice", wikipediaURL: "https://pl.wikipedia.org/wiki/Park_Narodowy_Jezior_Plitwickich"),
                        Info(name: "Wodospady Krka", description: "Kaskady rzeczne, w których można się kąpać.", imageURL: "https://loremflickr.com/800/600/krkawaterfall", wikipediaURL: "https://pl.wikipedia.org/wiki/Park_Narodowy_Krka"),
                        Info(name: "Wyspa Hvar", description: "Najbardziej słoneczna wyspa Chorwacji.", imageURL: "https://loremflickr.com/800/600/hvar", wikipediaURL: "https://pl.wikipedia.org/wiki/Hvar")
                    ]
                ),

                // 9. CYPR 🇨🇾
                CountryD(
                    name: "Cypr",
                    capital: "Nikozja",
                    continent: "Europa",
                    currency: "Euro (EUR)",
                    flag: "🇨🇾",
                    lang: ["Grecki", "Turecki"],
                    population: 1_200_000,
                    culture: [
                        Info(name: "Afrodyta", description: "Mityczne miejsce narodzin bogini miłości.", imageURL: "https://loremflickr.com/800/600/aphroditerock", wikipediaURL: "https://pl.wikipedia.org/wiki/Petra_tou_Romiou"),
                        Info(name: "Halloumi", description: "Słynny cypryjski ser do grillowania.", imageURL: "https://loremflickr.com/800/600/halloumi", wikipediaURL: "https://pl.wikipedia.org/wiki/Halloumi")
                    ],
                    cities: [
                        Info(name: "Nikozja", description: "Stolica podzielona strefą buforową.", imageURL: "https://loremflickr.com/800/600/nicosia", wikipediaURL: "https://pl.wikipedia.org/wiki/Nikozja"),
                        Info(name: "Pafos", description: "Miasto pełne antycznych mozaik.", imageURL: "https://loremflickr.com/800/600/paphos", wikipediaURL: "https://pl.wikipedia.org/wiki/Pafos"),
                        Info(name: "Larnaka", description: "Kurort z promenadą i słonym jeziorem.", imageURL: "https://loremflickr.com/800/600/larnaca", wikipediaURL: "https://pl.wikipedia.org/wiki/Larnaka")
                    ],
                    nature: [
                        Info(name: "Cape Greco", description: "Klify i jaskinie morskie.", imageURL: "https://loremflickr.com/800/600/capegreco", wikipediaURL: "https://pl.wikipedia.org/wiki/Grekne"),
                        Info(name: "Góry Troodos", description: "Zielone płuca wyspy, zimą pada tu śnieg.", imageURL: "https://loremflickr.com/800/600/troodos", wikipediaURL: "https://pl.wikipedia.org/wiki/Trodos"),
                        Info(name: "Plaża Nissi", description: "Piaszczysta plaża z turkusową wodą.", imageURL: "https://loremflickr.com/800/600/nissibeach", wikipediaURL: "https://en.wikipedia.org/wiki/Ayia_Napa")
                    ]
                ),

                // 10. CZARNOGÓRA 🇲🇪
                CountryD(
                    name: "Czarnogóra",
                    capital: "Podgorica",
                    continent: "Europa",
                    currency: "Euro (EUR)",
                    flag: "🇲🇪",
                    lang: ["Czarnogórski"],
                    population: 620_000,
                    culture: [
                        Info(name: "Kotor", description: "Średniowieczne miasto portowe z murami.", imageURL: "https://loremflickr.com/800/600/kotor,city", wikipediaURL: "https://pl.wikipedia.org/wiki/Kotor"),
                        Info(name: "Monastyr Ostrog", description: "Klasztor wykuty w pionowej skale.", imageURL: "https://loremflickr.com/800/600/ostrogmonastery", wikipediaURL: "https://pl.wikipedia.org/wiki/Monaster_Ostrog")
                    ],
                    cities: [
                        Info(name: "Podgorica", description: "Stolica kraju.", imageURL: "https://loremflickr.com/800/600/podgorica", wikipediaURL: "https://pl.wikipedia.org/wiki/Podgorica"),
                        Info(name: "Budva", description: "Centrum turystyki i życia nocnego.", imageURL: "https://loremflickr.com/800/600/budva", wikipediaURL: "https://pl.wikipedia.org/wiki/Budva"),
                        Info(name: "Perast", description: "Ciche miasteczko barokowe nad zatoką.", imageURL: "https://loremflickr.com/800/600/perast", wikipediaURL: "https://pl.wikipedia.org/wiki/Perast")
                    ],
                    nature: [
                        Info(name: "Zatoka Kotorska", description: "Najdalej na południe wysunięty 'fiord'.", imageURL: "https://loremflickr.com/800/600/bayofkotor", wikipediaURL: "https://pl.wikipedia.org/wiki/Zatoka_Kotorska"),
                        Info(name: "Durmitor", description: "Park narodowy z górami i jeziorami.", imageURL: "https://loremflickr.com/800/600/durmitor", wikipediaURL: "https://pl.wikipedia.org/wiki/Durmitor"),
                        Info(name: "Kanion Tary", description: "Najgłębszy kanion w Europie.", imageURL: "https://loremflickr.com/800/600/taracanyon", wikipediaURL: "https://pl.wikipedia.org/wiki/Tara_(rzeka_w_Czarnog%C3%B3rze)")
                    ]
                ),

                // 11. CZECHY 🇨🇿
                CountryD(
                    name: "Czechy",
                    capital: "Praga",
                    continent: "Europa",
                    currency: "Korona czeska (CZK)",
                    flag: "🇨🇿",
                    lang: ["Czeski"],
                    population: 10_700_000,
                    culture: [
                        Info(name: "Most Karola", description: "Słynny most w Pradze z rzeźbami.", imageURL: "https://loremflickr.com/800/600/charlesbridge", wikipediaURL: "https://pl.wikipedia.org/wiki/Most_Karola_w_Pradze"),
                        Info(name: "Piwo", description: "Czechy to królestwo pilznera.", imageURL: "https://loremflickr.com/800/600/beer,czech", wikipediaURL: "https://pl.wikipedia.org/wiki/Piwo_w_Czechach")
                    ],
                    cities: [
                        Info(name: "Praga", description: "Złote Miasto, jedna z najpiękniejszych stolic.", imageURL: "https://loremflickr.com/800/600/prague", wikipediaURL: "https://pl.wikipedia.org/wiki/Praga"),
                        Info(name: "Český Krumlov", description: "Bajkowe miasteczko w zakolu rzeki.", imageURL: "https://loremflickr.com/800/600/ceskykrumlov", wikipediaURL: "https://pl.wikipedia.org/wiki/%C4%8Cesk%C3%BD_Krumlov"),
                        Info(name: "Brno", description: "Stolica Moraw, miasto modernizmu.", imageURL: "https://loremflickr.com/800/600/brno", wikipediaURL: "https://pl.wikipedia.org/wiki/Brno")
                    ],
                    nature: [
                        Info(name: "Czeska Szwajcaria", description: "Piaskowcowe formacje skalne.", imageURL: "https://loremflickr.com/800/600/bohemianswitzerland", wikipediaURL: "https://pl.wikipedia.org/wiki/Park_Narodowy_Czeska_Szwajcaria"),
                        Info(name: "Skalne Miasto", description: "Labirynty skalne w Adršpach.", imageURL: "https://loremflickr.com/800/600/adrspach", wikipediaURL: "https://pl.wikipedia.org/wiki/Adrszpasko-cieplickie_Ska%C5%82y"),
                        Info(name: "Karkonosze", description: "Najwyższe góry ze Śnieżką.", imageURL: "https://loremflickr.com/800/600/giantmountains", wikipediaURL: "https://pl.wikipedia.org/wiki/Karkonosze")
                    ]
                ),

                // 12. DANIA 🇩🇰
                CountryD(
                    name: "Dania",
                    capital: "Kopenhaga",
                    continent: "Europa",
                    currency: "Korona duńska (DKK)",
                    flag: "🇩🇰",
                    lang: ["Duński"],
                    population: 5_800_000,
                    culture: [
                        Info(name: "LEGO", description: "Najsłynniejsze klocki świata.", imageURL: "https://loremflickr.com/800/600/lego", wikipediaURL: "https://pl.wikipedia.org/wiki/Lego"),
                        Info(name: "Hygge", description: "Filozofia przytulności i szczęścia.", imageURL: "https://loremflickr.com/800/600/hygge", wikipediaURL: "https://pl.wikipedia.org/wiki/Hygge")
                    ],
                    cities: [
                        Info(name: "Kopenhaga", description: "Miasto rowerów i Małej Syrenki.", imageURL: "https://loremflickr.com/800/600/copenhagen", wikipediaURL: "https://pl.wikipedia.org/wiki/Kopenhaga"),
                        Info(name: "Aarhus", description: "Miasto uśmiechu i kultury.", imageURL: "https://loremflickr.com/800/600/aarhus", wikipediaURL: "https://pl.wikipedia.org/wiki/Aarhus"),
                        Info(name: "Odense", description: "Rodzinne miasto H.Ch. Andersena.", imageURL: "https://loremflickr.com/800/600/odense", wikipediaURL: "https://pl.wikipedia.org/wiki/Odense")
                    ],
                    nature: [
                        Info(name: "Klify Møns Klint", description: "Białe klify kredowe.", imageURL: "https://loremflickr.com/800/600/monsklint", wikipediaURL: "https://pl.wikipedia.org/wiki/M%C3%B8ns_Klint"),
                        Info(name: "Grenen", description: "Cypel, gdzie zderzają się dwa morza.", imageURL: "https://loremflickr.com/800/600/skagen,sea", wikipediaURL: "https://pl.wikipedia.org/wiki/Grenen"),
                        Info(name: "Wyspy Owcze", description: "Autonomiczny archipelag o surowym pięknie.", imageURL: "https://loremflickr.com/800/600/faroeislands", wikipediaURL: "https://pl.wikipedia.org/wiki/Wyspy_Owcze")
                    ]
                ),

                // 13. ESTONIA 🇪🇪
                CountryD(
                    name: "Estonia",
                    capital: "Tallinn",
                    continent: "Europa",
                    currency: "Euro (EUR)",
                    flag: "🇪🇪",
                    lang: ["Estoński"],
                    population: 1_300_000,
                    culture: [
                        Info(name: "e-Państwo", description: "Lider cyfryzacji na świecie.", imageURL: "https://loremflickr.com/800/600/digital,estonia", wikipediaURL: "https://pl.wikipedia.org/wiki/E-stonia"),
                        Info(name: "Sauna", description: "Ważny element estońskiego stylu życia.", imageURL: "https://loremflickr.com/800/600/sauna", wikipediaURL: "https://pl.wikipedia.org/wiki/Sauna")
                    ],
                    cities: [
                        Info(name: "Tallinn", description: "Średniowieczna starówka z murami (UNESCO).", imageURL: "https://loremflickr.com/800/600/tallinn", wikipediaURL: "https://pl.wikipedia.org/wiki/Tallinn"),
                        Info(name: "Tartu", description: "Akademickie serce kraju.", imageURL: "https://loremflickr.com/800/600/tartu", wikipediaURL: "https://pl.wikipedia.org/wiki/Tartu"),
                        Info(name: "Parnawa", description: "Letnia stolica Estonii.", imageURL: "https://loremflickr.com/800/600/parnu", wikipediaURL: "https://pl.wikipedia.org/wiki/Parnawa")
                    ],
                    nature: [
                        Info(name: "Lahemaa", description: "Park narodowy z bagnami i lasami.", imageURL: "https://loremflickr.com/800/600/bog,estonia", wikipediaURL: "https://pl.wikipedia.org/wiki/Park_Narodowy_Lahemaa"),
                        Info(name: "Wyspa Sarema", description: "Wyspa wiatraków i kraterów meteorytowych.", imageURL: "https://loremflickr.com/800/600/saaremaa", wikipediaURL: "https://pl.wikipedia.org/wiki/Sarema"),
                        Info(name: "Wodospad Jägala", description: "Szeroki wodospad niedaleko stolicy.", imageURL: "https://loremflickr.com/800/600/waterfall,jagala", wikipediaURL: "https://pl.wikipedia.org/wiki/J%C3%A4gala_(wodospad)")
                    ]
                ),
                // 14. FINLANDIA 🇫🇮
                        CountryD(
                            name: "Finlandia",
                            capital: "Helsinki",
                            continent: "Europa",
                            currency: "Euro (EUR)",
                            flag: "🇫🇮",
                            lang: ["Fiński", "Szwedzki"],
                            population: 5_500_000,
                            culture: [
                                Info(name: "Sauna", description: "W Finlandii jest więcej saun niż samochodów.", imageURL: "https://loremflickr.com/800/600/sauna", wikipediaURL: "https://pl.wikipedia.org/wiki/Sauna"),
                                Info(name: "Muminki", description: "Bajkowe trolle stworzone przez Tove Jansson.", imageURL: "https://loremflickr.com/800/600/moomin", wikipediaURL: "https://pl.wikipedia.org/wiki/Muminki")
                            ],
                            cities: [
                                Info(name: "Helsinki", description: "Stolica designu i architektury.", imageURL: "https://loremflickr.com/800/600/helsinki", wikipediaURL: "https://pl.wikipedia.org/wiki/Helsinki"),
                                Info(name: "Rovaniemi", description: "Oficjalna wioska Świętego Mikołaja.", imageURL: "https://loremflickr.com/800/600/santaclausvillage", wikipediaURL: "https://pl.wikipedia.org/wiki/Rovaniemi"),
                                Info(name: "Tampere", description: "Miasto przemysłowe położone między jeziorami.", imageURL: "https://loremflickr.com/800/600/tampere", wikipediaURL: "https://pl.wikipedia.org/wiki/Tampere")
                            ],
                            nature: [
                                Info(name: "Zorza Polarna", description: "Magiczne światła północy w Laponi.", imageURL: "https://loremflickr.com/800/600/aurora", wikipediaURL: "https://pl.wikipedia.org/wiki/Zorza_polarna"),
                                Info(name: "Pojezierze Fińskie", description: "Kraina tysięcy jezior.", imageURL: "https://loremflickr.com/800/600/lake,finland", wikipediaURL: "https://pl.wikipedia.org/wiki/Pojezierze_Fi%C5%84skie"),
                                Info(name: "Park Narodowy Nuuksio", description: "Dzika przyroda tuż obok stolicy.", imageURL: "https://loremflickr.com/800/600/forest,finland", wikipediaURL: "https://pl.wikipedia.org/wiki/Park_Narodowy_Nuuksio")
                            ]
                        ),

                        // 15. FRANCJA 🇫🇷
                        CountryD(
                            name: "Francja",
                            capital: "Paryż",
                            continent: "Europa",
                            currency: "Euro (EUR)",
                            flag: "🇫🇷",
                            lang: ["Francuski"],
                            population: 67_000_000,
                            culture: [
                                Info(name: "Wieża Eiffla", description: "Symbol Paryża, 'Żelazna Dama'.", imageURL: "https://loremflickr.com/800/600/eiffeltower", wikipediaURL: "https://pl.wikipedia.org/wiki/Wie%C5%BCa_Eiffla"),
                                Info(name: "Luwru", description: "Największe muzeum sztuki na świecie.", imageURL: "https://loremflickr.com/800/600/louvre", wikipediaURL: "https://pl.wikipedia.org/wiki/Luwr")
                            ],
                            cities: [
                                Info(name: "Paryż", description: "Miasto zakochanych i mody.", imageURL: "https://loremflickr.com/800/600/paris", wikipediaURL: "https://pl.wikipedia.org/wiki/Pary%C5%BC"),
                                Info(name: "Nicea", description: "Perła Lazurowego Wybrzeża.", imageURL: "https://loremflickr.com/800/600/nice,france", wikipediaURL: "https://pl.wikipedia.org/wiki/Nicea"),
                                Info(name: "Bordeaux", description: "Światowa stolica wina.", imageURL: "https://loremflickr.com/800/600/bordeaux", wikipediaURL: "https://pl.wikipedia.org/wiki/Bordeaux")
                            ],
                            nature: [
                                Info(name: "Mont Blanc", description: "Najwyższy szczyt Europy Zachodniej.", imageURL: "https://loremflickr.com/800/600/montblanc", wikipediaURL: "https://pl.wikipedia.org/wiki/Mont_Blanc"),
                                Info(name: "Pola Lawendy", description: "Fioletowe krajobrazy Prowansji.", imageURL: "https://loremflickr.com/800/600/lavender", wikipediaURL: "https://pl.wikipedia.org/wiki/Prowansja"),
                                Info(name: "Lazurowe Wybrzeże", description: "Słynne plaże nad Morzem Śródziemnym.", imageURL: "https://loremflickr.com/800/600/frenchriviera", wikipediaURL: "https://pl.wikipedia.org/wiki/Lazurowe_Wybrze%C5%BCe")
                            ]
                        ),

                        // 16. GRECJA 🇬🇷
                        CountryD(
                            name: "Grecja",
                            capital: "Ateny",
                            continent: "Europa",
                            currency: "Euro (EUR)",
                            flag: "🇬🇷",
                            lang: ["Grecki"],
                            population: 10_700_000,
                            culture: [
                                Info(name: "Akropol", description: "Starożytna cytadela z Partenonem.", imageURL: "https://loremflickr.com/800/600/acropolis", wikipediaURL: "https://pl.wikipedia.org/wiki/Akropol_ate%C5%84ski"),
                                Info(name: "Oliwki", description: "Podstawa diety i kultury greckiej.", imageURL: "https://loremflickr.com/800/600/olives", wikipediaURL: "https://pl.wikipedia.org/wiki/Oliwka_europejska")
                            ],
                            cities: [
                                Info(name: "Ateny", description: "Kolebka zachodniej cywilizacji.", imageURL: "https://loremflickr.com/800/600/athens", wikipediaURL: "https://pl.wikipedia.org/wiki/Ateny"),
                                Info(name: "Saloniki", description: "Miasto bizantyjskich zabytków.", imageURL: "https://loremflickr.com/800/600/thessaloniki", wikipediaURL: "https://pl.wikipedia.org/wiki/Saloniki"),
                                Info(name: "Oia", description: "Białe domki na klifie Santorini.", imageURL: "https://loremflickr.com/800/600/santorini", wikipediaURL: "https://pl.wikipedia.org/wiki/Santoryn")
                            ],
                            nature: [
                                Info(name: "Meteory", description: "Klasztory zawieszone na skałach.", imageURL: "https://loremflickr.com/800/600/meteora", wikipediaURL: "https://pl.wikipedia.org/wiki/Meteory"),
                                Info(name: "Zatoka Wraku", description: "Ikoniczna plaża na Zakynthos.", imageURL: "https://loremflickr.com/800/600/navagio", wikipediaURL: "https://pl.wikipedia.org/wiki/Zakintos"),
                                Info(name: "Olimp", description: "Mityczna góra bogów.", imageURL: "https://loremflickr.com/800/600/mountolympus", wikipediaURL: "https://pl.wikipedia.org/wiki/Olimp")
                            ]
                        ),

                        // 17. HISZPANIA 🇪🇸
                        CountryD(
                            name: "Hiszpania",
                            capital: "Madryt",
                            continent: "Europa",
                            currency: "Euro (EUR)",
                            flag: "🇪🇸",
                            lang: ["Hiszpański"],
                            population: 47_000_000,
                            culture: [
                                Info(name: "Flamenco", description: "Pełen pasji taniec z Andaluzji.", imageURL: "https://loremflickr.com/800/600/flamenco", wikipediaURL: "https://pl.wikipedia.org/wiki/Flamenco"),
                                Info(name: "Sagrada Família", description: "Niezwykła bazylika Gaudiego w Barcelonie.", imageURL: "https://loremflickr.com/800/600/sagradafamilia", wikipediaURL: "https://pl.wikipedia.org/wiki/Sagrada_Fam%C3%ADlia")
                            ],
                            cities: [
                                Info(name: "Madryt", description: "Królewska stolica ze słynnym muzeum Prado.", imageURL: "https://loremflickr.com/800/600/madrid", wikipediaURL: "https://pl.wikipedia.org/wiki/Madryt"),
                                Info(name: "Barcelona", description: "Miasto Gaudiego i plaży miejskiej.", imageURL: "https://loremflickr.com/800/600/barcelona", wikipediaURL: "https://pl.wikipedia.org/wiki/Barcelona"),
                                Info(name: "Sewilla", description: "Serce Andaluzji z Placem Hiszpańskim.", imageURL: "https://loremflickr.com/800/600/seville", wikipediaURL: "https://pl.wikipedia.org/wiki/Sewilla")
                            ],
                            nature: [
                                Info(name: "Picos de Europa", description: "Wapienne pasmo górskie na północy.", imageURL: "https://loremflickr.com/800/600/picosdeeuropa", wikipediaURL: "https://pl.wikipedia.org/wiki/Picos_de_Europa"),
                                Info(name: "Costa Brava", description: "Dzikie wybrzeże pełne klifów.", imageURL: "https://loremflickr.com/800/600/costabrava", wikipediaURL: "https://pl.wikipedia.org/wiki/Costa_Brava"),
                                Info(name: "Teneryfa (Teide)", description: "Wulkaniczny krajobraz na Wyspach Kanaryjskich.", imageURL: "https://loremflickr.com/800/600/teide", wikipediaURL: "https://pl.wikipedia.org/wiki/Teide")
                            ]
                        ),

                        // 18. HOLANDIA 🇳🇱
                        CountryD(
                            name: "Holandia",
                            capital: "Amsterdam",
                            continent: "Europa",
                            currency: "Euro (EUR)",
                            flag: "🇳🇱",
                            lang: ["Niderlandzki"],
                            population: 17_500_000,
                            culture: [
                                Info(name: "Wiatraki", description: "Symbol walki z wodą (Kinderdijk).", imageURL: "https://loremflickr.com/800/600/windmill,netherlands", wikipediaURL: "https://pl.wikipedia.org/wiki/Wiatraki_w_Kinderdijk"),
                                Info(name: "Rowery", description: "Główny środek transportu w miastach.", imageURL: "https://loremflickr.com/800/600/bikes,amsterdam", wikipediaURL: "https://pl.wikipedia.org/wiki/Holandia")
                            ],
                            cities: [
                                Info(name: "Amsterdam", description: "Miasto kanałów i muzeów.", imageURL: "https://loremflickr.com/800/600/amsterdam", wikipediaURL: "https://pl.wikipedia.org/wiki/Amsterdam"),
                                Info(name: "Rotterdam", description: "Nowoczesna architektura i wielki port.", imageURL: "https://loremflickr.com/800/600/rotterdam", wikipediaURL: "https://pl.wikipedia.org/wiki/Rotterdam"),
                                Info(name: "Haga", description: "Siedziba rządu i króla.", imageURL: "https://loremflickr.com/800/600/thehague", wikipediaURL: "https://pl.wikipedia.org/wiki/Haga")
                            ],
                            nature: [
                                Info(name: "Keukenhof", description: "Ogród z milionami tulipanów.", imageURL: "https://loremflickr.com/800/600/tulips", wikipediaURL: "https://pl.wikipedia.org/wiki/Keukenhof"),
                                Info(name: "Morze Wattowe", description: "Unikalny ekosystem pływowy.", imageURL: "https://loremflickr.com/800/600/waddensea", wikipediaURL: "https://pl.wikipedia.org/wiki/Morze_Wattowe"),
                                Info(name: "Hoge Veluwe", description: "Park narodowy z wydmami i wrzosowiskami.", imageURL: "https://loremflickr.com/800/600/heathland", wikipediaURL: "https://pl.wikipedia.org/wiki/Park_Narodowy_De_Hoge_Veluwe")
                            ]
                        ),

                        // 19. IRLANDIA 🇮🇪
                        CountryD(
                            name: "Irlandia",
                            capital: "Dublin",
                            continent: "Europa",
                            currency: "Euro (EUR)",
                            flag: "🇮🇪",
                            lang: ["Angielski", "Irlandzki"],
                            population: 5_000_000,
                            culture: [
                                Info(name: "Puby", description: "Centrum życia towarzyskiego i muzyki.", imageURL: "https://loremflickr.com/800/600/irishpub", wikipediaURL: "https://pl.wikipedia.org/wiki/Pub"),
                                Info(name: "Dzień św. Patryka", description: "Święto patrona obchodzone na zielono.", imageURL: "https://loremflickr.com/800/600/stpatricksday", wikipediaURL: "https://pl.wikipedia.org/wiki/Dzie%C5%84_%C5%9Awi%C4%99tego_Patryka")
                            ],
                            cities: [
                                Info(name: "Dublin", description: "Miasto literatury i piwa Guinness.", imageURL: "https://loremflickr.com/800/600/dublin", wikipediaURL: "https://pl.wikipedia.org/wiki/Dublin"),
                                Info(name: "Cork", description: "Miasto buntowników z dzwonami Shandon.", imageURL: "https://loremflickr.com/800/600/cork,ireland", wikipediaURL: "https://pl.wikipedia.org/wiki/Cork"),
                                Info(name: "Galway", description: "Artystyczne serce zachodu.", imageURL: "https://loremflickr.com/800/600/galway", wikipediaURL: "https://pl.wikipedia.org/wiki/Galway")
                            ],
                            nature: [
                                Info(name: "Klify Moheru", description: "Spektakularne klify nad Atlantykiem.", imageURL: "https://loremflickr.com/800/600/cliffsofmoher", wikipediaURL: "https://pl.wikipedia.org/wiki/Klify_Moheru"),
                                Info(name: "Grobla Olbrzyma", description: "Bazaltowe kolumny na północy.", imageURL: "https://loremflickr.com/800/600/giantscauseway", wikipediaURL: "https://pl.wikipedia.org/wiki/Grobla_Olbrzyma"),
                                Info(name: "Ring of Kerry", description: "Malownicza trasa widokowa.", imageURL: "https://loremflickr.com/800/600/ringofkerry", wikipediaURL: "https://pl.wikipedia.org/wiki/Ring_of_Kerry")
                            ]
                        ),

                        // 20. ISLANDIA 🇮🇸
                        CountryD(
                            name: "Islandia",
                            capital: "Reykjavík",
                            continent: "Europa",
                            currency: "Korona islandzka (ISK)",
                            flag: "🇮🇸",
                            lang: ["Islandzki"],
                            population: 370_000,
                            culture: [
                                Info(name: "Sagi", description: "Opowieści o wikingach i historii.", imageURL: "https://loremflickr.com/800/600/viking,book", wikipediaURL: "https://pl.wikipedia.org/wiki/Sagi_islandzkie"),
                                Info(name: "Gorące źródła", description: "Społeczne miejsce spotkań Islandczyków.", imageURL: "https://loremflickr.com/800/600/bluelagoon", wikipediaURL: "https://pl.wikipedia.org/wiki/B%C5%82%C4%99kitna_Laguna_(Islandia)")
                            ],
                            cities: [
                                Info(name: "Reykjavík", description: "Najbardziej na północ wysunięta stolica.", imageURL: "https://loremflickr.com/800/600/reykjavik", wikipediaURL: "https://pl.wikipedia.org/wiki/Reykjav%C3%ADk"),
                                Info(name: "Akureyri", description: "Stolica północy w fiordzie.", imageURL: "https://loremflickr.com/800/600/akureyri", wikipediaURL: "https://pl.wikipedia.org/wiki/Akureyri"),
                                Info(name: "Vík", description: "Wioska z czarną plażą.", imageURL: "https://loremflickr.com/800/600/vik,iceland", wikipediaURL: "https://pl.wikipedia.org/wiki/V%C3%ADk_%C3%AD_M%C3%BDrdal")
                            ],
                            nature: [
                                Info(name: "Złoty Krąg", description: "Gejzery i wodospady.", imageURL: "https://loremflickr.com/800/600/geysir", wikipediaURL: "https://pl.wikipedia.org/wiki/Z%C5%82oty_Kr%C4%85g_(Islandia)"),
                                Info(name: "Vatnajökull", description: "Największy lodowiec Europy.", imageURL: "https://loremflickr.com/800/600/glacier", wikipediaURL: "https://pl.wikipedia.org/wiki/Vatnaj%C3%B6kull"),
                                Info(name: "Skógafoss", description: "Potężny wodospad.", imageURL: "https://loremflickr.com/800/600/skogafoss", wikipediaURL: "https://pl.wikipedia.org/wiki/Sk%C3%B3gafoss")
                            ]
                        ),

                        // 21. KOSOWO 🇽🇰
                        CountryD(
                            name: "Kosowo",
                            capital: "Prisztina",
                            continent: "Europa",
                            currency: "Euro (EUR)",
                            flag: "🇽🇰",
                            lang: ["Albański", "Serbski"],
                            population: 1_800_000,
                            culture: [
                                Info(name: "Newborn", description: "Pomnik symbolizujący niepodległość.", imageURL: "https://loremflickr.com/800/600/newborn,monument", wikipediaURL: "https://en.wikipedia.org/wiki/Newborn_monument"),
                                Info(name: "Monastyry", description: "Średniowieczne zabytki sakralne (UNESCO).", imageURL: "https://loremflickr.com/800/600/kosovo,monastery", wikipediaURL: "https://pl.wikipedia.org/wiki/Monaster_Gra%C4%8Danica")
                            ],
                            cities: [
                                Info(name: "Prisztina", description: "Dynamiczna stolica.", imageURL: "https://loremflickr.com/800/600/pristina", wikipediaURL: "https://pl.wikipedia.org/wiki/Prisztina"),
                                Info(name: "Prizren", description: "Kulturalna stolica z twierdzą.", imageURL: "https://loremflickr.com/800/600/prizren", wikipediaURL: "https://pl.wikipedia.org/wiki/Prizren"),
                                Info(name: "Peć", description: "Miasto u wrót gór.", imageURL: "https://loremflickr.com/800/600/peja,city", wikipediaURL: "https://pl.wikipedia.org/wiki/Pe%C4%87_(miasto)")
                            ],
                            nature: [
                                Info(name: "Góry Przeklęte", description: "Pasmo górskie idealne na trekking.", imageURL: "https://loremflickr.com/800/600/accursedmountains", wikipediaURL: "https://pl.wikipedia.org/wiki/G%C3%B3ry_P%C3%B3%C5%82nocnoalba%C5%84skie"),
                                Info(name: "Wąwóz Rugova", description: "Jeden z najgłębszych kanionów Europy.", imageURL: "https://loremflickr.com/800/600/rugovacanyon", wikipediaURL: "https://pl.wikipedia.org/wiki/Rugova_(w%C4%85w%C3%B3z)"),
                                Info(name: "Wodospady Mirusha", description: "Kaskada wodospadów.", imageURL: "https://loremflickr.com/800/600/mirusha", wikipediaURL: "https://en.wikipedia.org/wiki/Mirusha_waterfalls")
                            ]
                        ),

                        // 22. LIECHTENSTEIN 🇱🇮
                        CountryD(
                            name: "Liechtenstein",
                            capital: "Vaduz",
                            continent: "Europa",
                            currency: "Frank szwajcarski (CHF)",
                            flag: "🇱🇮",
                            lang: ["Niemiecki"],
                            population: 39_000,
                            culture: [
                                Info(name: "Znaczki", description: "Kraj słynący z cenionych znaczków pocztowych.", imageURL: "https://loremflickr.com/800/600/stamps", wikipediaURL: "https://pl.wikipedia.org/wiki/Liechtenstein"),
                                Info(name: "Zamek Vaduz", description: "Siedziba rodziny książęcej.", imageURL: "https://loremflickr.com/800/600/vaduzcastle", wikipediaURL: "https://pl.wikipedia.org/wiki/Zamek_Vaduz")
                            ],
                            cities: [
                                Info(name: "Vaduz", description: "Stolica u podnóża zamku.", imageURL: "https://loremflickr.com/800/600/vaduz", wikipediaURL: "https://pl.wikipedia.org/wiki/Vaduz"),
                                Info(name: "Malbun", description: "Ośrodek narciarski.", imageURL: "https://loremflickr.com/800/600/malbun", wikipediaURL: "https://pl.wikipedia.org/wiki/Malbun"),
                                Info(name: "Schaan", description: "Największe miasto księstwa.", imageURL: "https://loremflickr.com/800/600/schaan", wikipediaURL: "https://pl.wikipedia.org/wiki/Schaan")
                            ],
                            nature: [
                                Info(name: "Alpy", description: "Góry zajmują większość kraju.", imageURL: "https://loremflickr.com/800/600/alps,liechtenstein", wikipediaURL: "https://pl.wikipedia.org/wiki/Alpy_Retyckie"),
                                Info(name: "Ren", description: "Rzeka graniczna ze Szwajcarią.", imageURL: "https://loremflickr.com/800/600/rhineriver", wikipediaURL: "https://pl.wikipedia.org/wiki/Ren"),
                                Info(name: "Szlaki winne", description: "Winnice na zboczach gór.", imageURL: "https://loremflickr.com/800/600/vineyard", wikipediaURL: "https://pl.wikipedia.org/wiki/Wina_liechtenstei%C5%84skie")
                            ]
                        ),

                        // 23. LITWA 🇱🇹
                        CountryD(
                            name: "Litwa",
                            capital: "Wilno",
                            continent: "Europa",
                            currency: "Euro (EUR)",
                            flag: "🇱🇹",
                            lang: ["Litewski"],
                            population: 2_800_000,
                            culture: [
                                Info(name: "Zamek w Trokach", description: "Gotycki zamek na wyspie.", imageURL: "https://loremflickr.com/800/600/trakai", wikipediaURL: "https://pl.wikipedia.org/wiki/Zamek_w_Trokach"),
                                Info(name: "Koszykówka", description: "Sport narodowy Litwinów.", imageURL: "https://loremflickr.com/800/600/basketball,court", wikipediaURL: "https://pl.wikipedia.org/wiki/Sport_na_Litwie")
                            ],
                            cities: [
                                Info(name: "Wilno", description: "Barokowa stolica z Ostrą Bramą.", imageURL: "https://loremflickr.com/800/600/vilnius", wikipediaURL: "https://pl.wikipedia.org/wiki/Wilno"),
                                Info(name: "Kowno", description: "Miasto architektury modernistycznej.", imageURL: "https://loremflickr.com/800/600/kaunas", wikipediaURL: "https://pl.wikipedia.org/wiki/Kowno"),
                                Info(name: "Kłajpeda", description: "Portowe miasto z niemiecką architekturą.", imageURL: "https://loremflickr.com/800/600/klaipeda", wikipediaURL: "https://pl.wikipedia.org/wiki/K%C5%82ajpeda")
                            ],
                            nature: [
                                Info(name: "Mierzeja Kurońska", description: "Wielkie wydmy wchodzące do morza.", imageURL: "https://loremflickr.com/800/600/curonianspit", wikipediaURL: "https://pl.wikipedia.org/wiki/Mierzeja_Kuro%C5%84ska"),
                                Info(name: "Góra Krzyży", description: "Wzgórze z tysiącami krzyży.", imageURL: "https://loremflickr.com/800/600/hillofcrosses", wikipediaURL: "https://pl.wikipedia.org/wiki/G%C3%B3ra_Krzy%C5%BCy"),
                                Info(name: "Aukštaitija", description: "Kraina jezior i lasów.", imageURL: "https://loremflickr.com/800/600/lake,lithuania", wikipediaURL: "https://pl.wikipedia.org/wiki/Auksztocki_Park_Narodowy")
                            ]
                        ),

                        // 24. LUKSEMBURG 🇱🇺
                        CountryD(
                            name: "Luksemburg",
                            capital: "Luksemburg",
                            continent: "Europa",
                            currency: "Euro (EUR)",
                            flag: "🇱🇺",
                            lang: ["Luksemburski", "Francuski", "Niemiecki"],
                            population: 640_000,
                            culture: [
                                Info(name: "Twierdza", description: "Historyczne fortyfikacje i kazamaty.", imageURL: "https://loremflickr.com/800/600/casemates", wikipediaURL: "https://pl.wikipedia.org/wiki/Twierdza_Luksemburg"),
                                Info(name: "Wielkie Księstwo", description: "Jedyne Wielkie Księstwo na świecie.", imageURL: "https://loremflickr.com/800/600/palace,luxembourg", wikipediaURL: "https://pl.wikipedia.org/wiki/Luksemburg")
                            ],
                            cities: [
                                Info(name: "Luksemburg", description: "Miasto położone na klifach wąwozu.", imageURL: "https://loremflickr.com/800/600/luxembourgcity", wikipediaURL: "https://pl.wikipedia.org/wiki/Luksemburg_(miasto)"),
                                Info(name: "Vianden", description: "Miasteczko z bajkowym zamkiem.", imageURL: "https://loremflickr.com/800/600/vianden", wikipediaURL: "https://pl.wikipedia.org/wiki/Vianden"),
                                Info(name: "Echternach", description: "Najstarsze miasto w kraju.", imageURL: "https://loremflickr.com/800/600/echternach", wikipediaURL: "https://pl.wikipedia.org/wiki/Echternach")
                            ],
                            nature: [
                                Info(name: "Mullerthal", description: "Mała Szwajcaria z formacjami skalnymi.", imageURL: "https://loremflickr.com/800/600/mullerthal", wikipediaURL: "https://pl.wikipedia.org/wiki/Mullerthal"),
                                Info(name: "Mozela", description: "Dolina rzeki słynąca z win.", imageURL: "https://loremflickr.com/800/600/moselle", wikipediaURL: "https://pl.wikipedia.org/wiki/Mozela"),
                                Info(name: "Ardeny", description: "Zalesione wzgórza.", imageURL: "https://loremflickr.com/800/600/forest,ardennes", wikipediaURL: "https://pl.wikipedia.org/wiki/Ardeny")
                            ]
                        ),

                        // 25. ŁOTWA 🇱🇻
                        CountryD(
                            name: "Łotwa",
                            capital: "Ryga",
                            continent: "Europa",
                            currency: "Euro (EUR)",
                            flag: "🇱🇻",
                            lang: ["Łotewski"],
                            population: 1_900_000,
                            culture: [
                                Info(name: "Secesja", description: "Ryga to stolica architektury Art Nouveau.", imageURL: "https://loremflickr.com/800/600/artnouveau,riga", wikipediaURL: "https://pl.wikipedia.org/wiki/Ryga"),
                                Info(name: "Bursztyn", description: "Tradycyjna biżuteria z Bałtyku.", imageURL: "https://loremflickr.com/800/600/amber", wikipediaURL: "https://pl.wikipedia.org/wiki/Bursztyn_ba%C5%82tycki")
                            ],
                            cities: [
                                Info(name: "Ryga", description: "Największe miasto w krajach bałtyckich.", imageURL: "https://loremflickr.com/800/600/riga", wikipediaURL: "https://pl.wikipedia.org/wiki/Ryga"),
                                Info(name: "Jurmala", description: "Kurort z drewnianymi willami i plażą.", imageURL: "https://loremflickr.com/800/600/jurmala", wikipediaURL: "https://pl.wikipedia.org/wiki/Jurmala"),
                                Info(name: "Sigulda", description: "Miasto zamków w dolinie rzeki.", imageURL: "https://loremflickr.com/800/600/sigulda", wikipediaURL: "https://pl.wikipedia.org/wiki/Sigulda")
                            ],
                            nature: [
                                Info(name: "Dolina Gauja", description: "Park narodowy z klifami z piaskowca.", imageURL: "https://loremflickr.com/800/600/gauja", wikipediaURL: "https://pl.wikipedia.org/wiki/Park_Narodowy_Gauja"),
                                Info(name: "Ventas Rumba", description: "Najszerszy wodospad w Europie.", imageURL: "https://loremflickr.com/800/600/ventasrumba", wikipediaURL: "https://pl.wikipedia.org/wiki/Ventas_rumba"),
                                Info(name: "Przylądek Kolka", description: "Miejsce spotkania wód Bałtyku i zatoki.", imageURL: "https://loremflickr.com/800/600/capekolka", wikipediaURL: "https://pl.wikipedia.org/wiki/Kolka_(przyl%C4%85dek)")
                            ]
                        ),

                        // 26. MACEDONIA PÓŁNOCNA 🇲🇰
                        CountryD(
                            name: "Macedonia Północna",
                            capital: "Skopje",
                            continent: "Europa",
                            currency: "Denar macedoński (MKD)",
                            flag: "🇲🇰",
                            lang: ["Macedoński"],
                            population: 2_000_000,
                            culture: [
                                Info(name: "Matka Teresa", description: "Miejsce urodzenia słynnej świętej.", imageURL: "https://loremflickr.com/800/600/motherteresa", wikipediaURL: "https://pl.wikipedia.org/wiki/Matka_Teresa_z_Kalkuty"),
                                Info(name: "Cerkwie", description: "Liczne zabytkowe świątynie prawosławne.", imageURL: "https://loremflickr.com/800/600/church,macedonia", wikipediaURL: "https://pl.wikipedia.org/wiki/Macedo%C5%84ski_Ko%C5%9Bci%C3%B3%C5%82_Prawos%C5%82awny")
                            ],
                            cities: [
                                Info(name: "Skopje", description: "Miasto pomników i starego bazaru.", imageURL: "https://loremflickr.com/800/600/skopje", wikipediaURL: "https://pl.wikipedia.org/wiki/Skopje"),
                                Info(name: "Ochryda", description: "Perła Bałkanów nad jeziorem.", imageURL: "https://loremflickr.com/800/600/ohrid", wikipediaURL: "https://pl.wikipedia.org/wiki/Ochryda"),
                                Info(name: "Bitola", description: "Miasto konsulów z architekturą z XIX w.", imageURL: "https://loremflickr.com/800/600/bitola", wikipediaURL: "https://pl.wikipedia.org/wiki/Bitola")
                            ],
                            nature: [
                                Info(name: "Jezioro Ochrydzkie", description: "Jedno z najstarszych jezior Europy (UNESCO).", imageURL: "https://loremflickr.com/800/600/lakeohrid", wikipediaURL: "https://pl.wikipedia.org/wiki/Jezioro_Ochrydzkie"),
                                Info(name: "Kanion Matka", description: "Malowniczy wąwóz blisko stolicy.", imageURL: "https://loremflickr.com/800/600/matkacanyon", wikipediaURL: "https://pl.wikipedia.org/wiki/Kanion_Matka"),
                                Info(name: "Mavrovo", description: "Park narodowy i ośrodek narciarski.", imageURL: "https://loremflickr.com/800/600/mavrovo", wikipediaURL: "https://pl.wikipedia.org/wiki/Park_Narodowy_Mawrowo")
                            ]
                        ),

                        // 27. MALTA 🇲🇹
                        CountryD(
                            name: "Malta",
                            capital: "Valletta",
                            continent: "Europa",
                            currency: "Euro (EUR)",
                            flag: "🇲🇹",
                            lang: ["Maltański", "Angielski"],
                            population: 500_000,
                            culture: [
                                Info(name: "Joannici", description: "Historia Zakonu Maltańskiego.", imageURL: "https://loremflickr.com/800/600/malteseknights", wikipediaURL: "https://pl.wikipedia.org/wiki/Zakon_Malta%C5%84ski"),
                                Info(name: "Megality", description: "Świątynie starsze niż piramidy.", imageURL: "https://loremflickr.com/800/600/megalithictemple", wikipediaURL: "https://pl.wikipedia.org/wiki/Megalityczne_%C5%9Bwi%C4%85tynie_Malty")
                            ],
                            cities: [
                                Info(name: "Valletta", description: "Stolica-muzeum (UNESCO).", imageURL: "https://loremflickr.com/800/600/valletta", wikipediaURL: "https://pl.wikipedia.org/wiki/Valletta"),
                                Info(name: "Mdina", description: "Ciche Miasto, dawna stolica.", imageURL: "https://loremflickr.com/800/600/mdina", wikipediaURL: "https://pl.wikipedia.org/wiki/Mdina"),
                                Info(name: "Marsaxlokk", description: "Wioska rybacka z kolorowymi łodziami.", imageURL: "https://loremflickr.com/800/600/marsaxlokk", wikipediaURL: "https://pl.wikipedia.org/wiki/Marsaxlokk")
                            ],
                            nature: [
                                Info(name: "Blue Grotto", description: "Jaskinie z błękitną wodą.", imageURL: "https://loremflickr.com/800/600/bluegrotto", wikipediaURL: "https://pl.wikipedia.org/wiki/Blue_Grotto_(Malta)"),
                                Info(name: "Klify Dingli", description: "Najwyższe klify na Malcie.", imageURL: "https://loremflickr.com/800/600/dinglicliffs", wikipediaURL: "https://en.wikipedia.org/wiki/Dingli_Cliffs"),
                                Info(name: "Comino", description: "Wysepka ze słynną Blue Lagoon.", imageURL: "https://loremflickr.com/800/600/bluelagoon,malta", wikipediaURL: "https://pl.wikipedia.org/wiki/Comino")
                            ]
                        ),

                        // 28. MOŁDAWIA 🇲🇩
                        CountryD(
                            name: "Mołdawia",
                            capital: "Kiszyniów",
                            continent: "Europa",
                            currency: "Lej mołdawski (MDL)",
                            flag: "🇲🇩",
                            lang: ["Rumuński"],
                            population: 2_600_000,
                            culture: [
                                Info(name: "Wino", description: "Największe piwnice winne świata (Milestii Mici).", imageURL: "https://loremflickr.com/800/600/winecellar", wikipediaURL: "https://pl.wikipedia.org/wiki/Wina_mo%C5%82dawskie"),
                                Info(name: "Prawosławie", description: "Liczne zabytkowe cerkwie i klasztory.", imageURL: "https://loremflickr.com/800/600/orthodox,church", wikipediaURL: "https://pl.wikipedia.org/wiki/Mo%C5%82dawski_Ko%C5%9Bci%C3%B3%C5%82_Prawos%C5%82awny")
                            ],
                            cities: [
                                Info(name: "Kiszyniów", description: "Bardzo zielona stolica.", imageURL: "https://loremflickr.com/800/600/chisinau", wikipediaURL: "https://pl.wikipedia.org/wiki/Kiszyni%C3%B3w"),
                                Info(name: "Tyraspol", description: "Stolica Naddniestrza (skansen ZSRR).", imageURL: "https://loremflickr.com/800/600/tiraspol", wikipediaURL: "https://pl.wikipedia.org/wiki/Tyraspol"),
                                Info(name: "Orgiejów", description: "Historyczne miasto z kompleksem archeologicznym.", imageURL: "https://loremflickr.com/800/600/orheiulvechi", wikipediaURL: "https://pl.wikipedia.org/wiki/Orgiej%C3%B3w")
                            ],
                            nature: [
                                Info(name: "Stary Orgiejów", description: "Kanion rzeki z klasztorami skalnymi.", imageURL: "https://loremflickr.com/800/600/oldorhei", wikipediaURL: "https://pl.wikipedia.org/wiki/Stary_Orgiej%C3%B3w"),
                                Info(name: "Kodry", description: "Centralna wyżyna z lasami.", imageURL: "https://loremflickr.com/800/600/forest,moldova", wikipediaURL: "https://pl.wikipedia.org/wiki/Kodry"),
                                Info(name: "Dniestr", description: "Główna rzeka kraju.", imageURL: "https://loremflickr.com/800/600/dniester", wikipediaURL: "https://pl.wikipedia.org/wiki/Dniestr")
                            ]
                        ),

                        // 29. MONAKO 🇲🇨
                        CountryD(
                            name: "Monako",
                            capital: "Monako",
                            continent: "Europa",
                            currency: "Euro (EUR)",
                            flag: "🇲🇨",
                            lang: ["Francuski"],
                            population: 39_000,
                            culture: [
                                Info(name: "Formuła 1", description: "Najsłynniejszy wyścig uliczny.", imageURL: "https://loremflickr.com/800/600/f1,monaco", wikipediaURL: "https://pl.wikipedia.org/wiki/Grand_Prix_Monako"),
                                Info(name: "Kasyno", description: "Luksusowe kasyno w Monte Carlo.", imageURL: "https://loremflickr.com/800/600/casino,montecarlo", wikipediaURL: "https://pl.wikipedia.org/wiki/Casino_de_Monte-Carlo")
                            ],
                            cities: [
                                Info(name: "Monte Carlo", description: "Dzielnica luksusu.", imageURL: "https://loremflickr.com/800/600/montecarlo", wikipediaURL: "https://pl.wikipedia.org/wiki/Monte_Carlo"),
                                Info(name: "Monaco-Ville", description: "Stare miasto na skale.", imageURL: "https://loremflickr.com/800/600/monacoville", wikipediaURL: "https://pl.wikipedia.org/wiki/Monaco-Ville"),
                                Info(name: "Fontvieille", description: "Dzielnica odzyskana z morza.", imageURL: "https://loremflickr.com/800/600/fontvieille", wikipediaURL: "https://pl.wikipedia.org/wiki/Fontvieille_(Monako)")
                            ],
                            nature: [
                                Info(name: "Ogród Egzotyczny", description: "Sukulenty na klifie.", imageURL: "https://loremflickr.com/800/600/cactus,garden", wikipediaURL: "https://en.wikipedia.org/wiki/Jardin_Exotique_de_Monaco"),
                                Info(name: "Muzeum Oceanograficzne", description: "Akwaria w budynku na skale.", imageURL: "https://loremflickr.com/800/600/oceanographicmuseum", wikipediaURL: "https://pl.wikipedia.org/wiki/Muzeum_Oceanograficzne_w_Monako"),
                                Info(name: "Plaża Larvotto", description: "Miejska plaża księstwa.", imageURL: "https://loremflickr.com/800/600/beach,monaco", wikipediaURL: "https://en.wikipedia.org/wiki/Larvotto")
                            ]
                        ),
                
                        // 30. NIEMCY 🇩🇪
                        CountryD(
                            name: "Niemcy",
                            capital: "Berlin",
                            continent: "Europa",
                            currency: "Euro (EUR)",
                            flag: "🇩🇪",
                            lang: ["Niemiecki"],
                            population: 83_000_000,
                            culture: [
                                Info(name: "Oktoberfest", description: "Największy festyn piwny na świecie.", imageURL: "https://loremflickr.com/800/600/oktoberfest", wikipediaURL: "https://pl.wikipedia.org/wiki/Oktoberfest"),
                                Info(name: "Zamki", description: "Bajkowe zamki, np. Neuschwanstein.", imageURL: "https://loremflickr.com/800/600/neuschwanstein", wikipediaURL: "https://pl.wikipedia.org/wiki/Zamek_Neuschwanstein")
                            ],
                            cities: [
                                Info(name: "Berlin", description: "Stolica historii i sztuki alternatywnej.", imageURL: "https://loremflickr.com/800/600/berlin", wikipediaURL: "https://pl.wikipedia.org/wiki/Berlin"),
                                Info(name: "Monachium", description: "Stolica Bawarii i piwa.", imageURL: "https://loremflickr.com/800/600/munich", wikipediaURL: "https://pl.wikipedia.org/wiki/Monachium"),
                                Info(name: "Hamburg", description: "Wielkie miasto portowe.", imageURL: "https://loremflickr.com/800/600/hamburg", wikipediaURL: "https://pl.wikipedia.org/wiki/Hamburg")
                            ],
                            nature: [
                                Info(name: "Alpy Bawarskie", description: "Najwyższe góry w kraju.", imageURL: "https://loremflickr.com/800/600/bavarianalps", wikipediaURL: "https://pl.wikipedia.org/wiki/Alpy_Bawarskie"),
                                Info(name: "Schwarzwald", description: "Czarny Las słynący z zegarów z kukułką.", imageURL: "https://loremflickr.com/800/600/blackforest", wikipediaURL: "https://pl.wikipedia.org/wiki/Schwarzwald"),
                                Info(name: "Skały Rugii", description: "Kredowe klify nad Bałtykiem.", imageURL: "https://loremflickr.com/800/600/rugen,cliffs", wikipediaURL: "https://pl.wikipedia.org/wiki/Rugia")
                            ]
                        ),

                        // 31. NORWEGIA 🇳🇴
                        CountryD(
                            name: "Norwegia",
                            capital: "Oslo",
                            continent: "Europa",
                            currency: "Korona norweska (NOK)",
                            flag: "🇳🇴",
                            lang: ["Norweski"],
                            population: 5_400_000,
                            culture: [
                                Info(name: "Wikingowie", description: "Dziedzictwo skandynawskich wojowników.", imageURL: "https://loremflickr.com/800/600/viking,ship", wikipediaURL: "https://pl.wikipedia.org/wiki/Wikingowie"),
                                Info(name: "Kos", description: "Norweska wersja hygge – cieszenie się chwilą.", imageURL: "https://loremflickr.com/800/600/cabin,snow", wikipediaURL: "https://pl.wikipedia.org/wiki/Kultura_Norwegii")
                            ],
                            cities: [
                                Info(name: "Oslo", description: "Stolica położona nad fiordem.", imageURL: "https://loremflickr.com/800/600/oslo", wikipediaURL: "https://pl.wikipedia.org/wiki/Oslo"),
                                Info(name: "Bergen", description: "Brama do fiordów z drewnianym nabrzeżem.", imageURL: "https://loremflickr.com/800/600/bergen", wikipediaURL: "https://pl.wikipedia.org/wiki/Bergen_(Norwegia)"),
                                Info(name: "Tromsø", description: "Miasto zorzy polarnej za kołem podbiegunowym.", imageURL: "https://loremflickr.com/800/600/tromso", wikipediaURL: "https://pl.wikipedia.org/wiki/Troms%C3%B8")
                            ],
                            nature: [
                                Info(name: "Fiordy", description: "Głębokie zatoki wcinające się w ląd.", imageURL: "https://loremflickr.com/800/600/fjord", wikipediaURL: "https://pl.wikipedia.org/wiki/Fiord"),
                                Info(name: "Lofoty", description: "Archipelag o dramatycznych krajobrazach.", imageURL: "https://loremflickr.com/800/600/lofoten", wikipediaURL: "https://pl.wikipedia.org/wiki/Lofoty"),
                                Info(name: "Język Trolla", description: "Słynna półka skalna nad przepaścią.", imageURL: "https://loremflickr.com/800/600/trolltunga", wikipediaURL: "https://pl.wikipedia.org/wiki/Trolltunga")
                            ]
                        ),

                        // 32. POLSKA 🇵🇱
                        CountryD(
                            name: "Polska",
                            capital: "Warszawa",
                            continent: "Europa",
                            currency: "Złoty (PLN)",
                            flag: "🇵🇱",
                            lang: ["Polski"],
                            population: 38_000_000,
                            culture: [
                                Info(name: "Wawel", description: "Historyczna siedziba królów Polski.", imageURL: "https://loremflickr.com/800/600/wawel", wikipediaURL: "https://pl.wikipedia.org/wiki/Zamek_Kr%C3%B3lewski_na_Wawelu"),
                                Info(name: "Pierogi", description: "Najsłynniejsze danie kuchni polskiej.", imageURL: "https://loremflickr.com/800/600/dumplings", wikipediaURL: "https://pl.wikipedia.org/wiki/Pierogi")
                            ],
                            cities: [
                                Info(name: "Kraków", description: "Dawna stolica z Rynkiem Głównym (UNESCO).", imageURL: "https://loremflickr.com/800/600/krakow", wikipediaURL: "https://pl.wikipedia.org/wiki/Krak%C3%B3w"),
                                Info(name: "Warszawa", description: "Nowoczesna stolica odbudowana po wojnie.", imageURL: "https://loremflickr.com/800/600/warsaw", wikipediaURL: "https://pl.wikipedia.org/wiki/Warszawa"),
                                Info(name: "Gdańsk", description: "Nadmorskie miasto wolności i bursztynu.", imageURL: "https://loremflickr.com/800/600/gdansk", wikipediaURL: "https://pl.wikipedia.org/wiki/Gda%C5%84sk")
                            ],
                            nature: [
                                Info(name: "Tatry", description: "Alpejski charakter gór z Morskim Okiem.", imageURL: "https://loremflickr.com/800/600/tatry", wikipediaURL: "https://pl.wikipedia.org/wiki/Tatry"),
                                Info(name: "Puszcza Białowieska", description: "Ostatni las pierwotny na niżu Europy.", imageURL: "https://loremflickr.com/800/600/forest,bison", wikipediaURL: "https://pl.wikipedia.org/wiki/Puszcza_Bia%C5%82owieska"),
                                Info(name: "Mazury", description: "Kraina tysiąca jezior.", imageURL: "https://loremflickr.com/800/600/lake,masuria", wikipediaURL: "https://pl.wikipedia.org/wiki/Pojezierze_Mazurskie")
                            ]
                        ),

                        // 33. PORTUGALIA 🇵🇹
                        CountryD(
                            name: "Portugalia",
                            capital: "Lizbona",
                            continent: "Europa",
                            currency: "Euro (EUR)",
                            flag: "🇵🇹",
                            lang: ["Portugalski"],
                            population: 10_300_000,
                            culture: [
                                Info(name: "Fado", description: "Melancholijna muzyka portowych dzielnic.", imageURL: "https://loremflickr.com/800/600/fado,guitar", wikipediaURL: "https://pl.wikipedia.org/wiki/Fado"),
                                Info(name: "Azulejos", description: "Niebieskie płytki ceramiczne na fasadach.", imageURL: "https://loremflickr.com/800/600/azulejos", wikipediaURL: "https://pl.wikipedia.org/wiki/Azulejo")
                            ],
                            cities: [
                                Info(name: "Lizbona", description: "Miasto na wzgórzach z żółtymi tramwajami.", imageURL: "https://loremflickr.com/800/600/lisbon", wikipediaURL: "https://pl.wikipedia.org/wiki/Lizbona"),
                                Info(name: "Porto", description: "Miasto wina i mostów.", imageURL: "https://loremflickr.com/800/600/porto", wikipediaURL: "https://pl.wikipedia.org/wiki/Porto_(miasto)"),
                                Info(name: "Sintra", description: "Bajkowe pałace ukryte w górach.", imageURL: "https://loremflickr.com/800/600/sintra", wikipediaURL: "https://pl.wikipedia.org/wiki/Sintra")
                            ],
                            nature: [
                                Info(name: "Algarve", description: "Złote klify i jaskinie morskie.", imageURL: "https://loremflickr.com/800/600/algarve", wikipediaURL: "https://pl.wikipedia.org/wiki/Algarve"),
                                Info(name: "Madera", description: "Wyspa wiecznej wiosny.", imageURL: "https://loremflickr.com/800/600/madeira", wikipediaURL: "https://pl.wikipedia.org/wiki/Madera"),
                                Info(name: "Azory", description: "Wulkaniczny archipelag na Atlantyku.", imageURL: "https://loremflickr.com/800/600/azores", wikipediaURL: "https://pl.wikipedia.org/wiki/Azory")
                            ]
                        ),

                        // 34. ROSJA 🇷🇺 (Część europejska)
                        CountryD(
                            name: "Rosja",
                            capital: "Moskwa",
                            continent: "Europa",
                            currency: "Rubel rosyjski (RUB)",
                            flag: "🇷🇺",
                            lang: ["Rosyjski"],
                            population: 144_000_000,
                            culture: [
                                Info(name: "Balet", description: "Teatr Bolszoj i słynna szkoła tańca.", imageURL: "https://loremflickr.com/800/600/ballet", wikipediaURL: "https://pl.wikipedia.org/wiki/Balet_w_Rosji"),
                                Info(name: "Matrioszka", description: "Drewniana lalka wkładana jedna w drugą.", imageURL: "https://loremflickr.com/800/600/matryoshka", wikipediaURL: "https://pl.wikipedia.org/wiki/Matrioszka")
                            ],
                            cities: [
                                Info(name: "Moskwa", description: "Stolica z Kremlem i Placem Czerwonym.", imageURL: "https://loremflickr.com/800/600/moscow", wikipediaURL: "https://pl.wikipedia.org/wiki/Moskwa"),
                                Info(name: "Sankt Petersburg", description: "Miasto kanałów i Ermitażu.", imageURL: "https://loremflickr.com/800/600/saintpetersburg", wikipediaURL: "https://pl.wikipedia.org/wiki/Sankt_Petersburg"),
                                Info(name: "Kazań", description: "Spotkanie kultury rosyjskiej i tatarskiej.", imageURL: "https://loremflickr.com/800/600/kazan", wikipediaURL: "https://pl.wikipedia.org/wiki/Kaza%C5%84")
                            ],
                            nature: [
                                Info(name: "Bajkał", description: "Najgłębsze jezioro świata.", imageURL: "https://loremflickr.com/800/600/baikal", wikipediaURL: "https://pl.wikipedia.org/wiki/Bajka%C5%82"),
                                Info(name: "Kamczatka", description: "Kraina wulkanów i gejzerów.", imageURL: "https://loremflickr.com/800/600/kamchatka", wikipediaURL: "https://pl.wikipedia.org/wiki/Kamczatka"),
                                Info(name: "Elbrus", description: "Najwyższy szczyt Kaukazu.", imageURL: "https://loremflickr.com/800/600/elbrus", wikipediaURL: "https://pl.wikipedia.org/wiki/Elbrus")
                            ]
                        ),

                        // 35. RUMUNIA 🇷🇴
                        CountryD(
                            name: "Rumunia",
                            capital: "Bukareszt",
                            continent: "Europa",
                            currency: "Lej rumuński (RON)",
                            flag: "🇷🇴",
                            lang: ["Rumuński"],
                            population: 19_000_000,
                            culture: [
                                Info(name: "Zamek Drakuli", description: "Zamek Bran w Transylwanii.", imageURL: "https://loremflickr.com/800/600/brancastle", wikipediaURL: "https://pl.wikipedia.org/wiki/Zamek_w_Bran"),
                                Info(name: "Pałac Parlamentu", description: "Jeden z największych budynków świata.", imageURL: "https://loremflickr.com/800/600/parliament,bucharest", wikipediaURL: "https://pl.wikipedia.org/wiki/Pa%C5%82ac_Parlamentu")
                            ],
                            cities: [
                                Info(name: "Bukareszt", description: "Stolica zwana Małym Paryżem.", imageURL: "https://loremflickr.com/800/600/bucharest", wikipediaURL: "https://pl.wikipedia.org/wiki/Bukareszt"),
                                Info(name: "Sighișoara", description: "Kolorowe średniowieczne miasto.", imageURL: "https://loremflickr.com/800/600/sighisoara", wikipediaURL: "https://pl.wikipedia.org/wiki/Sighi%C8%99oara"),
                                Info(name: "Braszów", description: "Miasto u stóp Karpat z Czarnym Kościołem.", imageURL: "https://loremflickr.com/800/600/brasov", wikipediaURL: "https://pl.wikipedia.org/wiki/Brasz%C3%B3w")
                            ],
                            nature: [
                                Info(name: "Karpaty", description: "Dzikie góry i niedźwiedzie brunatne.", imageURL: "https://loremflickr.com/800/600/carpathians", wikipediaURL: "https://pl.wikipedia.org/wiki/Karpaty"),
                                Info(name: "Trasa Transfogarska", description: "Spektakularna droga górska.", imageURL: "https://loremflickr.com/800/600/transfagarasan", wikipediaURL: "https://pl.wikipedia.org/wiki/Droga_Transfogarska"),
                                Info(name: "Delta Dunaju", description: "Rezerwat biosfery i ptaków.", imageURL: "https://loremflickr.com/800/600/danubedelta", wikipediaURL: "https://pl.wikipedia.org/wiki/Delta_Dunaju")
                            ]
                        ),

                        // 36. SAN MARINO 🇸🇲
                        CountryD(
                            name: "San Marino",
                            capital: "San Marino",
                            continent: "Europa",
                            currency: "Euro (EUR)",
                            flag: "🇸🇲",
                            lang: ["Włoski"],
                            population: 34_000,
                            culture: [
                                Info(name: "Najstarsza Republika", description: "Państwo założone w 301 roku.", imageURL: "https://loremflickr.com/800/600/flag,sanmarino", wikipediaURL: "https://pl.wikipedia.org/wiki/San_Marino"),
                                Info(name: "Trzy Wieże", description: "Fortyfikacje na szczycie góry.", imageURL: "https://loremflickr.com/800/600/towers,fortress", wikipediaURL: "https://pl.wikipedia.org/wiki/San_Marino_(miasto)")
                            ],
                            cities: [
                                Info(name: "San Marino", description: "Stolica na zboczach Monte Titano.", imageURL: "https://loremflickr.com/800/600/sanmarino,city", wikipediaURL: "https://pl.wikipedia.org/wiki/San_Marino_(miasto)"),
                                Info(name: "Serravalle", description: "Największe miasto republiki.", imageURL: "https://loremflickr.com/800/600/medieval,town", wikipediaURL: "https://pl.wikipedia.org/wiki/Serravalle_(San_Marino)"),
                                Info(name: "Borgo Maggiore", description: "Miasteczko handlowe u stóp stolicy.", imageURL: "https://loremflickr.com/800/600/italy,village", wikipediaURL: "https://pl.wikipedia.org/wiki/Borgo_Maggiore")
                            ],
                            nature: [
                                Info(name: "Monte Titano", description: "Góra, na której leży państwo.", imageURL: "https://loremflickr.com/800/600/mountain,view", wikipediaURL: "https://pl.wikipedia.org/wiki/Monte_Titano"),
                                Info(name: "Widok na Adriatyk", description: "Panorama sięgająca morza.", imageURL: "https://loremflickr.com/800/600/adriatic,view", wikipediaURL: "https://pl.wikipedia.org/wiki/Geografia_San_Marino"),
                                Info(name: "Apeniny", description: "Górzyste otoczenie enklawy.", imageURL: "https://loremflickr.com/800/600/apennines", wikipediaURL: "https://pl.wikipedia.org/wiki/Apeniny")
                            ]
                        ),

                        // 37. SERBIA 🇷🇸
                        CountryD(
                            name: "Serbia",
                            capital: "Belgrad",
                            continent: "Europa",
                            currency: "Dinar serbski (RSD)",
                            flag: "🇷🇸",
                            lang: ["Serbski"],
                            population: 6_900_000,
                            culture: [
                                Info(name: "Cerkiew św. Sawy", description: "Jedna z największych cerkwi na świecie.", imageURL: "https://loremflickr.com/800/600/saintsava", wikipediaURL: "https://pl.wikipedia.org/wiki/Cerkiew_%C5%9Bwi%C4%99tego_Sawy_w_Belgradzie"),
                                Info(name: "Rakija", description: "Narodowy trunek owocowy.", imageURL: "https://loremflickr.com/800/600/rakija", wikipediaURL: "https://pl.wikipedia.org/wiki/Rakija")
                            ],
                            cities: [
                                Info(name: "Belgrad", description: "Stolica przy ujściu Sawy do Dunaju.", imageURL: "https://loremflickr.com/800/600/belgrade", wikipediaURL: "https://pl.wikipedia.org/wiki/Belgrad"),
                                Info(name: "Nowy Sad", description: "Miasto kultury i twierdzy Petrovaradin.", imageURL: "https://loremflickr.com/800/600/novisad", wikipediaURL: "https://pl.wikipedia.org/wiki/Nowy_Sad"),
                                Info(name: "Nisz", description: "Miejsce urodzenia Konstantyna Wielkiego.", imageURL: "https://loremflickr.com/800/600/nis", wikipediaURL: "https://pl.wikipedia.org/wiki/Nisz")
                            ],
                            nature: [
                                Info(name: "Park Tara", description: "Góry i kanion rzeki Driny.", imageURL: "https://loremflickr.com/800/600/tara,mountains", wikipediaURL: "https://pl.wikipedia.org/wiki/Park_Narodowy_Tara"),
                                Info(name: "Meandry Uvac", description: "Rzeka tworząca niezwykłe zakola.", imageURL: "https://loremflickr.com/800/600/uvac", wikipediaURL: "https://pl.wikipedia.org/wiki/Uvac"),
                                Info(name: "Miasto Diabła", description: "Formacje skalne Đavolja Varoš.", imageURL: "https://loremflickr.com/800/600/rockformation", wikipediaURL: "https://pl.wikipedia.org/wiki/%C4%90avolja_Varo%C5%A1")
                            ]
                        ),

                        // 38. SŁOWACJA 🇸🇰
                        CountryD(
                            name: "Słowacja",
                            capital: "Bratysława",
                            continent: "Europa",
                            currency: "Euro (EUR)",
                            flag: "🇸🇰",
                            lang: ["Słowacki"],
                            population: 5_400_000,
                            culture: [
                                Info(name: "Janosik", description: "Karpacki zbójnik, bohater ludowy.", imageURL: "https://loremflickr.com/800/600/folk,costume", wikipediaURL: "https://pl.wikipedia.org/wiki/Juraj_J%C3%A1no%C5%A1%C3%ADk"),
                                Info(name: "Zamek Spiski", description: "Jeden z największych zamków Europy.", imageURL: "https://loremflickr.com/800/600/spiscastle", wikipediaURL: "https://pl.wikipedia.org/wiki/Zamek_Spiski")
                            ],
                            cities: [
                                Info(name: "Bratysława", description: "Stolica nad Dunajem z zamkiem.", imageURL: "https://loremflickr.com/800/600/bratislava", wikipediaURL: "https://pl.wikipedia.org/wiki/Bratys%C5%82awa"),
                                Info(name: "Koszyce", description: "Miasto z gotycką katedrą św. Elżbiety.", imageURL: "https://loremflickr.com/800/600/kosice", wikipediaURL: "https://pl.wikipedia.org/wiki/Koszyce_(miasto_na_S%C5%82owacji)"),
                                Info(name: "Bańska Szczawnica", description: "Zabytkowe miasto górnicze.", imageURL: "https://loremflickr.com/800/600/banskastiavnica", wikipediaURL: "https://pl.wikipedia.org/wiki/Ba%C5%84ska_Szczawnica")
                            ],
                            nature: [
                                Info(name: "Tatry Wysokie", description: "Najwyższe pasmo Karpat.", imageURL: "https://loremflickr.com/800/600/hightatras", wikipediaURL: "https://pl.wikipedia.org/wiki/Tatry"),
                                Info(name: "Słowacki Raj", description: "Wąwozy z drabinami i wodospadami.", imageURL: "https://loremflickr.com/800/600/slovakparadise", wikipediaURL: "https://pl.wikipedia.org/wiki/S%C5%82owacki_Raj"),
                                Info(name: "Jaskinie", description: "Tysiące jaskiń, w tym lodowe.", imageURL: "https://loremflickr.com/800/600/icecave", wikipediaURL: "https://pl.wikipedia.org/wiki/Jaskinie_S%C5%82owacji")
                            ]
                        ),

                        // 39. SŁOWENIA 🇸🇮
                        CountryD(
                            name: "Słowenia",
                            capital: "Lublana",
                            continent: "Europa",
                            currency: "Euro (EUR)",
                            flag: "🇸🇮",
                            lang: ["Słoweński"],
                            population: 2_100_000,
                            culture: [
                                Info(name: "Smoki", description: "Symbol Lublany (Smoczy Most).", imageURL: "https://loremflickr.com/800/600/dragon,bridge", wikipediaURL: "https://pl.wikipedia.org/wiki/Smoczy_Most"),
                                Info(name: "Pszczelarstwo", description: "Tradycyjne malowane ule.", imageURL: "https://loremflickr.com/800/600/beehive", wikipediaURL: "https://pl.wikipedia.org/wiki/Pszczelarstwo")
                            ],
                            cities: [
                                Info(name: "Lublana", description: "Zielona stolica Europy.", imageURL: "https://loremflickr.com/800/600/ljubljana", wikipediaURL: "https://pl.wikipedia.org/wiki/Lublana"),
                                Info(name: "Bled", description: "Miasteczko z wyspą na jeziorze.", imageURL: "https://loremflickr.com/800/600/lakebled", wikipediaURL: "https://pl.wikipedia.org/wiki/Bled"),
                                Info(name: "Piran", description: "Perła architektury weneckiej nad morzem.", imageURL: "https://loremflickr.com/800/600/piran", wikipediaURL: "https://pl.wikipedia.org/wiki/Piran")
                            ],
                            nature: [
                                Info(name: "Jaskinia Postojna", description: "Jaskinia ze zwiedzaniem kolejką.", imageURL: "https://loremflickr.com/800/600/postojnacave", wikipediaURL: "https://pl.wikipedia.org/wiki/Jaskinia_Postojna"),
                                Info(name: "Triglav", description: "Najwyższy szczyt i symbol narodowy.", imageURL: "https://loremflickr.com/800/600/triglav", wikipediaURL: "https://pl.wikipedia.org/wiki/Triglav"),
                                Info(name: "Dolina Sočy", description: "Turkusowa rzeka alpejska.", imageURL: "https://loremflickr.com/800/600/socariver", wikipediaURL: "https://pl.wikipedia.org/wiki/So%C4%8Da")
                            ]
                        ),

                        // 40. SZWAJCARIA 🇨🇭
                        CountryD(
                            name: "Szwajcaria",
                            capital: "Berno",
                            continent: "Europa",
                            currency: "Frank szwajcarski (CHF)",
                            flag: "🇨🇭",
                            lang: ["Niemiecki", "Francuski", "Włoski"],
                            population: 8_700_000,
                            culture: [
                                Info(name: "Zegarki", description: "Symbol precyzji i luksusu.", imageURL: "https://loremflickr.com/800/600/watch", wikipediaURL: "https://pl.wikipedia.org/wiki/Zegarek"),
                                Info(name: "Czekolada i Ser", description: "Fondue i najlepsza czekolada.", imageURL: "https://loremflickr.com/800/600/fondue", wikipediaURL: "https://pl.wikipedia.org/wiki/Czekolada")
                            ],
                            cities: [
                                Info(name: "Zurych", description: "Centrum finansowe nad jeziorem.", imageURL: "https://loremflickr.com/800/600/zurich", wikipediaURL: "https://pl.wikipedia.org/wiki/Zurych"),
                                Info(name: "Genewa", description: "Siedziba organizacji międzynarodowych.", imageURL: "https://loremflickr.com/800/600/geneva", wikipediaURL: "https://pl.wikipedia.org/wiki/Genewa"),
                                Info(name: "Berno", description: "Stolica ze średniowieczną starówką.", imageURL: "https://loremflickr.com/800/600/bern", wikipediaURL: "https://pl.wikipedia.org/wiki/Berno")
                            ],
                            nature: [
                                Info(name: "Matterhorn", description: "Najsłynniejszy szczyt Alp.", imageURL: "https://loremflickr.com/800/600/matterhorn", wikipediaURL: "https://pl.wikipedia.org/wiki/Matterhorn"),
                                Info(name: "Jezioro Genewskie", description: "Wielkie jezioro alpejskie.", imageURL: "https://loremflickr.com/800/600/lakegeneva", wikipediaURL: "https://pl.wikipedia.org/wiki/Jezioro_Genewskie"),
                                Info(name: "Wodospad Renu", description: "Największy wodospad w Europie.", imageURL: "https://loremflickr.com/800/600/rhinefalls", wikipediaURL: "https://pl.wikipedia.org/wiki/Wodospad_Renu")
                            ]
                        ),

                        // 41. SZWECJA 🇸🇪
                        CountryD(
                            name: "Szwecja",
                            capital: "Sztokholm",
                            continent: "Europa",
                            currency: "Korona szwedzka (SEK)",
                            flag: "🇸🇪",
                            lang: ["Szwedzki"],
                            population: 10_400_000,
                            culture: [
                                Info(name: "Fika", description: "Tradycyjna przerwa na kawę.", imageURL: "https://loremflickr.com/800/600/coffee,cinnamonbun", wikipediaURL: "https://pl.wikipedia.org/wiki/Fika_(kultura)"),
                                Info(name: "Vasa", description: "Muzeum XVII-wiecznego okrętu.", imageURL: "https://loremflickr.com/800/600/vasaship", wikipediaURL: "https://pl.wikipedia.org/wiki/Muzeum_Okr%C4%99tu_Vasa")
                            ],
                            cities: [
                                Info(name: "Sztokholm", description: "Miasto na 14 wyspach.", imageURL: "https://loremflickr.com/800/600/stockholm", wikipediaURL: "https://pl.wikipedia.org/wiki/Sztokholm"),
                                Info(name: "Goteborg", description: "Miasto portowe i studenckie.", imageURL: "https://loremflickr.com/800/600/gothenburg", wikipediaURL: "https://pl.wikipedia.org/wiki/G%C3%B6teborg"),
                                Info(name: "Malmö", description: "Miasto połączone mostem z Danią.", imageURL: "https://loremflickr.com/800/600/malmo", wikipediaURL: "https://pl.wikipedia.org/wiki/Malm%C3%B6")
                            ],
                            nature: [
                                Info(name: "Archipelag", description: "Tysiące wysp wokół stolicy.", imageURL: "https://loremflickr.com/800/600/archipelago", wikipediaURL: "https://pl.wikipedia.org/wiki/Archipelag_Sztokholmski"),
                                Info(name: "Laponia", description: "Dzika północ i renifery.", imageURL: "https://loremflickr.com/800/600/lapland", wikipediaURL: "https://pl.wikipedia.org/wiki/Laponia_(region_kulturowy)"),
                                Info(name: "Zorza Polarna", description: "Spektakl świetlny w Abisko.", imageURL: "https://loremflickr.com/800/600/northernlights", wikipediaURL: "https://pl.wikipedia.org/wiki/Zorza_polarna")
                            ]
                        ),
                // 42. TURCJA 🇹🇷
                        CountryD(
                            name: "Turcja",
                            capital: "Ankara",
                            continent: "Europa",
                            currency: "Lira turecka (TRY)",
                            flag: "🇹🇷",
                            lang: ["Turecki"],
                            population: 84_000_000,
                            culture: [
                                Info(name: "Hagia Sophia", description: "Arcydzieło architektury w Stambule.", imageURL: "https://loremflickr.com/800/600/hagiasophia", wikipediaURL: "https://pl.wikipedia.org/wiki/Hagia_Sophia"),
                                Info(name: "Kawa po turecku", description: "Tradycyjny sposób parzenia kawy w tygielku.", imageURL: "https://loremflickr.com/800/600/turkishcoffee", wikipediaURL: "https://pl.wikipedia.org/wiki/Kawa_po_turecku")
                            ],
                            cities: [
                                Info(name: "Stambuł", description: "Miasto na dwóch kontynentach.", imageURL: "https://loremflickr.com/800/600/istanbul", wikipediaURL: "https://pl.wikipedia.org/wiki/Stambu%C5%82"),
                                Info(name: "Antalya", description: "Popularny kurort na Riwierze Tureckiej.", imageURL: "https://loremflickr.com/800/600/antalya", wikipediaURL: "https://pl.wikipedia.org/wiki/Antalya"),
                                Info(name: "Kapadocja", description: "Kraina słynąca z lotów balonem.", imageURL: "https://loremflickr.com/800/600/cappadocia,balloon", wikipediaURL: "https://pl.wikipedia.org/wiki/Kapadocja")
                            ],
                            nature: [
                                Info(name: "Pamukkale", description: "Wapienne tarasy termalne.", imageURL: "https://loremflickr.com/800/600/pamukkale", wikipediaURL: "https://pl.wikipedia.org/wiki/Pamukkale"),
                                Info(name: "Bosfor", description: "Cieśnina łącząca Europę z Azją.", imageURL: "https://loremflickr.com/800/600/bosphorus", wikipediaURL: "https://pl.wikipedia.org/wiki/Bosfor"),
                                Info(name: "Góra Ararat", description: "Najwyższy szczyt Turcji (wygasły wulkan).", imageURL: "https://loremflickr.com/800/600/ararat", wikipediaURL: "https://pl.wikipedia.org/wiki/Ararat")
                            ]
                        ),

                        // 43. UKRAINA 🇺🇦
                        CountryD(
                            name: "Ukraina",
                            capital: "Kijów",
                            continent: "Europa",
                            currency: "Hrywna (UAH)",
                            flag: "🇺🇦",
                            lang: ["Ukraiński"],
                            population: 41_000_000,
                            culture: [
                                Info(name: "Barszcz", description: "Tradycyjna zupa z buraków (UNESCO).", imageURL: "https://loremflickr.com/800/600/borscht", wikipediaURL: "https://pl.wikipedia.org/wiki/Barszcz_ukrai%C5%84ski"),
                                Info(name: "Ławra Peczerska", description: "Złote kopuły i pieczary w Kijowie.", imageURL: "https://loremflickr.com/800/600/kyivpechersklavra", wikipediaURL: "https://pl.wikipedia.org/wiki/%C5%81awra_Peczerska")
                            ],
                            cities: [
                                Info(name: "Kijów", description: "Stolica z bogatą historią Rusi.", imageURL: "https://loremflickr.com/800/600/kyiv", wikipediaURL: "https://pl.wikipedia.org/wiki/Kij%C3%B3w"),
                                Info(name: "Lwów", description: "Miasto kawy i architektury.", imageURL: "https://loremflickr.com/800/600/lviv", wikipediaURL: "https://pl.wikipedia.org/wiki/Lw%C3%B3w"),
                                Info(name: "Odessa", description: "Portowe miasto ze słynnymi schodami.", imageURL: "https://loremflickr.com/800/600/odessa", wikipediaURL: "https://pl.wikipedia.org/wiki/Odessa")
                            ],
                            nature: [
                                Info(name: "Karpaty", description: "Zielone góry z Howerlą.", imageURL: "https://loremflickr.com/800/600/carpathians,ukraine", wikipediaURL: "https://pl.wikipedia.org/wiki/Karpaty"),
                                Info(name: "Tunel Miłości", description: "Zielony tunel kolejowy w Klewaniu.", imageURL: "https://loremflickr.com/800/600/tunneloflove", wikipediaURL: "https://pl.wikipedia.org/wiki/Tunel_Mi%C5%82o%C5%9Bci"),
                                Info(name: "Dniepr", description: "Potężna rzeka przecinająca kraj.", imageURL: "https://loremflickr.com/800/600/dnipro,river", wikipediaURL: "https://pl.wikipedia.org/wiki/Dniepr")
                            ]
                        ),

                        // 44. WATYKAN 🇻🇦
                        CountryD(
                            name: "Watykan",
                            capital: "Watykan",
                            continent: "Europa",
                            currency: "Euro (EUR)",
                            flag: "🇻🇦",
                            lang: ["Włoski", "Łacina"],
                            population: 800,
                            culture: [
                                Info(name: "Bazylika św. Piotra", description: "Najważniejsza świątynia katolicka.", imageURL: "https://loremflickr.com/800/600/stpeterbasilica", wikipediaURL: "https://pl.wikipedia.org/wiki/Bazylika_%C5%9Bw._Piotra_na_Watykanie"),
                                Info(name: "Kaplica Sykstyńska", description: "Słynne freski Michała Anioła.", imageURL: "https://loremflickr.com/800/600/sistinechapel", wikipediaURL: "https://pl.wikipedia.org/wiki/Kaplica_Syksty%C5%84ska")
                            ],
                            cities: [
                                Info(name: "Watykan", description: "Enklawa w sercu Rzymu.", imageURL: "https://loremflickr.com/800/600/vatican,square", wikipediaURL: "https://pl.wikipedia.org/wiki/Watykan"),
                                Info(name: "Plac św. Piotra", description: "Ogromny plac z kolumnadą Berniniego.", imageURL: "https://loremflickr.com/800/600/stpeter,square", wikipediaURL: "https://pl.wikipedia.org/wiki/Plac_%C5%9Bw._Piotra"),
                                Info(name: "Muzea Watykańskie", description: "Bezcenna kolekcja sztuki.", imageURL: "https://loremflickr.com/800/600/vaticanmuseum", wikipediaURL: "https://pl.wikipedia.org/wiki/Muzea_Watyka%C5%84skie")
                            ],
                            nature: [
                                Info(name: "Ogrody Watykańskie", description: "Zajmują ponad połowę państwa.", imageURL: "https://loremflickr.com/800/600/vaticangardens", wikipediaURL: "https://pl.wikipedia.org/wiki/Ogrody_Watyka%C5%84skie"),
                                Info(name: "Fontanny", description: "Zabytkowe fontanny w ogrodach.", imageURL: "https://loremflickr.com/800/600/fountain,rome", wikipediaURL: "https://pl.wikipedia.org/wiki/Architektura_Watykanu"),
                                Info(name: "Gaj oliwny", description: "Symboliczne drzewa w ogrodach.", imageURL: "https://loremflickr.com/800/600/olivetree", wikipediaURL: "https://pl.wikipedia.org/wiki/Watykan")
                            ]
                        ),

                        // 45. WĘGRY 🇭🇺
                        CountryD(
                            name: "Węgry",
                            capital: "Budapeszt",
                            continent: "Europa",
                            currency: "Forint (HUF)",
                            flag: "🇭🇺",
                            lang: ["Węgierski"],
                            population: 9_700_000,
                            culture: [
                                Info(name: "Parlament", description: "Ikona Budapesztu nad Dunajem.", imageURL: "https://loremflickr.com/800/600/budapestparliament", wikipediaURL: "https://pl.wikipedia.org/wiki/Budynek_parlamentu_w_Budapeszcie"),
                                Info(name: "Termy", description: "Kraj słynący z kąpielisk termalnych.", imageURL: "https://loremflickr.com/800/600/thermalbath", wikipediaURL: "https://pl.wikipedia.org/wiki/Termy_Sz%C3%A9chenyiego")
                            ],
                            cities: [
                                Info(name: "Budapeszt", description: "Perła Dunaju.", imageURL: "https://loremflickr.com/800/600/budapest", wikipediaURL: "https://pl.wikipedia.org/wiki/Budapeszt"),
                                Info(name: "Eger", description: "Miasto wina i baroku.", imageURL: "https://loremflickr.com/800/600/eger", wikipediaURL: "https://pl.wikipedia.org/wiki/Eger"),
                                Info(name: "Szentendre", description: "Miasteczko artystów.", imageURL: "https://loremflickr.com/800/600/szentendre", wikipediaURL: "https://pl.wikipedia.org/wiki/Szentendre")
                            ],
                            nature: [
                                Info(name: "Balaton", description: "Węgierskie morze, płytkie jezioro.", imageURL: "https://loremflickr.com/800/600/lakebalaton", wikipediaURL: "https://pl.wikipedia.org/wiki/Balaton"),
                                Info(name: "Puszta", description: "Wielka nizina stepowa.", imageURL: "https://loremflickr.com/800/600/puszta", wikipediaURL: "https://pl.wikipedia.org/wiki/Hortob%C3%A1gy_(park_narodowy)"),
                                Info(name: "Jaskinie", description: "System krasowy Aggtelek.", imageURL: "https://loremflickr.com/800/600/cave,hungary", wikipediaURL: "https://pl.wikipedia.org/wiki/Park_Narodowy_Aggtelek")
                            ]
                        ),

                        // 46. WIELKA BRYTANIA 🇬🇧
                        CountryD(
                            name: "Wielka Brytania",
                            capital: "Londyn",
                            continent: "Europa",
                            currency: "Funt szterling (GBP)",
                            flag: "🇬🇧",
                            lang: ["Angielski"],
                            population: 67_000_000,
                            culture: [
                                Info(name: "Rodzina Królewska", description: "Monarchia i Pałac Buckingham.", imageURL: "https://loremflickr.com/800/600/buckinghampalace", wikipediaURL: "https://pl.wikipedia.org/wiki/Brytyjska_rodzina_kr%C3%B3lewska"),
                                Info(name: "Afternoon Tea", description: "Tradycja picia popołudniowej herbaty.", imageURL: "https://loremflickr.com/800/600/tea,scones", wikipediaURL: "https://pl.wikipedia.org/wiki/Tea_time")
                            ],
                            cities: [
                                Info(name: "Londyn", description: "Globalna metropolia z Big Benem.", imageURL: "https://loremflickr.com/800/600/london", wikipediaURL: "https://pl.wikipedia.org/wiki/Londyn"),
                                Info(name: "Edynburg", description: "Stolica Szkocji ze słynnym zamkiem.", imageURL: "https://loremflickr.com/800/600/edinburgh", wikipediaURL: "https://pl.wikipedia.org/wiki/Edynburg"),
                                Info(name: "Liverpool", description: "Miasto Beatlesów i piłki nożnej.", imageURL: "https://loremflickr.com/800/600/liverpool", wikipediaURL: "https://pl.wikipedia.org/wiki/Liverpool")
                            ],
                            nature: [
                                Info(name: "Stonehenge", description: "Tajemniczy krąg kamienny.", imageURL: "https://loremflickr.com/800/600/stonehenge", wikipediaURL: "https://pl.wikipedia.org/wiki/Stonehenge"),
                                Info(name: "Szkockie Highlands", description: "Dzikie góry i jeziora (Loch Ness).", imageURL: "https://loremflickr.com/800/600/highlands", wikipediaURL: "https://pl.wikipedia.org/wiki/Highlands"),
                                Info(name: "Klify w Dover", description: "Białe wapienne urwiska.", imageURL: "https://loremflickr.com/800/600/whitecliffs", wikipediaURL: "https://pl.wikipedia.org/wiki/Bia%C5%82e_Klify_Dover")
                            ]
                        ),

                        // 47. WŁOCHY 🇮🇹
                        CountryD(
                            name: "Włochy",
                            capital: "Rzym",
                            continent: "Europa",
                            currency: "Euro (EUR)",
                            flag: "🇮🇹",
                            lang: ["Włoski"],
                            population: 59_000_000,
                            culture: [
                                Info(name: "Koloseum", description: "Symbol starożytnego Rzymu.", imageURL: "https://loremflickr.com/800/600/colosseum", wikipediaURL: "https://pl.wikipedia.org/wiki/Koloseum"),
                                Info(name: "Pizza", description: "Najsłynniejsze danie świata z Neapolu.", imageURL: "https://loremflickr.com/800/600/pizza,italy", wikipediaURL: "https://pl.wikipedia.org/wiki/Pizza")
                            ],
                            cities: [
                                Info(name: "Rzym", description: "Wieczne Miasto pełne zabytków.", imageURL: "https://loremflickr.com/800/600/rome", wikipediaURL: "https://pl.wikipedia.org/wiki/Rzym"),
                                Info(name: "Wenecja", description: "Miasto na wodzie z gondolami.", imageURL: "https://loremflickr.com/800/600/venice", wikipediaURL: "https://pl.wikipedia.org/wiki/Wenecja"),
                                Info(name: "Florencja", description: "Kolebka renesansu.", imageURL: "https://loremflickr.com/800/600/florence", wikipediaURL: "https://pl.wikipedia.org/wiki/Florencja")
                            ],
                            nature: [
                                Info(name: "Dolomity", description: "Spektakularne góry.", imageURL: "https://loremflickr.com/800/600/dolomites", wikipediaURL: "https://pl.wikipedia.org/wiki/Dolomity"),
                                Info(name: "Wybrzeże Amalfi", description: "Malownicze klify i miasteczka.", imageURL: "https://loremflickr.com/800/600/amalficoast", wikipediaURL: "https://pl.wikipedia.org/wiki/Wybrze%C5%BCe_Amalfita%C5%84skie"),
                                Info(name: "Etna", description: "Czynny wulkan na Sycylii.", imageURL: "https://loremflickr.com/800/600/etna,volcano", wikipediaURL: "https://pl.wikipedia.org/wiki/Etna")
                            ]
                        ),
                // 52. AFGANISTAN 🇦🇫
                        CountryD(
                            name: "Afganistan",
                            capital: "Kabul",
                            continent: "Azja",
                            currency: "Afgani (AFN)",
                            flag: "🇦🇫",
                            lang: ["Pashto", "Dari"],
                            population: 40_000_000,
                            culture: [
                                Info(name: "Buzkashi", description: "Narodowy sport konny, bardzo widowiskowy i brutalny.", imageURL: "https://loremflickr.com/800/600/buzkashi", wikipediaURL: "https://pl.wikipedia.org/wiki/Buzkashi"),
                                Info(name: "Latawce", description: "Puszczanie latawców to popularna rozrywka (zakazana przez Talibów).", imageURL: "https://loremflickr.com/800/600/kite,sky", wikipediaURL: "https://pl.wikipedia.org/wiki/Latawiec")
                            ],
                            cities: [
                                Info(name: "Kabul", description: "Stolica położona w dolinie otoczonej górami.", imageURL: "https://loremflickr.com/800/600/kabul", wikipediaURL: "https://pl.wikipedia.org/wiki/Kabul"),
                                Info(name: "Herat", description: "Historyczne miasto z wpływami perskimi i Błękitnym Meczetem.", imageURL: "https://loremflickr.com/800/600/herat,mosque", wikipediaURL: "https://pl.wikipedia.org/wiki/Herat"),
                                Info(name: "Bamian", description: "Dolina słynąca niegdyś z wielkich posągów Buddy.", imageURL: "https://loremflickr.com/800/600/bamiyan", wikipediaURL: "https://pl.wikipedia.org/wiki/Bamian")
                            ],
                            nature: [
                                Info(name: "Hindukusz", description: "Potężne pasmo górskie, 'Dach Świata'.", imageURL: "https://loremflickr.com/800/600/hindukush", wikipediaURL: "https://pl.wikipedia.org/wiki/Hindukusz"),
                                Info(name: "Jeziora Band-e Amir", description: "Sześć szafirowych jezior w sercu gór.", imageURL: "https://loremflickr.com/800/600/bandeamir", wikipediaURL: "https://pl.wikipedia.org/wiki/Band-e_Amir"),
                                Info(name: "Dolina Pandższeru", description: "Malownicza dolina rzeczna.", imageURL: "https://loremflickr.com/800/600/panjshir", wikipediaURL: "https://pl.wikipedia.org/wiki/Dolina_Pand%C5%BCszeru")
                            ]
                        ),

                        // 53. ALGIERIA 🇩🇿
                        CountryD(
                            name: "Algieria",
                            capital: "Algier",
                            continent: "Afryka",
                            currency: "Dinar algierski (DZD)",
                            flag: "🇩🇿",
                            lang: ["Arabski", "Berberyjski"],
                            population: 44_000_000,
                            culture: [
                                Info(name: "Kasbah", description: "Stara część Algieru, labirynt uliczek (UNESCO).", imageURL: "https://loremflickr.com/800/600/casbah,algiers", wikipediaURL: "https://pl.wikipedia.org/wiki/Kasba"),
                                Info(name: "Tuaregowie", description: "Berberyjski lud koczowniczy z Sahary.", imageURL: "https://loremflickr.com/800/600/tuareg", wikipediaURL: "https://pl.wikipedia.org/wiki/Tuaregowie")
                            ],
                            cities: [
                                Info(name: "Algier", description: "Białe Miasto nad Morzem Śródziemnym.", imageURL: "https://loremflickr.com/800/600/algiers", wikipediaURL: "https://pl.wikipedia.org/wiki/Algier"),
                                Info(name: "Oran", description: "Miejsce narodzin muzyki Raï.", imageURL: "https://loremflickr.com/800/600/oran,algeria", wikipediaURL: "https://pl.wikipedia.org/wiki/Oran"),
                                Info(name: "Konstantyna", description: "Miasto Mostów, zbudowane na skale.", imageURL: "https://loremflickr.com/800/600/constantine,bridge", wikipediaURL: "https://pl.wikipedia.org/wiki/Konstantyna_(Algieria)")
                            ],
                            nature: [
                                Info(name: "Sahara", description: "Największa gorąca pustynia świata.", imageURL: "https://loremflickr.com/800/600/sahara,dunes", wikipediaURL: "https://pl.wikipedia.org/wiki/Sahara"),
                                Info(name: "Góry Hoggar", description: "Wulkaniczne pasmo górskie na pustyni.", imageURL: "https://loremflickr.com/800/600/hoggar", wikipediaURL: "https://pl.wikipedia.org/wiki/Ahaggar"),
                                Info(name: "Tassili n’Ajjer", description: "Płaskowyż z prehistorycznymi malowidłami naskalnymi.", imageURL: "https://loremflickr.com/800/600/tassili", wikipediaURL: "https://pl.wikipedia.org/wiki/Tassili_n%E2%80%99Ajjer")
                            ]
                        ),

                        // 54. ARABIA SAUDYJSKA 🇸🇦
                        CountryD(
                            name: "Arabia Saudyjska",
                            capital: "Rijad",
                            continent: "Azja",
                            currency: "Rial saudyjski (SAR)",
                            flag: "🇸🇦",
                            lang: ["Arabski"],
                            population: 35_000_000,
                            culture: [
                                Info(name: "Mekka", description: "Święte miasto islamu i cel pielgrzymek.", imageURL: "https://loremflickr.com/800/600/kaaba", wikipediaURL: "https://pl.wikipedia.org/wiki/Mekka"),
                                Info(name: "Kawa Arabska", description: "Symbol gościnności, wpisany na listę UNESCO.", imageURL: "https://loremflickr.com/800/600/arabiccoffee", wikipediaURL: "https://pl.wikipedia.org/wiki/Kawa_po_arabsku")
                            ],
                            cities: [
                                Info(name: "Rijad", description: "Nowoczesna stolica na pustyni.", imageURL: "https://loremflickr.com/800/600/riyadh", wikipediaURL: "https://pl.wikipedia.org/wiki/Rijad"),
                                Info(name: "Dżudda", description: "Historyczny port i brama do Mekki.", imageURL: "https://loremflickr.com/800/600/jeddah", wikipediaURL: "https://pl.wikipedia.org/wiki/D%C5%BCudda"),
                                Info(name: "Al-Ula", description: "Starożytne miasto w oazie, 'druga Petra'.", imageURL: "https://loremflickr.com/800/600/alula", wikipediaURL: "https://pl.wikipedia.org/wiki/Al-Ula")
                            ],
                            nature: [
                                Info(name: "Ar-Rab al-Chali", description: "Pusty Kwartał – największa pustynia piaszczysta.", imageURL: "https://loremflickr.com/800/600/rubalkhali", wikipediaURL: "https://pl.wikipedia.org/wiki/Ar-Rab_al-Chali"),
                                Info(name: "Morze Czerwone", description: "Nienaruszone rafy koralowe.", imageURL: "https://loremflickr.com/800/600/redsea", wikipediaURL: "https://pl.wikipedia.org/wiki/Morze_Czerwone"),
                                Info(name: "Edge of the World", description: "Spektakularny klif skalny koło Rijadu.", imageURL: "https://loremflickr.com/800/600/edgeoftheworld", wikipediaURL: "https://en.wikipedia.org/wiki/Jebel_Fihrayn")
                            ]
                        ),

                        // 55. ARGENTYNA 🇦🇷
                        CountryD(
                            name: "Argentyna",
                            capital: "Buenos Aires",
                            continent: "Ameryka Południowa",
                            currency: "Peso argentyńskie (ARS)",
                            flag: "🇦🇷",
                            lang: ["Hiszpański"],
                            population: 45_000_000,
                            culture: [
                                Info(name: "Tango", description: "Taniec pełen pasji, narodzony w Buenos Aires.", imageURL: "https://loremflickr.com/800/600/tango", wikipediaURL: "https://pl.wikipedia.org/wiki/Tango_(taniec)"),
                                Info(name: "Asado", description: "Słynny argentyński grill i steki.", imageURL: "https://loremflickr.com/800/600/asado,steak", wikipediaURL: "https://pl.wikipedia.org/wiki/Asado")
                            ],
                            cities: [
                                Info(name: "Buenos Aires", description: "Paryż Południa, miasto szerokich alei.", imageURL: "https://loremflickr.com/800/600/buenosaires", wikipediaURL: "https://pl.wikipedia.org/wiki/Buenos_Aires"),
                                Info(name: "Mendoza", description: "Stolica argentyńskiego wina (Malbec).", imageURL: "https://loremflickr.com/800/600/mendoza,vineyard", wikipediaURL: "https://pl.wikipedia.org/wiki/Mendoza_(miasto)"),
                                Info(name: "Ushuaia", description: "Miasto na końcu świata (Ziemia Ognista).", imageURL: "https://loremflickr.com/800/600/ushuaia", wikipediaURL: "https://pl.wikipedia.org/wiki/Ushuaia")
                            ],
                            nature: [
                                Info(name: "Wodospady Iguazu", description: "Potężny kompleks wodospadów na granicy z Brazylią.", imageURL: "https://loremflickr.com/800/600/iguazufalls", wikipediaURL: "https://pl.wikipedia.org/wiki/Wodospad_Iguaz%C3%BA"),
                                Info(name: "Lodowiec Perito Moreno", description: "Jeden z nielicznych rosnących lodowców.", imageURL: "https://loremflickr.com/800/600/peritomoreno", wikipediaURL: "https://pl.wikipedia.org/wiki/Perito_Moreno_(lodowiec)"),
                                Info(name: "Aconcagua", description: "Najwyższy szczyt obu Ameryk.", imageURL: "https://loremflickr.com/800/600/aconcagua", wikipediaURL: "https://pl.wikipedia.org/wiki/Aconcagua")
                            ]
                        ),

                        // 56. AUSTRALIA 🇦🇺
                        CountryD(
                            name: "Australia",
                            capital: "Canberra",
                            continent: "Australia i Oceania",
                            currency: "Dolar australijski (AUD)",
                            flag: "🇦🇺",
                            lang: ["Angielski"],
                            population: 26_000_000,
                            culture: [
                                Info(name: "Aborygeni", description: "Rdzenna ludność o najstarszej ciągłej kulturze świata.", imageURL: "https://loremflickr.com/800/600/aboriginal,art", wikipediaURL: "https://pl.wikipedia.org/wiki/Aborygeni_australijscy"),
                                Info(name: "Surfing", description: "Sport narodowy i styl życia na wybrzeżu.", imageURL: "https://loremflickr.com/800/600/surfing,australia", wikipediaURL: "https://pl.wikipedia.org/wiki/Surfing")
                            ],
                            cities: [
                                Info(name: "Sydney", description: "Miasto z Operą i mostem Harbour Bridge.", imageURL: "https://loremflickr.com/800/600/sydney,opera", wikipediaURL: "https://pl.wikipedia.org/wiki/Sydney"),
                                Info(name: "Melbourne", description: "Kulturalna i kawowa stolica kraju.", imageURL: "https://loremflickr.com/800/600/melbourne", wikipediaURL: "https://pl.wikipedia.org/wiki/Melbourne"),
                                Info(name: "Brisbane", description: "Słoneczne miasto w Queensland.", imageURL: "https://loremflickr.com/800/600/brisbane", wikipediaURL: "https://pl.wikipedia.org/wiki/Brisbane")
                            ],
                            nature: [
                                Info(name: "Wielka Rafa Koralowa", description: "Największa rafa na świecie, widoczna z kosmosu.", imageURL: "https://loremflickr.com/800/600/greatbarrierreef", wikipediaURL: "https://pl.wikipedia.org/wiki/Wielka_Rafa_Koralowa"),
                                Info(name: "Uluru", description: "Święta czerwona skała w sercu kontynentu.", imageURL: "https://loremflickr.com/800/600/uluru", wikipediaURL: "https://pl.wikipedia.org/wiki/Uluru"),
                                Info(name: "Kangury i Koale", description: "Unikalne zwierzęta, których nie spotkasz dziko nigdzie indziej.", imageURL: "https://loremflickr.com/800/600/kangaroo", wikipediaURL: "https://pl.wikipedia.org/wiki/Fauna_Australii")
                            ]
                        ),
                // 57. ANGOLA 🇦🇴
                        CountryD(
                            name: "Angola",
                            capital: "Luanda",
                            continent: "Afryka",
                            currency: "Kwanza (AOA)",
                            flag: "🇦🇴",
                            lang: ["Portugalski"],
                            population: 34_000_000,
                            culture: [
                                Info(name: "Kizomba", description: "Zmysłowy taniec i gatunek muzyczny, który narodził się w Angoli.", imageURL: "https://loremflickr.com/800/600/kizomba,dance", wikipediaURL: "https://pl.wikipedia.org/wiki/Kizomba"),
                                Info(name: "O Pensador", description: "Rzeźba 'Myśliciela', symbol narodowej kultury ludu Chokwe.", imageURL: "https://loremflickr.com/800/600/woodsculpture", wikipediaURL: "https://pl.wikipedia.org/wiki/Kultura_Angoli")
                            ],
                            cities: [
                                Info(name: "Luanda", description: "Stolica i jedno z najdroższych miast świata, położone nad oceanem.", imageURL: "https://loremflickr.com/800/600/luanda", wikipediaURL: "https://pl.wikipedia.org/wiki/Luanda"),
                                Info(name: "Lubango", description: "Miasto w górach ze słynną statuą Chrystusa Króla (podobnie jak w Rio).", imageURL: "https://loremflickr.com/800/600/lubango", wikipediaURL: "https://pl.wikipedia.org/wiki/Lubango"),
                                Info(name: "Benguela", description: "Miasto o kolonialnej architekturze art déco i pięknych plażach.", imageURL: "https://loremflickr.com/800/600/benguela", wikipediaURL: "https://pl.wikipedia.org/wiki/Benguela")
                            ],
                            nature: [
                                Info(name: "Wodospady Kalandula", description: "Drugie co do wielkości wodospady w Afryce.", imageURL: "https://loremflickr.com/800/600/kalandulafalls", wikipediaURL: "https://pl.wikipedia.org/wiki/Wodospady_Kalandula"),
                                Info(name: "Miradouro da Lua", description: "Księżycowy punkt widokowy z niezwykłymi formacjami skalnymi.", imageURL: "https://loremflickr.com/800/600/moonlandscape,rock", wikipediaURL: "https://en.wikipedia.org/wiki/Miradouro_da_Lua"),
                                Info(name: "Pustynia Namib", description: "Najstarsza pustynia świata, której północna część leży w Angoli.", imageURL: "https://loremflickr.com/800/600/namibdesert", wikipediaURL: "https://pl.wikipedia.org/wiki/Namib")
                            ]
                        ),
                // 58. ANTIGUA I BARBUDA 🇦🇬
                        CountryD(
                            name: "Antigua i Barbuda",
                            capital: "Saint John’s",
                            continent: "Ameryka Północna",
                            currency: "Dolar wschodniokaraibski (XCD)",
                            flag: "🇦🇬",
                            lang: ["Angielski"],
                            population: 98_000,
                            culture: [
                                Info(name: "Antigua Sailing Week", description: "Jedne z najważniejszych regat żeglarskich na świecie.", imageURL: "https://loremflickr.com/800/600/sailing,regatta", wikipediaURL: "https://pl.wikipedia.org/wiki/Antigua_Sailing_Week"),
                                Info(name: "Karnawał", description: "Barwne święto wyzwolenia z niewolnictwa obchodzone latem.", imageURL: "https://loremflickr.com/800/600/carnival,caribbean", wikipediaURL: "https://en.wikipedia.org/wiki/Antigua_Carnival")
                            ],
                            cities: [
                                Info(name: "Saint John’s", description: "Stolica z barokową katedrą i tętniącym życiem portem.", imageURL: "https://loremflickr.com/800/600/stjohns,antigua", wikipediaURL: "https://pl.wikipedia.org/wiki/Saint_John%E2%80%99s"),
                                Info(name: "English Harbour", description: "Historyczny port i baza marynarki brytyjskiej.", imageURL: "https://loremflickr.com/800/600/englishharbour", wikipediaURL: "https://en.wikipedia.org/wiki/English_Harbour"),
                                Info(name: "Codrington", description: "Główna osada na siostrzanej wyspie Barbuda.", imageURL: "https://loremflickr.com/800/600/barbuda,village", wikipediaURL: "https://pl.wikipedia.org/wiki/Codrington_(Antigua_i_Barbuda)")
                            ],
                            nature: [
                                Info(name: "365 Plaży", description: "Kraj reklamuje się posiadaniem innej plaży na każdy dzień roku.", imageURL: "https://loremflickr.com/800/600/antigua,beach", wikipediaURL: "https://en.wikipedia.org/wiki/Geography_of_Antigua_and_Barbuda"),
                                Info(name: "Devil’s Bridge", description: "Most Diabła – naturalny łuk skalny wyrzeźbiony przez fale Atlantyku.", imageURL: "https://loremflickr.com/800/600/devilsbridge,rock", wikipediaURL: "https://en.wikipedia.org/wiki/Devil%27s_Bridge_(Antigua_and_Barbuda)"),
                                Info(name: "Nelson’s Dockyard", description: "Park narodowy i historyczna stocznia (UNESCO).", imageURL: "https://loremflickr.com/800/600/nelsonsdockyard", wikipediaURL: "https://pl.wikipedia.org/wiki/Nelson%E2%80%99s_Dockyard")
                            ]
                        ),
                // 59. STANY ZJEDNOCZONE 🇺🇸
                        CountryD(
                            name: "Stany Zjednoczone",
                            capital: "Waszyngton",
                            continent: "Ameryka Północna",
                            currency: "Dolar amerykański (USD)",
                            flag: "🇺🇸",
                            lang: ["Angielski"],
                            population: 331_000_000,
                            culture: [
                                Info(name: "Hollywood", description: "Światowa stolica przemysłu filmowego.", imageURL: "https://loremflickr.com/800/600/hollywood,sign", wikipediaURL: "https://pl.wikipedia.org/wiki/Hollywood"),
                                Info(name: "Statua Wolności", description: "Symbol wolności i demokracji w Nowym Jorku.", imageURL: "https://loremflickr.com/800/600/statueofliberty", wikipediaURL: "https://pl.wikipedia.org/wiki/Statua_Wolno%C5%9Bci")
                            ],
                            cities: [
                                Info(name: "Nowy Jork", description: "Miasto, które nigdy nie śpi.", imageURL: "https://loremflickr.com/800/600/newyorkcity", wikipediaURL: "https://pl.wikipedia.org/wiki/Nowy_Jork"),
                                Info(name: "Los Angeles", description: "Miasto aniołów, celebrytów i plaż.", imageURL: "https://loremflickr.com/800/600/losangeles", wikipediaURL: "https://pl.wikipedia.org/wiki/Los_Angeles"),
                                Info(name: "Las Vegas", description: "Światowa stolica rozrywki i hazardu.", imageURL: "https://loremflickr.com/800/600/lasvegas", wikipediaURL: "https://pl.wikipedia.org/wiki/Las_Vegas")
                            ],
                            nature: [
                                Info(name: "Wielki Kanion", description: "Jeden z cudów natury, ogromny przełom rzeki.", imageURL: "https://loremflickr.com/800/600/grandcanyon", wikipediaURL: "https://pl.wikipedia.org/wiki/Wielki_Kanion_Kolorado"),
                                Info(name: "Park Yellowstone", description: "Gejzery, gorące źródła i bizony.", imageURL: "https://loremflickr.com/800/600/yellowstone", wikipediaURL: "https://pl.wikipedia.org/wiki/Park_Narodowy_Yellowstone"),
                                Info(name: "Yosemite", description: "Granitowe klify i wodospady.", imageURL: "https://loremflickr.com/800/600/yosemite", wikipediaURL: "https://pl.wikipedia.org/wiki/Park_Narodowy_Yosemite")
                            ]
                        ),

                        // 60. JAPONIA 🇯🇵
                        CountryD(
                            name: "Japonia",
                            capital: "Tokio",
                            continent: "Azja",
                            currency: "Jen (JPY)",
                            flag: "🇯🇵",
                            lang: ["Japoński"],
                            population: 125_800_000,
                            culture: [
                                Info(name: "Świątynie", description: "Tysiącletnie tradycje buddyjskie i shinto (np. Senso-ji).", imageURL: "https://loremflickr.com/800/600/japan,temple", wikipediaURL: "https://pl.wikipedia.org/wiki/Sens%C5%8D-ji"),
                                Info(name: "Sushi", description: "Najbardziej rozpoznawalne danie japońskie.", imageURL: "https://loremflickr.com/800/600/sushi", wikipediaURL: "https://pl.wikipedia.org/wiki/Sushi")
                            ],
                            cities: [
                                Info(name: "Tokio", description: "Największa metropolia świata, neonowy gąszcz.", imageURL: "https://loremflickr.com/800/600/tokyo", wikipediaURL: "https://pl.wikipedia.org/wiki/Tokio"),
                                Info(name: "Kioto", description: "Kulturalna stolica, miasto gejsz i świątyń.", imageURL: "https://loremflickr.com/800/600/kyoto", wikipediaURL: "https://pl.wikipedia.org/wiki/Kioto"),
                                Info(name: "Osaka", description: "Miasto słynące z ulicznego jedzenia i nowoczesności.", imageURL: "https://loremflickr.com/800/600/osaka", wikipediaURL: "https://pl.wikipedia.org/wiki/Osaka")
                            ],
                            nature: [
                                Info(name: "Góra Fudżi", description: "Święty wulkan i symbol kraju.", imageURL: "https://loremflickr.com/800/600/mountfuji", wikipediaURL: "https://pl.wikipedia.org/wiki/Fud%C5%BCi"),
                                Info(name: "Kwitnąca Wiśnia", description: "Sakura – wiosenny spektakl natury.", imageURL: "https://loremflickr.com/800/600/cherryblossom", wikipediaURL: "https://pl.wikipedia.org/wiki/Hanami"),
                                Info(name: "Las Bambusowy", description: "Niezwykły las Arashiyama w Kioto.", imageURL: "https://loremflickr.com/800/600/bamboo,forest", wikipediaURL: "https://en.wikipedia.org/wiki/Arashiyama_Bamboo_Grove")
                            ]
                        ),

                        // 61. KANADA 🇨🇦
                        CountryD(
                            name: "Kanada",
                            capital: "Ottawa",
                            continent: "Ameryka Północna",
                            currency: "Dolar kanadyjski (CAD)",
                            flag: "🇨🇦",
                            lang: ["Angielski", "Francuski"],
                            population: 38_000_000,
                            culture: [
                                Info(name: "Hokej", description: "Sport narodowy i religia dla Kanadyjczyków.", imageURL: "https://loremflickr.com/800/600/icehockey", wikipediaURL: "https://pl.wikipedia.org/wiki/Hokej_na_lodzie"),
                                Info(name: "Syrop Klonowy", description: "Płynne złoto Kanady.", imageURL: "https://loremflickr.com/800/600/maplesyrup", wikipediaURL: "https://pl.wikipedia.org/wiki/Syrop_klonowy")
                            ],
                            cities: [
                                Info(name: "Toronto", description: "Największe miasto z wieżą CN Tower.", imageURL: "https://loremflickr.com/800/600/toronto", wikipediaURL: "https://pl.wikipedia.org/wiki/Toronto"),
                                Info(name: "Vancouver", description: "Miasto otoczone górami i oceanem.", imageURL: "https://loremflickr.com/800/600/vancouver", wikipediaURL: "https://pl.wikipedia.org/wiki/Vancouver"),
                                Info(name: "Montreal", description: "Centrum francuskojęzycznej kultury.", imageURL: "https://loremflickr.com/800/600/montreal", wikipediaURL: "https://pl.wikipedia.org/wiki/Montreal")
                            ],
                            nature: [
                                Info(name: "Wodospad Niagara", description: "Słynny wodospad na granicy z USA.", imageURL: "https://loremflickr.com/800/600/niagarafalls", wikipediaURL: "https://pl.wikipedia.org/wiki/Wodospad_Niagara"),
                                Info(name: "Góry Skaliste", description: "Park Narodowy Banff i turkusowe jeziora.", imageURL: "https://loremflickr.com/800/600/banff,lake", wikipediaURL: "https://pl.wikipedia.org/wiki/Park_Narodowy_Banff"),
                                Info(name: "Zorza Polarna", description: "Widoczna na północy (Jukon).", imageURL: "https://loremflickr.com/800/600/northernlights,canada", wikipediaURL: "https://pl.wikipedia.org/wiki/Zorza_polarna")
                            ]
                        ),

                        // 62. BRAZYLIA 🇧🇷
                        CountryD(
                            name: "Brazylia",
                            capital: "Brasília",
                            continent: "Ameryka Południowa",
                            currency: "Real brazylijski (BRL)",
                            flag: "🇧🇷",
                            lang: ["Portugalski"],
                            population: 214_000_000,
                            culture: [
                                Info(name: "Karnawał w Rio", description: "Największa impreza taneczna świata.", imageURL: "https://loremflickr.com/800/600/carnival,rio", wikipediaURL: "https://pl.wikipedia.org/wiki/Karnawa%C5%82_w_Rio_de_Janeiro"),
                                Info(name: "Piłka nożna", description: "Brazylia to kraj futbolu (Pele, Neymar).", imageURL: "https://loremflickr.com/800/600/soccer,brazil", wikipediaURL: "https://pl.wikipedia.org/wiki/Reprezentacja_Brazylii_w_pi%C5%82ce_no%C5%BCnej_m%C4%99%C5%BCczyzn")
                            ],
                            cities: [
                                Info(name: "Rio de Janeiro", description: "Miasto Chrystusa Odkupiciela i plaży Copacabana.", imageURL: "https://loremflickr.com/800/600/riodejaneiro", wikipediaURL: "https://pl.wikipedia.org/wiki/Rio_de_Janeiro"),
                                Info(name: "São Paulo", description: "Gigantyczna metropolia finansowa.", imageURL: "https://loremflickr.com/800/600/saopaulo", wikipediaURL: "https://pl.wikipedia.org/wiki/S%C3%A3o_Paulo"),
                                Info(name: "Salvador", description: "Miasto o silnych korzeniach afrykańskich.", imageURL: "https://loremflickr.com/800/600/salvador,bahia", wikipediaURL: "https://pl.wikipedia.org/wiki/Salvador_(Brazylia)")
                            ],
                            nature: [
                                Info(name: "Amazonia", description: "Największy las deszczowy świata.", imageURL: "https://loremflickr.com/800/600/amazonrainforest", wikipediaURL: "https://pl.wikipedia.org/wiki/Amazonia"),
                                Info(name: "Wodospady Iguazu", description: "275 wodospadów na granicy z Argentyną.", imageURL: "https://loremflickr.com/800/600/iguazufalls", wikipediaURL: "https://pl.wikipedia.org/wiki/Wodospad_Iguaz%C3%BA"),
                                Info(name: "Pantanal", description: "Największe mokradła świata, raj dla zwierząt.", imageURL: "https://loremflickr.com/800/600/pantanal", wikipediaURL: "https://pl.wikipedia.org/wiki/Pantanal")
                            ]
                        ),

                        // 63. MEKSYK 🇲🇽
                        CountryD(
                            name: "Meksyk",
                            capital: "Meksyk",
                            continent: "Ameryka Północna",
                            currency: "Peso meksykańskie (MXN)",
                            flag: "🇲🇽",
                            lang: ["Hiszpański"],
                            population: 126_000_000,
                            culture: [
                                Info(name: "Día de los Muertos", description: "Kolorowe Święto Zmarłych.", imageURL: "https://loremflickr.com/800/600/dayofthedead", wikipediaURL: "https://pl.wikipedia.org/wiki/D%C3%ADa_de_Muertos"),
                                Info(name: "Kuchnia", description: "Tacos, guacamole i tequila.", imageURL: "https://loremflickr.com/800/600/tacos", wikipediaURL: "https://pl.wikipedia.org/wiki/Kuchnia_meksyka%C5%84ska")
                            ],
                            cities: [
                                Info(name: "Meksyk", description: "Jedna z największych stolic świata.", imageURL: "https://loremflickr.com/800/600/mexicocity", wikipediaURL: "https://pl.wikipedia.org/wiki/Meksyk_(miasto)"),
                                Info(name: "Cancún", description: "Karaibski kurort z białym piaskiem.", imageURL: "https://loremflickr.com/800/600/cancun", wikipediaURL: "https://pl.wikipedia.org/wiki/Canc%C3%BAn"),
                                Info(name: "Tulum", description: "Ruiny Majów na klifie nad morzem.", imageURL: "https://loremflickr.com/800/600/tulum", wikipediaURL: "https://pl.wikipedia.org/wiki/Tulum_(miasto_w_Meksyku)")
                            ],
                            nature: [
                                Info(name: "Cenotes", description: "Naturalne studnie krasowe z krystaliczną wodą.", imageURL: "https://loremflickr.com/800/600/cenote", wikipediaURL: "https://pl.wikipedia.org/wiki/Cenote"),
                                Info(name: "Kanion Miedziany", description: "System wąwozów większy niż w USA.", imageURL: "https://loremflickr.com/800/600/coppercanyon", wikipediaURL: "https://pl.wikipedia.org/wiki/Miedziany_Kanion"),
                                Info(name: "Wulkany", description: "Popocatépetl i inne szczyty.", imageURL: "https://loremflickr.com/800/600/volcano,mexico", wikipediaURL: "https://pl.wikipedia.org/wiki/Popocat%C3%A9petl")
                            ]
                        ),

                        // 64. EGIPT 🇪🇬
                        CountryD(
                            name: "Egipt",
                            capital: "Kair",
                            continent: "Afryka",
                            currency: "Funt egipski (EGP)",
                            flag: "🇪🇬",
                            lang: ["Arabski"],
                            population: 104_000_000,
                            culture: [
                                Info(name: "Piramidy", description: "Grobowce faraonów w Gizie.", imageURL: "https://loremflickr.com/800/600/pyramids", wikipediaURL: "https://pl.wikipedia.org/wiki/Piramidy_w_Gizie"),
                                Info(name: "Hieroglify", description: "Starożytne pismo egipskie.", imageURL: "https://loremflickr.com/800/600/hieroglyphs", wikipediaURL: "https://pl.wikipedia.org/wiki/Pismo_hieroglificzne")
                            ],
                            cities: [
                                Info(name: "Kair", description: "Chaotyczna stolica z Muzeum Egipskim.", imageURL: "https://loremflickr.com/800/600/cairo", wikipediaURL: "https://pl.wikipedia.org/wiki/Kair"),
                                Info(name: "Luksor", description: "Największe muzeum na wolnym powietrzu.", imageURL: "https://loremflickr.com/800/600/luxor", wikipediaURL: "https://pl.wikipedia.org/wiki/Luksor"),
                                Info(name: "Hurghada", description: "Kurort nad Morzem Czerwonym.", imageURL: "https://loremflickr.com/800/600/hurghada", wikipediaURL: "https://pl.wikipedia.org/wiki/Hurghada")
                            ],
                            nature: [
                                Info(name: "Nil", description: "Najdłuższa rzeka świata.", imageURL: "https://loremflickr.com/800/600/nile", wikipediaURL: "https://pl.wikipedia.org/wiki/Nil"),
                                Info(name: "Morze Czerwone", description: "Raj dla nurków (rafy koralowe).", imageURL: "https://loremflickr.com/800/600/redsea,coral", wikipediaURL: "https://pl.wikipedia.org/wiki/Morze_Czerwone"),
                                Info(name: "Pustynia Biała", description: "Kredowe formacje skalne.", imageURL: "https://loremflickr.com/800/600/whitedesert", wikipediaURL: "https://pl.wikipedia.org/wiki/Park_Narodowy_Bia%C5%82a_Pustynia")
                            ]
                        )
    ]
    
    
    @Published var trips: [Trip] = []
    
    
    // inicjalizacja
    init() {
        loadTrips()
        updateTripStatuses()
        
        DispatchQueue.main.async {
            self.updateVisitedCountries()
        }
    }
    
    
    // zapis podrozy
    func saveTrips() {
        let encoder = JSONEncoder()
        
        if let data = try? encoder.encode(trips) {
            UserDefaults.standard.set(data, forKey: "savedTrips")
        }
    }
    
    
    // odczyt podrozy
    func loadTrips() {
        if let data = UserDefaults.standard.data(forKey: "savedTrips") {
            let decoder = JSONDecoder()
            
            if let decoded = try? decoder.decode([Trip].self, from: data) {
                self.trips = decoded
                return
            }
        }
        
    
    }
    
    
    // aktualizacja odwiedzonych krajow (dla HomeView)
    func updateVisitedCountries() {
        let completedCountries = Set(
            trips.filter { $0.status == .completed }
                .map { $0.country }
        )
        
        for index in countries.indices {
            countries[index].visited = completedCountries.contains(countries[index].name)
        }
    }
    
    
    // automatyczna zmiana statusu podrozy
    func updateTripStatuses() {
        let today = Calendar.current.startOfDay(for: Date())
        
        for index in trips.indices {
            let start = Calendar.current.startOfDay(for: trips[index].startDate)
            let end   = Calendar.current.startOfDay(for: trips[index].endDate)
            
            if end <= today {
                trips[index].status = .completed
            } else {
                trips[index].status = .planned
            } 
        }
        
        saveTrips()
    }
}
