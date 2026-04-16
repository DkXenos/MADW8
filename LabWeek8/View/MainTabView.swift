import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            TransformLabView()
                .tabItem {
                    Image(systemName: "wand.and.rays")
                    Text("Transform Lab")
                }

            PhysicsLabView()
                .tabItem {
                    Image(systemName: "atom")
                    Text("Physics Lab")
                }
        }
        .tint(.purple)
    }
}
