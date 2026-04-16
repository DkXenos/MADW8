import SwiftUI

struct TransformLabView: View {
    @StateObject private var viewModel = TransformViewModel()

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    TransformCubeView(viewModel: viewModel)

                    Divider().padding(.horizontal)
                    ScaleEffectView(viewModel: viewModel)

                    Divider().padding(.horizontal)
                    RotationEffectView(viewModel: viewModel)

                    Divider().padding(.horizontal)
                    OpacityEffectView(viewModel: viewModel)

                    Divider().padding(.horizontal)
                    HueEffectView(viewModel: viewModel)
                }
                .padding(.vertical)
            }
            .navigationTitle("Transform Lab")
        }
    }
}
