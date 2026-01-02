import SwiftUI

struct ContentView: View {
    @EnvironmentObject var store: TripsStore
    
    var body: some View {
        MainTabView()                       //  nawigacja (5 zakladek)
            .environmentObject(store)       
    }
}
