import Foundation
import SwiftUI

struct TransformModel {
    var scale: Double = 1.0
    var isScaling: Bool = false

    var rotation: Double = 0.0
    var isRotating: Bool = false

    var opacity: Double = 1.0
    var isOpacityBreathing: Bool = false

    var hue: Double = 0.0
    var isHueBreathing: Bool = false
}
