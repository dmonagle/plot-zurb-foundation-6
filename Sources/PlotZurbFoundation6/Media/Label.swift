//
//  Label.swift
//  
//
//  Created by David Monagle on 7/1/20.
//

import Foundation
import Plot

public extension Node where Context == HTML.BodyContext {
    static func ZF6_label(_ type: ZF6_DisplayOption = .primary, _ nodes: Node<HTML.BodyContext>...) -> Node {
        .span(
            .class("label \(type.rawValue)"),
            .group(nodes)
        )
    }
}
