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
            Country(name: "USA", continent: "Ameryka Płn.", flag: "🇺🇸", visited: false),
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
                CountryD(
                    name: "Albania",
                    capital: "Tirana",
                    continent: "Europa",
                    flag: "🇦🇱",
                    lang: ["Albański"],
                    population: 2_800_000,
                    culture: [
                        Info(name: "Bunkry", description: "Tysiące betonowych bunkrów rozsianych po całym kraju z czasów komunistycznych.", imageURL: "https://source.unsplash.com/800x600/?bunker,albania", wikipediaURL: "https://pl.wikipedia.org/wiki/Bunkry_w_Albanii"),
                        Info(name: "Iso-polifonia", description: "Tradycyjny albański śpiew ludowy wpisany na listę UNESCO.", imageURL: "https://source.unsplash.com/800x600/?choir,singing", wikipediaURL: "https://pl.wikipedia.org/wiki/Alba%C5%84ska_muzyka_ludowa")
                    ],
                    cities: [
                        Info(name: "Tirana", description: "Kolorowa stolica, łącząca architekturę osmańską, włoską i socrealistyczną.", imageURL: "https://source.unsplash.com/800x600/?tirana", wikipediaURL: "https://pl.wikipedia.org/wiki/Tirana"),
                        Info(name: "Berat", description: "Miasto tysiąca okien, znane z białych domów na zboczu góry.", imageURL: "https://source.unsplash.com/800x600/?berat,albania", wikipediaURL: "https://pl.wikipedia.org/wiki/Berat"),
                        Info(name: "Ksamil", description: "Nadmorski kurort zwany 'Malediwami Europy' z krystaliczną wodą.", imageURL: "https://source.unsplash.com/800x600/?ksamil,beach", wikipediaURL: "https://pl.wikipedia.org/wiki/Ksamil")
                    ],
                    nature: [
                        Info(name: "Góry Przeklęte", description: "Dzika część Alp Albańskich, idealna na trekking.", imageURL: "https://source.unsplash.com/800x600/?mountains,albania", wikipediaURL: "https://pl.wikipedia.org/wiki/G%C3%B3ry_P%C3%B3%C5%82nocnoalba%C5%84skie"),
                        Info(name: "Blue Eye", description: "Błękitne oko – źródło wybijające wodę z głębokości ponad 50 metrów.", imageURL: "https://source.unsplash.com/800x600/?spring,water", wikipediaURL: "https://pl.wikipedia.org/wiki/Syri_i_Kalt%C3%ABr"),
                        Info(name: "Jezioro Ochrydzkie", description: "Jedno z najstarszych jezior na świecie, dzielone z Macedonią.", imageURL: "https://source.unsplash.com/800x600/?lake,ohrid", wikipediaURL: "https://pl.wikipedia.org/wiki/Jezioro_Ochrydzkie")
                    ]
                ),

                // 2. ANDORA 🇦🇩
                CountryD(
                    name: "Andora",
                    capital: "Andora",
                    continent: "Europa",
                    flag: "🇦🇩",
                    lang: ["Kataloński"],
                    population: 77_000,
                    culture: [
                        Info(name: "Casa de la Vall", description: "Historyczny dom z XVI wieku, dawna siedziba parlamentu.", imageURL: "https://source.unsplash.com/800x600/?stonehouse,andorra", wikipediaURL: "https://pl.wikipedia.org/wiki/Casa_de_la_Vall"),
                        Info(name: "Zakupy bezcłowe", description: "Andora słynie jako strefa wolnocłowa przyciągająca turystów na zakupy.", imageURL: "https://source.unsplash.com/800x600/?shopping,luxury", wikipediaURL: "https://pl.wikipedia.org/wiki/Gospodarka_Andory")
                    ],
                    cities: [
                        Info(name: "Andora la Vella", description: "Najwyżej położona stolica w Europie.", imageURL: "https://source.unsplash.com/800x600/?andorralavella", wikipediaURL: "https://pl.wikipedia.org/wiki/Andora_(miasto)"),
                        Info(name: "Encamp", description: "Baza wypadowa do ośrodków narciarskich.", imageURL: "https://source.unsplash.com/800x600/?village,mountains", wikipediaURL: "https://pl.wikipedia.org/wiki/Encamp"),
                        Info(name: "Soldeu", description: "Popularny kurort narciarski w pirenejach.", imageURL: "https://source.unsplash.com/800x600/?skiing,snow", wikipediaURL: "https://pl.wikipedia.org/wiki/Soldeu")
                    ],
                    nature: [
                        Info(name: "Pireneje", description: "Wysokie góry otaczające całe państwo.", imageURL: "https://source.unsplash.com/800x600/?pyrenees", wikipediaURL: "https://pl.wikipedia.org/wiki/Pireneje"),
                        Info(name: "Dolina Madriu-Perafita-Claror", description: "Lodowcowa dolina wpisana na listę UNESCO.", imageURL: "https://source.unsplash.com/800x600/?valley,green", wikipediaURL: "https://en.wikipedia.org/wiki/Madriu-Perafita-Claror_Valley"),
                        Info(name: "Jeziora Tristaina", description: "Grupa malowniczych jezior wysokogórskich.", imageURL: "https://source.unsplash.com/800x600/?mountainlake", wikipediaURL: "https://pl.wikipedia.org/wiki/Andora")
                    ]
                ),

                // 3. AUSTRIA 🇦🇹
                CountryD(
                    name: "Austria",
                    capital: "Wiedeń",
                    continent: "Europa",
                    flag: "🇦🇹",
                    lang: ["Niemiecki"],
                    population: 9_000_000,
                    culture: [
                        Info(name: "Muzyka Klasyczna", description: "Ojczyzna Mozarta, Straussa i Haydna.", imageURL: "https://source.unsplash.com/800x600/?violin,orchestra", wikipediaURL: "https://pl.wikipedia.org/wiki/Muzyka_Austrii"),
                        Info(name: "Pałac Schönbrunn", description: "Letnia rezydencja Habsburgów, perła baroku.", imageURL: "https://source.unsplash.com/800x600/?schonbrunn", wikipediaURL: "https://pl.wikipedia.org/wiki/Pa%C5%82ac_Sch%C3%B6nbrunn")
                    ],
                    cities: [
                        Info(name: "Wiedeń", description: "Stolica pełna pałaców, kawiarni i sztuki.", imageURL: "https://source.unsplash.com/800x600/?vienna", wikipediaURL: "https://pl.wikipedia.org/wiki/Wiede%C5%84"),
                        Info(name: "Salzburg", description: "Miasto urodzenia Mozarta z piękną starówką.", imageURL: "https://source.unsplash.com/800x600/?salzburg", wikipediaURL: "https://pl.wikipedia.org/wiki/Salzburg"),
                        Info(name: "Hallstatt", description: "Malownicza wioska nad jeziorem w Alpach.", imageURL: "https://source.unsplash.com/800x600/?hallstatt", wikipediaURL: "https://pl.wikipedia.org/wiki/Hallstatt")
                    ],
                    nature: [
                        Info(name: "Alpy Austriackie", description: "Raj dla narciarzy i miłośników wspinaczki.", imageURL: "https://source.unsplash.com/800x600/?alps,austria", wikipediaURL: "https://pl.wikipedia.org/wiki/Alpy"),
                        Info(name: "Wodospady Krimml", description: "Jedne z najwyższych wodospadów w Europie.", imageURL: "https://source.unsplash.com/800x600/?waterfall,forest", wikipediaURL: "https://pl.wikipedia.org/wiki/Wodospady_Krimml"),
                        Info(name: "Jezioro Bodeńskie", description: "Duże jezioro u podnóża Alp, dzielone z Niemcami i Szwajcarią.", imageURL: "https://source.unsplash.com/800x600/?lake,bodensee", wikipediaURL: "https://pl.wikipedia.org/wiki/Jezioro_Bode%C5%84skie")
                    ]
                ),

                // 4. BELGIA 🇧🇪
                CountryD(
                    name: "Belgia",
                    capital: "Bruksela",
                    continent: "Europa",
                    flag: "🇧🇪",
                    lang: ["Niderlandzki", "Francuski", "Niemiecki"],
                    population: 11_500_000,
                    culture: [
                        Info(name: "Czekolada", description: "Belgijska pralina to symbol najwyższej jakości cukierniczej.", imageURL: "https://source.unsplash.com/800x600/?chocolate,praline", wikipediaURL: "https://pl.wikipedia.org/wiki/Czekolada"),
                        Info(name: "Atomium", description: "Futurystyczna budowla w kształcie atomu żelaza.", imageURL: "https://source.unsplash.com/800x600/?atomium", wikipediaURL: "https://pl.wikipedia.org/wiki/Atomium")
                    ],
                    cities: [
                        Info(name: "Bruksela", description: "Siedziba UE i NATO, miasto wielokulturowe.", imageURL: "https://source.unsplash.com/800x600/?brussels", wikipediaURL: "https://pl.wikipedia.org/wiki/Bruksela"),
                        Info(name: "Brugia", description: "Średniowieczne miasto kanałów, zwane Wenecją Północy.", imageURL: "https://source.unsplash.com/800x600/?bruges", wikipediaURL: "https://pl.wikipedia.org/wiki/Brugia"),
                        Info(name: "Antwerpia", description: "Światowe centrum handlu diamentami i mody.", imageURL: "https://source.unsplash.com/800x600/?antwerp", wikipediaURL: "https://pl.wikipedia.org/wiki/Antwerpia")
                    ],
                    nature: [
                        Info(name: "Ardeny", description: "Zalesione pasmo wzgórz, idealne na piesze wycieczki.", imageURL: "https://source.unsplash.com/800x600/?forest,ardennes", wikipediaURL: "https://pl.wikipedia.org/wiki/Ardeny"),
                        Info(name: "Jaskinie Han", description: "Słynny system jaskiń krasowych.", imageURL: "https://source.unsplash.com/800x600/?cave", wikipediaURL: "https://pl.wikipedia.org/wiki/Han-sur-Lesse"),
                        Info(name: "Wybrzeże Morza Północnego", description: "Szerokie, piaszczyste plaże.", imageURL: "https://source.unsplash.com/800x600/?northsea,beach", wikipediaURL: "https://pl.wikipedia.org/wiki/Morze_P%C3%B3%C5%82nocne")
                    ]
                ),

                // 5. BUŁGARIA 🇧🇬
                CountryD(
                    name: "Bułgaria",
                    capital: "Sofia",
                    continent: "Europa",
                    flag: "🇧🇬",
                    lang: ["Bułgarski"],
                    population: 6_900_000,
                    culture: [
                        Info(name: "Monastyr Rylski", description: "Najważniejszy i najbardziej znany klasztor prawosławny w Bułgarii.", imageURL: "https://source.unsplash.com/800x600/?monastery,bulgaria", wikipediaURL: "https://pl.wikipedia.org/wiki/Monastyr_Rylski"),
                        Info(name: "Olejek Różany", description: "Bułgaria to największy producent olejku różanego na świecie.", imageURL: "https://source.unsplash.com/800x600/?rose,field", wikipediaURL: "https://pl.wikipedia.org/wiki/Dolina_R%C3%B3%C5%BC")
                    ],
                    cities: [
                        Info(name: "Sofia", description: "Stolica z bogatą historią rzymską i cerkwiami.", imageURL: "https://source.unsplash.com/800x600/?sofia,cathedral", wikipediaURL: "https://pl.wikipedia.org/wiki/Sofia"),
                        Info(name: "Płowdiw", description: "Jedno z najstarszych miast Europy z antycznym teatrem.", imageURL: "https://source.unsplash.com/800x600/?plovdiv", wikipediaURL: "https://pl.wikipedia.org/wiki/P%C5%82owdiw"),
                        Info(name: "Warna", description: "Letnia stolica Bułgarii nad Morzem Czarnym.", imageURL: "https://source.unsplash.com/800x600/?varna,sea", wikipediaURL: "https://pl.wikipedia.org/wiki/Warna")
                    ],
                    nature: [
                        Info(name: "Siedem Jezior Rilskich", description: "Grupa jezior polodowcowych w górach Riła.", imageURL: "https://source.unsplash.com/800x600/?lakes,mountains", wikipediaURL: "https://pl.wikipedia.org/wiki/Siedem_Jezior_Rilskich"),
                        Info(name: "Morze Czarne", description: "Popularne wybrzeże z kurortami jak Złote Piaski.", imageURL: "https://source.unsplash.com/800x600/?blacksea,beach", wikipediaURL: "https://pl.wikipedia.org/wiki/Morze_Czarne"),
                        Info(name: "Belogradchik Rocks", description: "Niesamowite formacje skalne w zachodniej Bułgarii.", imageURL: "https://source.unsplash.com/800x600/?rocks,nature", wikipediaURL: "https://en.wikipedia.org/wiki/Belogradchik_Rocks")
                    ]
                ),

                // 6. CHORWACJA 🇭🇷
                CountryD(
                    name: "Chorwacja",
                    capital: "Zagrzeb",
                    continent: "Europa",
                    flag: "🇭🇷",
                    lang: ["Chorwacki"],
                    population: 4_000_000,
                    culture: [
                        Info(name: "Mury Dubrownika", description: "Potężne fortyfikacje otaczające stare miasto, znane z 'Gry o Tron'.", imageURL: "https://source.unsplash.com/800x600/?dubrovnik,wall", wikipediaURL: "https://pl.wikipedia.org/wiki/Mury_miejskie_w_Dubrowniku"),
                        Info(name: "Krawat", description: "Element stroju, który wywodzi się od chorwackich żołnierzy.", imageURL: "https://source.unsplash.com/800x600/?tie,suit", wikipediaURL: "https://pl.wikipedia.org/wiki/Krawat")
                    ],
                    cities: [
                        Info(name: "Dubrownik", description: "Perła Adriatyku, zachwycające miasto portowe.", imageURL: "https://source.unsplash.com/800x600/?dubrovnik,city", wikipediaURL: "https://pl.wikipedia.org/wiki/Dubrownik"),
                        Info(name: "Split", description: "Miasto zbudowane wokół pałacu rzymskiego cesarza Dioklecjana.", imageURL: "https://source.unsplash.com/800x600/?split,croatia", wikipediaURL: "https://pl.wikipedia.org/wiki/Split"),
                        Info(name: "Zagrzeb", description: "Stolica pełna kultury, muzeów i austro-węgierskiej architektury.", imageURL: "https://source.unsplash.com/800x600/?zagreb", wikipediaURL: "https://pl.wikipedia.org/wiki/Zagrzeb")
                    ],
                    nature: [
                        Info(name: "Jeziora Plitwickie", description: "Park narodowy z 16 jeziorami połączonymi wodospadami.", imageURL: "https://source.unsplash.com/800x600/?waterfall,plitvice", wikipediaURL: "https://pl.wikipedia.org/wiki/Park_Narodowy_Jezior_Plitwickich"),
                        Info(name: "Wodospady Krka", description: "Seria wodospadów rzecznych, w których można się kąpać.", imageURL: "https://source.unsplash.com/800x600/?krka,waterfall", wikipediaURL: "https://pl.wikipedia.org/wiki/Park_Narodowy_Krka"),
                        Info(name: "Wyspa Hvar", description: "Słoneczna wyspa znana z pól lawendy.", imageURL: "https://source.unsplash.com/800x600/?hvar,island", wikipediaURL: "https://pl.wikipedia.org/wiki/Hvar")
                    ]
                ),

                // 7. CZECHY 🇨🇿
                CountryD(
                    name: "Czechy",
                    capital: "Praga",
                    continent: "Europa",
                    flag: "🇨🇿",
                    lang: ["Czeski"],
                    population: 10_700_000,
                    culture: [
                        Info(name: "Most Karola", description: "Zabytkowy most kamienny w Pradze pełen rzeźb.", imageURL: "https://source.unsplash.com/800x600/?prague,bridge", wikipediaURL: "https://pl.wikipedia.org/wiki/Most_Karola_w_Pradze"),
                        Info(name: "Piwo Pilsner", description: "Czechy słyną z najlepszego piwa typu pilsner na świecie.", imageURL: "https://source.unsplash.com/800x600/?beer,czech", wikipediaURL: "https://pl.wikipedia.org/wiki/Pilsner_Urquell")
                    ],
                    cities: [
                        Info(name: "Praga", description: "Magiczna stolica z zamkiem na Hradczanach.", imageURL: "https://source.unsplash.com/800x600/?prague,city", wikipediaURL: "https://pl.wikipedia.org/wiki/Praga"),
                        Info(name: "Český Krumlov", description: "Bajkowe miasteczko z renesansowym zamkiem.", imageURL: "https://source.unsplash.com/800x600/?ceskykrumlov", wikipediaURL: "https://pl.wikipedia.org/wiki/%C4%8Cesk%C3%BD_Krumlov"),
                        Info(name: "Brno", description: "Drugie co do wielkości miasto, centrum Moraw.", imageURL: "https://source.unsplash.com/800x600/?brno", wikipediaURL: "https://pl.wikipedia.org/wiki/Brno")
                    ],
                    nature: [
                        Info(name: "Czeska Szwajcaria", description: "Park narodowy z unikalnymi formacjami z piaskowca.", imageURL: "https://source.unsplash.com/800x600/?bohemianswitzerland", wikipediaURL: "https://pl.wikipedia.org/wiki/Park_Narodowy_Czeska_Szwajcaria"),
                        Info(name: "Adršpach", description: "Skalne miasto pełne labiryntów.", imageURL: "https://source.unsplash.com/800x600/?rocks,nature", wikipediaURL: "https://pl.wikipedia.org/wiki/Adrszpasko-cieplickie_Ska%C5%82y"),
                        Info(name: "Śnieżka", description: "Najwyższy szczyt Karkonoszy, na granicy z Polską.", imageURL: "https://source.unsplash.com/800x600/?snow,mountain", wikipediaURL: "https://pl.wikipedia.org/wiki/%C5%9Anie%C5%BCka")
                    ]
                ),

                // 8. DANIA 🇩🇰
                CountryD(
                    name: "Dania",
                    capital: "Kopenhaga",
                    continent: "Europa",
                    flag: "🇩🇰",
                    lang: ["Duński"],
                    population: 5_800_000,
                    culture: [
                        Info(name: "Klocki LEGO", description: "Słynne na cały świat klocki pochodzące z Billund.", imageURL: "https://source.unsplash.com/800x600/?lego", wikipediaURL: "https://pl.wikipedia.org/wiki/Lego"),
                        Info(name: "Hygge", description: "Duńska filozofia szczęścia, ciepła i przytulności.", imageURL: "https://source.unsplash.com/800x600/?cozy,tea", wikipediaURL: "https://pl.wikipedia.org/wiki/Hygge")
                    ],
                    cities: [
                        Info(name: "Kopenhaga", description: "Stolica rowerów, designu i Małej Syrenki.", imageURL: "https://source.unsplash.com/800x600/?copenhagen", wikipediaURL: "https://pl.wikipedia.org/wiki/Kopenhaga"),
                        Info(name: "Aarhus", description: "Miasto kultury i uniwersytetów.", imageURL: "https://source.unsplash.com/800x600/?aarhus", wikipediaURL: "https://pl.wikipedia.org/wiki/Aarhus"),
                        Info(name: "Odense", description: "Miasto urodzenia Hansa Christiana Andersena.", imageURL: "https://source.unsplash.com/800x600/?odense", wikipediaURL: "https://pl.wikipedia.org/wiki/Odense")
                    ],
                    nature: [
                        Info(name: "Klify Møns Klint", description: "Wysokie, białe klify kredowe nad Bałtykiem.", imageURL: "https://source.unsplash.com/800x600/?cliffs,sea", wikipediaURL: "https://pl.wikipedia.org/wiki/M%C3%B8ns_Klint"),
                        Info(name: "Grenen", description: "Cypel, gdzie spotykają się dwa morza: Północne i Bałtyckie.", imageURL: "https://source.unsplash.com/800x600/?sea,waves", wikipediaURL: "https://pl.wikipedia.org/wiki/Grenen"),
                        Info(name: "Park Narodowy Morza Wattowego", description: "Obszar pływów morskich wpisany na listę UNESCO.", imageURL: "https://source.unsplash.com/800x600/?waddensea", wikipediaURL: "https://pl.wikipedia.org/wiki/Morze_Wattowe")
                    ]
                ),
                
                // 9. ESTONIA 🇪🇪
                CountryD(
                    name: "Estonia",
                    capital: "Tallinn",
                    continent: "Europa",
                    flag: "🇪🇪",
                    lang: ["Estoński"],
                    population: 1_300_000,
                    culture: [
                        Info(name: "e-Estonia", description: "Jeden z najbardziej cyfrowych krajów świata.", imageURL: "https://source.unsplash.com/800x600/?technology,server", wikipediaURL: "https://pl.wikipedia.org/wiki/E-stonia"),
                        Info(name: "Święto Pieśni", description: "Ogromny festiwal chórów odbywający się co 5 lat.", imageURL: "https://source.unsplash.com/800x600/?singing,crowd", wikipediaURL: "https://pl.wikipedia.org/wiki/Ba%C5%82tyckie_festiwale_pie%C5%9Bni")
                    ],
                    cities: [
                        Info(name: "Tallinn", description: "Średniowieczna starówka otoczona murami, wpisana na listę UNESCO.", imageURL: "https://source.unsplash.com/800x600/?tallinn", wikipediaURL: "https://pl.wikipedia.org/wiki/Tallinn"),
                        Info(name: "Tartu", description: "Intelektualna stolica kraju z najstarszym uniwersytetem.", imageURL: "https://source.unsplash.com/800x600/?tartu", wikipediaURL: "https://pl.wikipedia.org/wiki/Tartu"),
                        Info(name: "Parnawa", description: "Główny kurort letniskowy nad Bałtykiem.", imageURL: "https://source.unsplash.com/800x600/?beach,estonia", wikipediaURL: "https://pl.wikipedia.org/wiki/Parnawa")
                    ],
                    nature: [
                        Info(name: "Park Narodowy Lahemaa", description: "Bagno Viru i dzikie lasy nad zatoką.", imageURL: "https://source.unsplash.com/800x600/?bog,estonia", wikipediaURL: "https://pl.wikipedia.org/wiki/Park_Narodowy_Lahemaa"),
                        Info(name: "Wyspa Saaremaa", description: "Wyspa wiatraków, kraterów meteorytowych i jałowca.", imageURL: "https://source.unsplash.com/800x600/?windmill,field", wikipediaURL: "https://pl.wikipedia.org/wiki/Sarema"),
                        Info(name: "Wodospad Jägala", description: "Najszerszy naturalny wodospad w Estonii.", imageURL: "https://source.unsplash.com/800x600/?waterfall,river", wikipediaURL: "https://pl.wikipedia.org/wiki/J%C3%A4gala_(wodospad)")
                    ]
                ),

                // 10. FINLANDIA 🇫🇮
                CountryD(
                    name: "Finlandia",
                    capital: "Helsinki",
                    continent: "Europa",
                    flag: "🇫🇮",
                    lang: ["Fiński", "Szwedzki"],
                    population: 5_500_000,
                    culture: [
                        Info(name: "Sauna", description: "Integralna część fińskiej kultury – jest ich tu ponad 2 miliony.", imageURL: "https://source.unsplash.com/800x600/?sauna", wikipediaURL: "https://pl.wikipedia.org/wiki/Sauna"),
                        Info(name: "Święty Mikołaj", description: "Jego oficjalna wioska znajduje się w Rovaniemi.", imageURL: "https://source.unsplash.com/800x600/?santa,claus", wikipediaURL: "https://pl.wikipedia.org/wiki/Wioska_%C5%9Awi%C4%99tego_Miko%C5%82aja")
                    ],
                    cities: [
                        Info(name: "Helsinki", description: "Stolica designu położona na półwyspach.", imageURL: "https://source.unsplash.com/800x600/?helsinki", wikipediaURL: "https://pl.wikipedia.org/wiki/Helsinki"),
                        Info(name: "Rovaniemi", description: "Brama do Arktyki i dom Mikołaja.", imageURL: "https://source.unsplash.com/800x600/?lapland,snow", wikipediaURL: "https://pl.wikipedia.org/wiki/Rovaniemi"),
                        Info(name: "Tampere", description: "Miasto położone malowniczo między dwoma jeziorami.", imageURL: "https://source.unsplash.com/800x600/?tampere", wikipediaURL: "https://pl.wikipedia.org/wiki/Tampere")
                    ],
                    nature: [
                        Info(name: "Zorza Polarna", description: "Niesamowite zjawisko świetlne widoczne w Laponi.", imageURL: "https://source.unsplash.com/800x600/?aurora,borealis", wikipediaURL: "https://pl.wikipedia.org/wiki/Zorza_polarna"),
                        Info(name: "Pojezierze Fińskie", description: "Kraina tysięcy jezior i lasów.", imageURL: "https://source.unsplash.com/800x600/?lake,forest", wikipediaURL: "https://pl.wikipedia.org/wiki/Pojezierze_Fi%C5%84skie"),
                        Info(name: "Renifery", description: "Półdzikie stada wędrujące po drogach północy.", imageURL: "https://source.unsplash.com/800x600/?reindeer", wikipediaURL: "https://pl.wikipedia.org/wiki/Renifer")
                    ]
                ),

                // 11. FRANCJA 🇫🇷
                CountryD(
                    name: "Francja",
                    capital: "Paryż",
                    continent: "Europa",
                    flag: "🇫🇷",
                    lang: ["Francuski"],
                    population: 67_000_000,
                    culture: [
                        Info(name: "Wieża Eiffla", description: "Symbol Paryża i Francji, żelazna dama.", imageURL: "https://source.unsplash.com/800x600/?eiffeltower", wikipediaURL: "https://pl.wikipedia.org/wiki/Wie%C5%BCa_Eiffla"),
                        Info(name: "Wino", description: "Francja to jeden z najważniejszych producentów wina na świecie.", imageURL: "https://source.unsplash.com/800x600/?wine,vineyard", wikipediaURL: "https://pl.wikipedia.org/wiki/Wina_francuskie")
                    ],
                    cities: [
                        Info(name: "Paryż", description: "Miasto zakochanych, mody i Luwru.", imageURL: "https://source.unsplash.com/800x600/?paris", wikipediaURL: "https://pl.wikipedia.org/wiki/Pary%C5%BC"),
                        Info(name: "Nicea", description: "Perła Lazurowego Wybrzeża.", imageURL: "https://source.unsplash.com/800x600/?nice,france", wikipediaURL: "https://pl.wikipedia.org/wiki/Nicea"),
                        Info(name: "Bordeaux", description: "Światowa stolica wina.", imageURL: "https://source.unsplash.com/800x600/?bordeaux", wikipediaURL: "https://pl.wikipedia.org/wiki/Bordeaux")
                    ],
                    nature: [
                        Info(name: "Mont Blanc", description: "Najwyższy szczyt Alp i Europy Zachodniej.", imageURL: "https://source.unsplash.com/800x600/?montblanc", wikipediaURL: "https://pl.wikipedia.org/wiki/Mont_Blanc"),
                        Info(name: "Lazurowe Wybrzeże", description: "Śródziemnomorskie wybrzeże o niesamowitym kolorze wody.", imageURL: "https://source.unsplash.com/800x600/?frenchriviera", wikipediaURL: "https://pl.wikipedia.org/wiki/Lazurowe_Wybrze%C5%BCe"),
                        Info(name: "Pola Lawendy", description: "Prowansja słynie z fioletowych dywanów kwiatów.", imageURL: "https://source.unsplash.com/800x600/?lavender", wikipediaURL: "https://pl.wikipedia.org/wiki/Prowansja")
                    ]
                ),

                // 12. GRECJA 🇬🇷
                CountryD(
                    name: "Grecja",
                    capital: "Ateny",
                    continent: "Europa",
                    flag: "🇬🇷",
                    lang: ["Grecki"],
                    population: 10_700_000,
                    culture: [
                        Info(name: "Akropol", description: "Starożytna cytadela w Atenach z Partenonem.", imageURL: "https://source.unsplash.com/800x600/?acropolis", wikipediaURL: "https://pl.wikipedia.org/wiki/Akropol_ate%C5%84ski"),
                        Info(name: "Igrzyska Olimpijskie", description: "Grecja to ojczyzna sportowej rywalizacji.", imageURL: "https://source.unsplash.com/800x600/?olympia,ruins", wikipediaURL: "https://pl.wikipedia.org/wiki/Staro%C5%BCytne_igrzyska_olimpijskie")
                    ],
                    cities: [
                        Info(name: "Ateny", description: "Historyczna stolica, kolebka zachodniej cywilizacji.", imageURL: "https://source.unsplash.com/800x600/?athens", wikipediaURL: "https://pl.wikipedia.org/wiki/Ateny"),
                        Info(name: "Saloniki", description: "Drugie miasto Grecji, pełne zabytków bizantyjskich.", imageURL: "https://source.unsplash.com/800x600/?thessaloniki", wikipediaURL: "https://pl.wikipedia.org/wiki/Saloniki"),
                        Info(name: "Oia (Santorini)", description: "Białe domki z niebieskimi dachami na klifie.", imageURL: "https://source.unsplash.com/800x600/?santorini", wikipediaURL: "https://pl.wikipedia.org/wiki/Santoryn")
                    ],
                    nature: [
                        Info(name: "Meteory", description: "Klasztory zawieszone na wysokich skałach.", imageURL: "https://source.unsplash.com/800x600/?meteora", wikipediaURL: "https://pl.wikipedia.org/wiki/Meteory"),
                        Info(name: "Wąwóz Samaria", description: "Jeden z najdłuższych wąwozów w Europie, na Krecie.", imageURL: "https://source.unsplash.com/800x600/?gorge,crete", wikipediaURL: "https://pl.wikipedia.org/wiki/Samaria_(w%C4%85w%C3%B3z)"),
                        Info(name: "Zatoka Wraku", description: "Słynna plaża Navagio na Zakynthos.", imageURL: "https://source.unsplash.com/800x600/?zakynthos,beach", wikipediaURL: "https://pl.wikipedia.org/wiki/Zakintos")
                    ]
                ),
                
                // 13. HISZPANIA 🇪🇸
                CountryD(
                    name: "Hiszpania",
                    capital: "Madryt",
                    continent: "Europa",
                    flag: "🇪🇸",
                    lang: ["Hiszpański"],
                    population: 47_000_000,
                    culture: [
                        Info(name: "Flamenco", description: "Pełen pasji taniec i muzyka z Andaluzji.", imageURL: "https://cdn.britannica.com/85/177485-050-34B42C5C/dancer.jpg", wikipediaURL: "https://pl.wikipedia.org/wiki/Flamenco"),
                        Info(name: "Sagrada Família", description: "Niesamowita bazylika w Barcelonie projektu Gaudiego.", imageURL: "https://sagradafamiliatickets.tours/wp-content/uploads/2024/10/visiting-sagrada-familia-5.jpg", wikipediaURL: "https://pl.wikipedia.org/wiki/Sagrada_Familia")
                    ],
                    cities: [
                        Info(name: "Madryt", description: "Królewska stolica z muzeum Prado.", imageURL: "https://media.brate.com/images/europa/hiszpania/madryt/madryt-13.jpg?tr=n-hero", wikipediaURL: "https://pl.wikipedia.org/wiki/Madryt"),
                        Info(name: "Barcelona", description: "Miasto architektury Gaudiego i plaży miejskiej.", imageURL: "https://www.barcelonacard.org/wp-content/uploads/barcelona-card-homepage-1746806969.jpg", wikipediaURL: "https://pl.wikipedia.org/wiki/Barcelona"),
                        Info(name: "Sewilla", description: "Serce Andaluzji z pięknym Placem Hiszpańskim.", imageURL: "https://files.espania.pl/2024/10/scenic-view-of-plaza-de-espana-the-plaza-de-espana-is-a-plaz_shutterstock_2409921727.jpg", wikipediaURL: "https://pl.wikipedia.org/wiki/Sewilla")
                    ],
                    nature: [
                        Info(name: "Picos de Europa", description: "Majestatyczne pasmo górskie na północy.", imageURL: "https://www.revigorate.com/images/Picos-de-Europa-picu-uriellu.jpg", wikipediaURL: "https://pl.wikipedia.org/wiki/Picos_de_Europa"),
                        Info(name: "Caminito del Rey", description: "Słynna ścieżka przyczepiona do pionowych ścian wąwozu.", imageURL: "https://www.spain.info/export/sites/segtur/.content/imagenes/cabeceras-grandes/andalucia/caminito-rey_s724133308.jpg", wikipediaURL: "https://pl.wikipedia.org/wiki/Caminito_del_Rey"),
                        Info(name: "Costa Brava", description: "Dzikie wybrzeże pełne klifów i zatoczek.", imageURL: "https://cms-images.oliverstravels.com/app/uploads/2020/05/15145235/iStock-509288876.jpg?profile=md", wikipediaURL: "https://pl.wikipedia.org/wiki/Costa_Brava")
                    ]
                ),

                // 14. HOLANDIA 🇳🇱
                CountryD(
                    name: "Holandia",
                    capital: "Amsterdam",
                    continent: "Europa",
                    flag: "🇳🇱",
                    lang: ["Niderlandzki"],
                    population: 17_500_000,
                    culture: [
                        Info(name: "Wiatraki", description: "Historyczne wiatraki służące do osuszania polderów.", imageURL: "https://source.unsplash.com/800x600/?windmill,netherlands", wikipediaURL: "https://pl.wikipedia.org/wiki/Wiatraki_w_Kinderdijk"),
                        Info(name: "Tulipany", description: "Holandia to światowe centrum hodowli kwiatów.", imageURL: "https://source.unsplash.com/800x600/?tulips,field", wikipediaURL: "https://pl.wikipedia.org/wiki/Tulipan")
                    ],
                    cities: [
                        Info(name: "Amsterdam", description: "Miasto kanałów, rowerów i wolności.", imageURL: "https://source.unsplash.com/800x600/?amsterdam", wikipediaURL: "https://pl.wikipedia.org/wiki/Amsterdam"),
                        Info(name: "Rotterdam", description: "Nowoczesne miasto z największym portem w Europie.", imageURL: "https://source.unsplash.com/800x600/?rotterdam", wikipediaURL: "https://pl.wikipedia.org/wiki/Rotterdam"),
                        Info(name: "Haga", description: "Siedziba rządu i króla, oraz trybunałów międzynarodowych.", imageURL: "https://source.unsplash.com/800x600/?thehague", wikipediaURL: "https://pl.wikipedia.org/wiki/Haga")
                    ],
                    nature: [
                        Info(name: "Keukenhof", description: "Największy ogród wiosenny na świecie.", imageURL: "https://source.unsplash.com/800x600/?keukenhof", wikipediaURL: "https://pl.wikipedia.org/wiki/Keukenhof"),
                        Info(name: "Morze Wattowe", description: "Unikalny ekosystem pływowy na północy.", imageURL: "https://source.unsplash.com/800x600/?mudflat,sea", wikipediaURL: "https://pl.wikipedia.org/wiki/Morze_Wattowe"),
                        Info(name: "Hoge Veluwe", description: "Park narodowy z wrzosowiskami i wydmami.", imageURL: "https://source.unsplash.com/800x600/?heathland", wikipediaURL: "https://pl.wikipedia.org/wiki/Park_Narodowy_De_Hoge_Veluwe")
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
