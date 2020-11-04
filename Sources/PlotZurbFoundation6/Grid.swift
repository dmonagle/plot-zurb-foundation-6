//
//  Grid.swift
//  
//
//  Created by David Monagle on 7/1/20.
//

import Plot

public enum GridContainer: String {
    case fluid
    case full
}

public enum GridSizeClass: String, CustomStringConvertible {
    case small
    case medium
    case large
    
    public var description: String { self.rawValue }
}

public struct CellOption: Hashable, CustomStringConvertible {
    public let `class`: String
    
    public init(_ class: String) {
        self.class = `class`
    }
    
    /// Defines a size attribute
    public static func size(_ sizeClass: GridSizeClass, _ columns: Int) -> Self {
        .init("\(sizeClass)-\(columns)")
    }

    public static func `class`(_ class: String) -> Self {
        .init(`class`)
    }

    /// Defines the number of columns for the small size class
    public static func small(_ columns: Int) -> Self { self.size(.small, columns)}
    /// Defines the number of columns for the medium size class
    public static func medium(_ columns: Int) -> Self { self.size(.medium, columns)}
    /// Defines the number of columns for the large size class
    public static func large(_ columns: Int) -> Self { self.size(.large, columns)}

    public var description: String {
        self.class
    }
}

public struct GridOptions: OptionSet {
    public static let margin = GridOptions(rawValue: 1)
    public static let padding = GridOptions(rawValue: 1 << 1)
    public static let alignCenter = GridOptions(rawValue: 1 << 2)

    public let rawValue: Int
    
    public init(rawValue: Int = 0) {
        self.rawValue = rawValue
    }
    
    func classes(gridType: Character) -> [String] {
        var result = [String]()
        
        if self.contains(.margin) {
            result.append("grid-margin-\(gridType)")
        }

        if self.contains(.padding) {
            result.append("grid-padding-\(gridType)")
        }

        if self.contains(.alignCenter) {
            result.append("align-center")
        }

        return result
    }
}

public extension Node where Context == HTML.BodyContext {
    static func ZF6_gridContainer(type: GridContainer? = nil, _ nodes: Node<HTML.BodyContext>...) -> Node {
        .div(
            .class("grid-container"),
            .unwrap(type) {
                .class("grid-container \($0.rawValue)")
            },
            .group(nodes)
        )
    }

    static func ZF6_gridX(options: GridOptions = [], _ nodes: Node<HTML.BodyContext>...) -> Node {
        .div(
            .class("grid-x \(options.classes(gridType: "x").joined(separator: " "))"),
            .group(nodes)
        )
    }

    static func ZF6_cell(options: Set<CellOption> = [], _ nodes: Node<HTML.BodyContext>...) -> Node {
        .div(
            .class("cell \(options.map { $0.description}.joined(separator: " "))"),
            group(nodes)
        )
    }
}
