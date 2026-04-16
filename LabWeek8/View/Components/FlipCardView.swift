import SwiftUI

struct FlipCardView: View {
    @ObservedObject var viewModel: PhysicsViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Label("3D Flip Card", systemImage: "rectangle.portrait.on.rectangle.portrait.angled.fill")
                .font(.headline)

            ZStack {
                if viewModel.isFlipped {
                    CardBackView()
                } else {
                    CardFrontView()
                }
            }
            .rotation3DEffect(
                .degrees(viewModel.isFlipped ? 180 : 0),
                axis: (x: 0, y: 1, z: 0)
            )
            .animation(.easeInOut(duration: 0.6), value: viewModel.isFlipped)

            Button(action: {
                viewModel.toggleFlip()
            }) {
                Text(viewModel.isFlipped ? "Flip Back" : "Flip Card")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 10)
                    .background(
                        LinearGradient(
                            colors: [.orange, .pink],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .cornerRadius(20)
            }
            .frame(maxWidth: .infinity, alignment: .center)
        }
        .padding(.horizontal)
    }
}
