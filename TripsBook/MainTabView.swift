import SwiftUI
// na dole tabb
struct MainTabView: View {
    var body: some View {
        TabView {
            
            HomeView()
                .tabItem {
                    Label("Główna", systemImage: "house")
                }
            
            TripsView()
                .tabItem {
                    Label("Podróże", systemImage: "airplane.departure")
                }
            
            StatsView()
                .tabItem {
                    Label("Statystyki", systemImage: "chart.bar.fill")
                }
            
            SafeCalendarView(currentMonth: Date())
                .tabItem {
                    Label("Kalendarz", systemImage: "calendar")
                }
            
            CountriesView()
                .tabItem {
                    Label("Kraje", systemImage: "globe.europe.africa")
                }
        }
    }
}
