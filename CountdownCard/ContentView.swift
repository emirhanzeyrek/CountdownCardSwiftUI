import SwiftUI
struct ContentView: View {
    var body: some View {
        GeometryReader { geometry in
            NavigationStack {
                VStack {
                    TabView {
                        CountdownView(
                            targetDate: Calendar.current.date(from: DateComponents(year: 2025, month: 1, day: 1, hour: 00, minute: 00))!,
                            countdownName: "Countdown 1 Name",
                            countdownDateText: "Countdown 1 Date Text",
                            backgroundColor: .blue
                        )
                        .frame(width: geometry.size.width * 0.85, height: geometry.size.height * 0.30)
                        .tabItem {
                            Text("Countdown 1")
                        }
                        CountdownView(
                            targetDate: Calendar.current.date(from: DateComponents(year: 2025, month: 1, day: 1, hour: 00, minute: 00))!,
                            countdownName: "Countdown 2 Name",
                            countdownDateText: "Countdown 2 Date Text",
                            backgroundColor: .green
                        )
                        .frame(width: geometry.size.width * 0.85, height: geometry.size.height * 0.30)
                        .tabItem {
                            Text("Countdown 2")
                        }
                    }
                    .frame(height: geometry.size.height * 0.25)
                    .padding(.horizontal)
                    .tabViewStyle(PageTabViewStyle())
                    .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                }
            }
        }
    }
}
#Preview {
    ContentView()
}
