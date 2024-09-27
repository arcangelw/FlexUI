//
//  FlexScrollStack.swift
//  FlexUI
//
//  Created by arcangelw on 2024/10/9.
//

import FlexLayout
import UIKit

public struct FlexScrollStack: _FlexView, _FlexDefinable, _FlexViewType {
    public enum LayoutDirection {
        case horizontal
        case vertical
    }

    public let view: UIScrollView

    private var contentStack: UnsafeMutablePointer<FlexAnyStack<UIView>>

    private var scrollView: FlexScrollView {
        // swiftlint:disable:next force_cast
        return view as! FlexScrollView
    }

    public init() {
        let scrollView = FlexScrollView()
        view = scrollView
        contentStack = .init(value: .init(scrollView.contentView))
    }

    public func layoutDirection(_ layoutDirection: LayoutDirection) -> Self {
        scrollView.layoutDirection = layoutDirection
        return self
    }

    public func alwaysBounces(_ bounces: Bool) -> Self {
        scrollView.alwaysBounces = bounces
        return self
    }

    public func showsScrollIndicator(_ shows: Bool) -> Self {
        scrollView.showsScrollIndicator = shows
        return self
    }

    public func contentInsetAdjustmentBehavior(
        _ contentInsetAdjustmentBehavior: UIScrollView.ContentInsetAdjustmentBehavior
    ) -> Self {
        scrollView.contentInsetAdjustmentBehavior = contentInsetAdjustmentBehavior
        return self
    }

    @discardableResult
    public func contentStack(closure: (_ contentStack: inout FlexAnyStack<UIView>) -> any _FlexViewType) -> Self {
        _ = closure(&contentStack.value).flex_make()
        return self
    }

    public func define(superFlex: FlexLayout.Flex) -> any _FlexView {
        superFlex.addItem(view).grow(1).shrink(1)
        contentStack.value.updateIfNeeded(reLayout: false)
        return self
    }
}

extension FlexScrollStack: _FlexAlignSelfModifierType {}
extension FlexScrollStack: _FlexDisplayModifierType {}
extension FlexScrollStack: _FlexFrameModifierType {}
extension FlexScrollStack: _FlexGrowModifierType {}
extension FlexScrollStack: _FlexShrinkModifierType {}
extension FlexScrollStack: _FlexPaddingModifierType {}
extension FlexScrollStack: _FlexPositionModifierType {}
extension FlexScrollStack: _FlexViewVisualPropertiesModifierType {}
extension FlexScrollStack: _FlexViewLayoutModifierType {}
