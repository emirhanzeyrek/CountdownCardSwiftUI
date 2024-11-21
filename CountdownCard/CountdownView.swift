import Foundation
import SwiftUI
struct CountdownView: View {
    @State private var countdown = DateComponents()
    let targetDate: Date
    let countdownName: String
    let countdownDateText: String
    let backgroundColor: Color
    @State private var timerActive = true
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                VStack(spacing: 10) {
                    Text(countdownName)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.top, 10)
                    HStack(spacing: 15) {
                        VStack {
                            Text("\(countdown.day ?? 0, specifier: "%02d")")
                                .font(.system(size: geometry.size.height * 0.18, weight: .bold))
                                .foregroundColor(.white)
                            Text("DAY")
                                .font(.caption)
                                .foregroundColor(.white)
                        }
                        VStack {
                            Text("\(countdown.hour ?? 0, specifier: "%02d")")
                                .font(.system(size: geometry.size.height * 0.18, weight: .bold))
                                .foregroundColor(.white)
                            Text("HOUR")
                                .font(.caption)
                                .foregroundColor(.white)
                        }
                        VStack {
                            Text("\(countdown.minute ?? 0, specifier: "%02d")")
                                .font(.system(size: geometry.size.height * 0.18, weight: .bold))
                                .foregroundColor(.white)
                            Text("MINUTE")
                                .font(.caption)
                                .foregroundColor(.white)
                        }
                        VStack {
                            Text("\(countdown.second ?? 0, specifier: "%02d")")
                                .font(.system(size: geometry.size.height * 0.18, weight: .bold))
                                .foregroundColor(.white)
                            Text("SECOND")
                                .font(.caption)
                                .foregroundColor(.white)
                        }
                    }
                    Text(countdownDateText)
                        .font(.caption)
                        .foregroundColor(.white)
                        .padding(.bottom, 10)
                }
                .frame(width: geometry.size.width * 0.85, height: geometry.size.height * 0.7)
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .fill(backgroundColor.opacity(0.8))
                        .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.75)
                        .shadow(radius: 5)
                )
                .onReceive(timer) { _ in
                    if timerActive {
                        calculateCountdown()
                    }
                }
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
        }
    }
    func calculateCountdown() {
        let calendar = Calendar.current
        let now = Date()
        countdown = calendar.dateComponents([.day, .hour, .minute, .second], from: now, to: targetDate)
        if countdown.day == 0 && countdown.hour == 0 && countdown.minute == 0 && countdown.second == 0 {
            timerActive = false
        }
    }
}
