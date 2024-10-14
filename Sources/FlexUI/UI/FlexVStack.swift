//
//  FlexVStack.swift
//
//
//  Created by arcangelw on 2024/9/27.
//

import FlexLayout
import UIKit

public struct FlexVStack<View: UIView>: FlexView, _FlexViewType {
    public let view: View
    private let spacing: CGFloat
    private let justifyContent: Flex.JustifyContent
    private let alignItems: Flex.AlignItems
    private let flexWrap: FlexWrap
    private let isReverse: Bool
    private let children: _FlexViewType

    public init(
        _ view: View = _FlexView() as UIView,
        spacing: CGFloat = 0,
        justifyContent: Flex.JustifyContent = .start,
        alignItems: Flex.AlignItems = .stretch,
        flexWrap: FlexWrap = .noWrap,
        isReverse: Bool = false,
        @FlexViewBuilder content: () -> any _FlexViewType
    ) {
        self.view = view
        self.spacing = spacing
        self.justifyContent = justifyContent
        self.alignItems = alignItems
        self.flexWrap = flexWrap
        self.isReverse = isReverse
        children = content()
    }

    @_spi(Internals)
    @discardableResult
    public func define(superFlex: FlexLayout.Flex) -> Self {
        superFlex.addItem(view)
        layoutDefine()
        return self
    }
}

extension FlexVStack: _FlexLayoutDefinable {
    @_spi(Internals)
    public func layoutDefine() {
        let stack = view.flex.direction(isReverse ? .columnReverse : .column)
            .justifyContent(justifyContent)
            .alignItems(alignItems)
            .rowGap(spacing)
            .wrap(flexWrap.wrap)
            .alignContent(flexWrap.alignContent)
            .columnGap(flexWrap.lineSpacing)

        for child in children.flex_make() {
            child.define(superFlex: stack)
        }
    }
}

extension FlexVStack: _FlexLayoutDirectionModifierType {}
extension FlexVStack: _FlexAlignItemsModifierType {}
extension FlexVStack: _FlexAlignSelfModifierType {}
extension FlexVStack: _FlexBasisModifierType {}
extension FlexVStack: _FlexDisplayModifierType {}
extension FlexVStack: _FlexFrameModifierType {}
extension FlexVStack: _FlexGrowModifierType {}
extension FlexVStack: _FlexShrinkModifierType {}
extension FlexVStack: _FlexPaddingModifierType {}
extension FlexVStack: _FlexPositionModifierType {}
extension FlexVStack: _FlexViewVisualPropertiesModifierType {}
// extension FlexVStack: _FlexViewLayoutModifierType {}
