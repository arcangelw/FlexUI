//
//  FlexJoin.swift
//  FlexUI
//
//  Created by arcangelw on 2024/10/9.
//

import FlexLayout
import Foundation

public struct FlexJoin: _FlexViewType {
    private let children: [any FlexView]

    public init(@FlexViewBuilder content: () -> any _FlexViewType, @FlexViewBuilder separator: () -> any _FlexViewType) {
        var result: [any FlexView] = []
        let components = content().flex_make()
        if !components.isEmpty {
            // swiftlint:disable:next identifier_name
            for i in 0 ..< components.count - 1 {
                result.append(components[i])
                result.append(separator().flex_make().first!)
            }
        }
        if let lastComponent = components.last {
            result.append(lastComponent)
        }
        children = result
    }

    @_spi(Internals)
    public func flex_make() -> [any FlexView] {
        children
    }
}
