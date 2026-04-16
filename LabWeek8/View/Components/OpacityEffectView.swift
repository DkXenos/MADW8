import SwiftUI

struct OpacityEffectView: View {
    @ObservedObject var viewModel: TransformViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Image(systemName: "eye")
                    .foregroundColor(.purple)
                Text("Opacity")
                    .font(.subheadline)
                    .fontWeight(.medium)
                Spacer()
                Toggle("", isOn: $viewModel.model.isOpacityBreathing)
                    .labelsHidden()
            }

            Text("Opacity: \(viewModel.model.opacity, specifier: "%.2f")")
                .font(.caption)
                .foregroundColor(.secondary)

            Slider(value: $viewModel.model.opacity, in: 0...1)
                .tint(.purple)
        }
        .padding(.horizontal)
    }
}
