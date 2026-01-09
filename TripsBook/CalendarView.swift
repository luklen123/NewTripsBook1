import SwiftUI

struct CalendarView: View {
    
    var body: some View {
        VStack(spacing: 0) {
            TopElement(title: "Kalendarz", onTapped: {})
            ScrollView {
                SafeCalendarView(currentMonth: Date())
            }
        }
    }
}
