//
//  Plot+HTML5.swift
//  
//
//  Created by David Monagle on 7/1/20.
//

import Foundation
import Plot

public extension Node where Context: HTML.BodyContext {
    static func role(_ role: String) -> Node {
        .attribute(named: "role", value: role)
    }

    static func ariaLabel(_ label: String) -> Node {
        .attribute(named: "aria-label", value: label)
    }

    static func figure(_ nodes: Node<HTML.BodyContext>...) -> Node {
        .element(named: "figure", nodes: nodes)
    }

    static func figcaption(_ nodes: Node<HTML.BodyContext>...) -> Node {
        .element(named: "figcaption", nodes: nodes)
    }
}
