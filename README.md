# Plot Zurb Foundation 6

Note: This project is under development. While the version is below 1.0.0 changes to the minor version may introduce issues with backward compatibility.  

This is a library for John Sundells [Plot](https://github.com/johnsundell/plot) for the Zurb Foundation 6 framework.

## Examples

### Menu

```swift
.div(
    .id("responsive-menu"),
    .attribute(named: "data-animate", value: "hinge-in-from-top hinge-out-from-top"),
    .class("top-bar"),
    .div(
        .class("top-bar-left"),
        .ZF6_menu(type: .dropdown,
            .li(
                .a(
                    .class("hide-for-small-only"),
                    .href("/"),
                    .retinaPicture(path: "/images/top-bar-logo.png")
                )
            )
        )
    ),
    .div(
        .class("top-bar-right"),
        .ZF6_menu(type: .dropdown,
            .li(
                .a(
                    .class("show-for-small-only"),
                    .href("/"),
                    .text("Home")
                )
            ),
            .forEach(sectionIDs) { section in
                .li(
                    .if(section == selectedSection, .class("active")),
                    .a(
                        .href(context.sections[section].path),
                        .text(context.sections[section].title)
                    )
                )
            }
        )
    )
)
```

### Orbit

```swift
.div(
    .class("hide-for-small-only"),
    .ZF6_orbit(captionClass: "orbit-caption h4 hero-caption", slides: [
        OrbitSlide(image: "/images/hero/obi-wan.png", caption: "Carried a blue lightsaber"),
        OrbitSlide(image: "/images/hero/anakin.png", caption: "Carried blue and red lightsabers"),
        OrbitSlide(image: "/images/hero/luke.png", caption: "Carried blue and green lightsabers"),
    ])
)
```
## Installation

Use the [Swift Package Manager](https://swift.org/package-manager). To install it into a project, simply add it as a dependency within your `Package.swift` manifest:

```swift
let package = Package(
    ...
    dependencies: [
        .package(url: "https://github.com/dmonagle/plot-zurb-foundation-6.git", from: "0.1.0")
    ],
    ...
)
```
