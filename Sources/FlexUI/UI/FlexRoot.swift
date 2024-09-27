//
//  FlexRoot.swift
//  FlexUI
//
//  Created by arcangelw on 2024/10/10.
//

import FlexLayout
import UIKit

public protocol _FlexRootType {
    @discardableResult
    func commit() -> Self
}

public struct FlexRoot<View: UIView>: _FlexView, _FlexDefinable, _FlexViewType, _FlexRootType {
    public let view: View
    public let children: _FlexViewType

    public init(
        _ view: View,
        spacing: CGFloat = 0,
        direction: Flex.Direction = .column,
        justifyContent: Flex.JustifyContent = .start,
        alignItems: Flex.AlignItems = .stretch,
        @_FlexViewBuilder content: () -> any _FlexViewType
    ) {
        self.view = view
        children = content()
        let flex = view.flex.direction(direction).justifyContent(justifyContent).alignItems(alignItems)
        switch direction {
        case .row, .rowReverse:
            flex.columnGap(spacing)
        default:
            flex.rowGap(spacing)
        }
    }

    @discardableResult
    public func commit() -> Self {
        for child in children.flex_make() {
            child.define(superFlex: view.flex)
        }
        return self
    }

    @discardableResult
    public func define(superFlex: Flex) -> any _FlexView {
        let stack = superFlex.addItem(view)
        for child in children.flex_make() {
            child.define(superFlex: stack)
        }
        return self
    }
}

public extension FlexModifiedContent where Content: _FlexRootType {
    @discardableResult
    func commit() -> Self {
        _ = flex_make()
        content.commit()
        return self
    }
}

extension FlexRoot: _FlexLayoutDirectionModifierType {}
extension FlexRoot: _FlexPaddingModifierType {}
extension FlexRoot: _FlexViewVisualPropertiesModifierType {}
extension FlexRoot: _FlexViewLayoutModifierType {}
