import SwiftUI

struct CardFrontView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .fill(
                    LinearGradient(
                        colors: [.purple, .blue],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .frame(height: 160)

            VStack(spacing: 8) {
                Image(systemName: "creditcard.fill")
                    .font(.system(size: 40))
                    .foregroundColor(.white)
                Text("Front")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            }
        }
    }
}
