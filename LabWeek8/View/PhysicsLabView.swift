import SwiftUI

struct PhysicsLabView: View {
    @StateObject private var viewModel = PhysicsViewModel()

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 24) {
                    SpringEffectView(viewModel: viewModel)
                    Divider().padding(.horizontal)
                    ParticleBurstView(viewModel: viewModel)
                    Divider().padding(.horizontal)
                    StaggerRevealView(viewModel: viewModel)
                    Divider().padding(.horizontal)
                    MorphShapeView(viewModel: viewModel)
                    Divider().padding(.horizontal)
                    FlipCardView(viewModel: viewModel)
                }
                .padding(.vertical)
            }
            .navigationTitle("Physics Lab")
        }
    }
}
