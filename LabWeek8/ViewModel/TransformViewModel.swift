import Foundation
import SwiftUI
import Combine

class TransformViewModel: ObservableObject {
    @Published var model = TransformModel()
}
