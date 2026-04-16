import SwiftUI

struct HueEffectView: View {
    @ObservedObject var viewModel: TransformViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Image(systemName: "paintpalette")
                    .foregroundColor(.purple)
                Text("Hue")
                    .font(.subheadline)
                    .fontWeight(.medium)
                Spacer()
                Toggle("", isOn: $viewModel.model.isHueBreathing)
                    .labelsHidden()
            }

            Text("Hue: \(Int(viewModel.model.hue))°")
                .font(.caption)
                .foregroundColor(.secondary)

            Slider(value: $viewModel.model.hue, in: 0...360)
                .tint(.purple)
        }
        .padding(.horizontal)
    }
}
