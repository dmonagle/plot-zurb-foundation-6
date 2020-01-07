//
//  Card.swift
//  
//
//  Created by David Monagle on 7/1/20.
//

import Foundation
import Plot

public extension Node where Context == HTML.BodyContext {
    static func ZF6_card(class: [String] = [], _ nodes: Node<HTML.BodyContext>...) -> Node {
        .div(
            .class("card\(`class`.isEmpty ? "" : " \(`class`.joined(separator: " "))")"),
            .group(nodes)
        )
    }

    static func ZF6_cardSection(_ nodes: Node<HTML.BodyContext>...) -> Node {
        .div(
            .class("card-section"),
            .group(nodes)
        )
    }
    
    static func ZF6_cardImage(_ nodes: Node<HTML.BodyContext>...) -> Node {
        .div(
            .class("card-image"),
            .group(nodes)
        )
    }
}
