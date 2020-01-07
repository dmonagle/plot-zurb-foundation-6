//
//  RetinaPicture.swift
//  
//
//  Created by David Monagle on 7/1/20.
//

import Foundation
import Plot

public extension Node where Context: HTML.BodyContext {
    static func retinaPicture(path: String, scales: [Int] = [1], _ nodes: Node<HTML.BodyContext>...) -> Node {
        let pathURL = URL(fileURLWithPath: path)
        let pictureSources = scales.map {
            pathURL.path(scale: $0)
        }.joined(separator: ",")
        
        return .element(named: "picture", nodes: [
            .element(named: "source", nodes: [
                .attribute(named: "srcset", value: pictureSources)
            ]),
            .img(
                .src(path)
            ),
            .group(nodes)
        ])
    }
}

extension URL {
    func path(scale: Int) -> String {
        let pathExtension = self.pathExtension
        let pathWithoutExtension = self.deletingPathExtension().relativePath
        let scalePath = scale == 1 ? "" : "@\(scale)x"
        return "\(pathWithoutExtension)\(scalePath)\(pathExtension.isEmpty ? "" : ".\(pathExtension)") \(scale)x"
    }
}

