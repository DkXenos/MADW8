import SwiftUI

struct StaggerRevealView: View {
    @ObservedObject var viewModel: PhysicsViewModel

    private let columns = Array(repeating: GridItem(.flexible(), spacing: 8), count: 3)

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Label("Stagger Reveal", systemImage: "square.grid.3x3.fill")
                .font(.headline)

            LazyVGrid(columns: columns, spacing: 8) {
                ForEach(viewModel.staggerCards) { card in
                    StaggerCardView(
                        card: card,
                        isVisible: viewModel.cardsVisible
                    )
                }
            }
            .padding(12)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color(.systemGray6))
            )

            HStack(spacing: 12) {
                Button(action: {
                    viewModel.revealCards()
                }) {
                    Text("Reveal")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 10)
                        .background(
                            LinearGradient(
                                colors: [.green, .mint],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .cornerRadius(20)
                }

                Button(action: {
                    viewModel.hideCards()
                }) {
                    Text("Hide")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 10)
                        .background(
                            LinearGradient(
                                colors: [.purple, .indigo],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .cornerRadius(20)
                }
            }
            .frame(maxWidth: .infinity, alignment: .center)
        }
        .padding(.horizontal)
    }
}
