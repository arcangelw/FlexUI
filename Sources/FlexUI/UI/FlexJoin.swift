//
//  FlexJoin.swift
//  FlexUI
//
//  Created by arcangelw on 2024/10/9.
//

import FlexLayout
import Foundation

public struct FlexJoin: _FlexViewType {
    public let children: [any _FlexDefinable & _FlexView]

    public init(@_FlexViewBuilder content: () -> any _FlexViewType, @_FlexViewBuilder separator: () -> any _FlexViewType) {
        var result: [any _FlexDefinable & _FlexView] = []
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

    public func flex_make() -> [any _FlexDefinable & _FlexView] {
        children
    }
}
