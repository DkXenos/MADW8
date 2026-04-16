import SwiftUI

struct StaggerCardView: View {
    let card: StaggerCard
    let isVisible: Bool

    @State private var show = false

    private var diagonalDelay: Double {
        Double(card.row + card.col) * 0.1
    }

    var body: some View {
        RoundedRectangle(cornerRadius: 12)
            .fill(
                LinearGradient(
                    colors: [card.color, card.color.opacity(0.7)],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
            .frame(height: 70)
            .scaleEffect(show ? 1.0 : 0.01)
            .opacity(show ? 1.0 : 0.0)
            .onChange(of: isVisible) { newValue in
                withAnimation(
                    .spring(response: 0.4, dampingFraction: 0.6)
                    .delay(diagonalDelay)
                ) {
                    show = newValue
                }
            }
    }
}
