//
//  Orbit.swift
//
//
//  Created by David Monagle on 7/1/20.
//

import Foundation
import Plot
import PublishPicturePlugin

public struct OrbitSlide {
    public init(image: String, caption: String? = nil, darkIncluded: Bool = false, screenReader: String? = nil) {
        self.image = image
        self.caption = caption
        self.screenReader = screenReader
    }
    
    public var image: String
    public var caption: String? = nil
    public var darkIncluded: Bool = false
    public var screenReader: String? = nil
}

public extension Node where Context == HTML.BodyContext {
    static func ZF6_orbitControls() -> Node {
        .div(
            .class("orbit-controls"),
            .button(
                .class("orbit-previous"),
                .span(
                    .class("show-for-sr"),
                    .text("Previous Slide")
                ),
                .text("&#9664;&#xFE0E;")
            ),
            .button(
                .class("orbit-next"),
                .span(
                    .class("show-for-sr"),
                    .text("Next Slide")
                ),
                .text("&#9654;&#xFE0E;")
            )
        )
    }
    
    static func ZF6_orbitContainer(slides: [OrbitSlide], selectedSlide: Int = 0, captionClass: String? = nil) -> Node {
        .ul(
            .class("orbit-container"),
            .forEach(slides.enumerated()) { index, slide in
                .li(
                    .class("orbit-slide\(index == selectedSlide ? " is-active" : "")"),
                    .figure(
                        .retinaPicture(path: slide.image, includeDark: slide.darkIncluded,
                            .class("orbit-image")
                        ),
                        .unwrap(slide.caption) {
                            .figcaption(
                                .class(captionClass ?? "orbit-caption"),
                                .text($0)
                            )
                        }
                    )
                )
            }
        )
    }
    
    static func ZF6_orbitBullets(slides: [OrbitSlide], selectedSlide: Int = 0) -> Node {
        .nav(
            .class("orbit-bullets"),
            .forEach(slides.enumerated()) { index, slide in
                .button(
                    .attribute(named: "data-slide", value: "\(index)"),
                    .if(index == selectedSlide,
                        .group(
                            .class("is-active"),
                            .span(
                                .class("show-for-sr"),
                                .text("Current Slide")
                            )
                        )
                    ),
                    .span(
                        .class("show-for-sr"),
                        .text(slide.screenReader ?? slide.caption ?? "")
                    )
                )
            }
        )
    }
    
    static func ZF6_orbit(label: String? = nil, selectedSlide: Int = 0, captionClass: String? = nil, slides: [OrbitSlide]) -> Node {
        .div(
            .class("orbit"),
            .role("region"),
            .unwrap(label) {
                .ariaLabel($0)
            },
            .attribute(named: "data-orbit"),
            .div(
                .class("orbit-wrapper"),
                .ZF6_orbitControls(),
                .ZF6_orbitContainer(slides: slides, selectedSlide: selectedSlide, captionClass: captionClass),
                .ZF6_orbitBullets(slides: slides, selectedSlide: selectedSlide)
            )
        )
    }
}
