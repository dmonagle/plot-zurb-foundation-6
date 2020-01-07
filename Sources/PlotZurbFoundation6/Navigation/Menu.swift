//
//  Menu.swift
//  
//
//  Created by David Monagle on 7/1/20.
//

import Foundation
import Plot

public extension Node where Context == HTML.BodyContext {
    enum ZF6_MenuOption: String {
        case dropdown
        case vertical
    }
    
    static func ZF6_menu(option: ZF6_MenuOption? = nil, _ nodes: Node<HTML.ListContext>...) -> Node {
        .ul(
            .class("menu"),
            .unwrap(option) {
                .class("menu \($0.rawValue)")
            },
            .if(option == .dropdown, .attribute(named: "data-dropdown-menu")),
            .group(nodes)
        )
    }
}
