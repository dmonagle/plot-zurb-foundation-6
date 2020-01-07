//
//  PlotZurbFoundation6.swift
//
//
//  Created by David Monagle on 7/1/20.
//

import Foundation
import Plot

public extension Node where Context == HTML.BodyContext {
    /// Display options for elements such as labels
    enum ZF6_DisplayOption: String {
        case primary
        case secondary
        case success
        case alert
        case warning
    }

    /// Adds script elements pertaining to the default layout of Foundation js files.
    /// Just do this manually if your folder structure is different.
    static func ZF6_Javascript() -> Node {
        .group(
            .script(.src("/js/vendor/jquery.js")),
            .script(.src("/js/vendor/what-input.js")),
            .script(.src("/js/vendor/foundation.js")),
            .script(.src("/js/app.js"))
        )
    }
}
