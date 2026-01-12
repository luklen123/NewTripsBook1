import SwiftUI

struct CountryDetailView: View {
    let country: Country

    @State private var selectedCategory = "Kultura"

    @EnvironmentObject var store: TripsStore
    
    var isVisited: Bool {
        store.countries.first(where: { $0.id == country.id })?.visited ?? false
    }
    @State private var addTripRoute: AddTripRoute? = nil

    var body: some View {
        let c = store.countryDetails.first(where: { $0.name == country.name })!
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
               
                TopElement(title: country.name, onTapped: {
                    addTripRoute = .preselected(country: country.name)
                })
                
                // NIEBIESKA KARTA
                VStack(alignment: .leading, spacing: 20) {
                    HStack(spacing: 15) {
                        Text(country.flag)
                            .font(.system(size: 75))
                            .cornerRadius(10)
                            .shadow(radius: 2)
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text(country.name)
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundStyle(.white)
                                .italic()
                            
                            Text("Państwo w \(continentGram(s: country.continent))")
                                .font(.caption)
                                .foregroundStyle(.white.opacity(0.8))
                        }
                        Spacer()
                    }
                    
                    // Przyciski na niebieskiej karcie
                    HStack(spacing: 10) {

                        Button(action: { addTripRoute = .preselected(country: country.name) }) {
                            Label("Do planu", systemImage: "plus")
                                .font(.subheadline.weight(.medium))
                                .padding(.vertical, 8)
                                .padding(.horizontal, 16)
                                .background(.white)
                                .foregroundStyle(.blue)
                                .cornerRadius(20)
                        }
                        
                        // Przycisk odwiedzone
                        Button(action: {
                            
                        }) {
                            HStack {
                                Image(systemName: isVisited ? "checkmark" : "xmark")
                                Text(isVisited ? "Odwiedzone" : "Nieodwiedzone")
                            }
                            .font(.subheadline.weight(.medium))
                            .padding(.vertical, 8)
                            .padding(.horizontal, 16)
                            .background(.white)
                            .foregroundStyle(isVisited ? .green : .red)
                            .cornerRadius(20)
                        }
                    }
                    
                }
                .padding(20)
                .background(Color.blue)
                .cornerRadius(20)
                .padding(.horizontal)
                
                // KARTA STATYSTYK
                VStack(spacing: 20) {
                    HStack(alignment: .top) {
                        // Kolumna Lewa
                        VStack(alignment: .leading, spacing: 15) {
                            statItem(title: "Stolica", value: c.capital) // Tu w przyszłości country.capital
                            statItem(title: "Język", value: c.lang.joined(separator: ", "))
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        // Kolumna Prawa
                        VStack(alignment: .leading, spacing: 15) {
                            statItem(title: "Waluta", value: c.currency)
                            statItem(title: "Populacja", value: numToStr(num: c.population))
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
                .padding(20)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.gray.opacity(0.2), lineWidth: 1)
                )
                .padding(.horizontal)
                

                //ZMIENNE KATEGORIE
                HStack(spacing: 10) {
                    
                    let categories = ["Kultura", "Miasta", "Natura"]
                    
                    ForEach(categories, id: \.self) { cat in
                        categoryPill(title: cat, isSelected: selectedCategory == cat)
                            .onTapGesture {
        
                                withAnimation {
                                    selectedCategory = cat
                                }
                            }
                    }
                }
                .padding(.horizontal)

                var itemsToShow: [Info] {
                    switch selectedCategory {
                    case "Miasta":
                        return c.cities
                    case "Natura":
                        return c.nature
                    default:
                        return c.culture
                    }
                }

                //LISTA ATRAKCJI
                VStack(spacing: 15) {

                    if itemsToShow.count == 0 {
                        EmptyView()
                    } else {
                        ForEach(itemsToShow) { item in
                            attractionCard(
                                title: item.name,
                                subtitle: item.description,
                                imageName: item.imageURL,
                                topicLink: item.wikipediaURL
                            )
                        }
                    }

                }
                .padding(.horizontal)
                .padding(.bottom, 30)

                
            }
            
        }
        .navigationBarTitleDisplayMode(.inline)

        .sheet(item: $addTripRoute) { route in
            switch route {
            case .new:
                AddTripView()
            case .preselected(let countryName):
                AddTripView(preselectedCountryName: countryName)
            }
        }
    }
    
    func numToStr(num: Int) -> String {
        if num < 1000000 && num >= 1000 {
            return String(num/1000) + " tys."
        } else if num < 1000000000 {
            return String(num/1000000) + " mln."
        } else {
            return String(num/1000000000) + " mld."
        }
    }
    
    func continentGram(s: String) -> String {
        switch s {
            case "Afryka":
                return "Afryce"
            case "Azja":
                return "Azji"
            case "Europa":
                return "Europie"
            case "Australia":
                return "Australii"
            case "Ameryka Płd.":
                return "Ameryce Południowej"
            case "Ameryka Pół.":
                return "Ameryce Północnej"
            case "Antarktyda":
                return "Antarktydzie"
        default:
            return ""
        }
    }
    
    
    // Pojedyncza statystyka
    func statItem(title: String, value: String) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(.caption)
                .foregroundStyle(.gray)
                .fontWeight(.medium)
            Text(value)
                .font(.system(size: 20, weight: .bold, design: .rounded))
                .foregroundStyle(.primary)
        }
    }
    
    // Pastylka menu
    func categoryPill(title: String, isSelected: Bool) -> some View {
        Text(title)
            .font(.subheadline)
            .padding(.vertical, 8)
            .padding(.horizontal, 20)
            .background(isSelected ? Color.blue : Color.white)
            .foregroundStyle(isSelected ? .white : .gray)
            .cornerRadius(20)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(isSelected ? Color.blue : Color.gray.opacity(0.3), lineWidth: 1)
            )
    }
    
    // Karta atrakcji
    func attractionCard(title: String, subtitle: String, imageName: String, topicLink: String) -> some View {
        HStack(spacing: 15) {
            

            AsyncImage(url: URL(string: imageName)) { phase in
                if let image = phase.image {

                    image
                        .resizable()
                        .scaledToFill()
                } else if phase.error != nil {
                    
                    Color.gray.opacity(0.2)
                        .overlay(Image(systemName: "exclamationmark.triangle").foregroundColor(.black))
                } else {

                    Color.gray.opacity(0.2)
                        .overlay(ProgressView())
                }
            }
            .frame(width: 80, height: 80)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.headline)
                    .lineLimit(2)
                Text(subtitle)
                    .font(.caption)
                    .foregroundStyle(.gray)
                    .lineLimit(2)
            }
            
            Spacer()
            
            Link("Zobacz",destination: URL(string: topicLink)!)
            .font(.caption.weight(.bold))
            .padding(.vertical, 6)
            .padding(.horizontal, 12)
            .background(Color.blue.opacity(0.1))
            .foregroundStyle(.blue)
            .cornerRadius(8)
        }
        .padding(10)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.gray.opacity(0.2), lineWidth: 1)
        )
    }
}

#Preview {
    CountryDetailView(country: Country.example)
        .environmentObject(TripsStore())
}
