import SwiftUI

struct ContentView: View {
    @State private var showSplash = true

    var body: some View {
        ZStack {
            if showSplash {
                SplashView {
                    withAnimation(.easeInOut(duration: 0.5)) {
                        showSplash = false
                    }
                }
                .transition(.opacity)
            } else {
                MainTabView()
                    .transition(.opacity)
            }
        }
    }
}

#Preview {
    ContentView()
}
