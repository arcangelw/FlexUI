//
//  FlexScrollStack.swift
//  FlexUI
//
//  Created by arcangelw on 2024/10/9.
//

import FlexLayout
import UIKit

public struct FlexScrollStack: FlexView, _FlexViewType, _FlexContentStackType {
    public enum LayoutDirection {
        case horizontal
        case vertical
    }

    public let view: UIScrollView

    private var contentStackPointer: UnsafeMutablePointer<_FlexContentViewType?>

    private var scrollView: _FlexScrollView {
        // swiftlint:disable:next force_cast
        return view as! _FlexScrollView
    }

    public init() {
        let scrollView = _FlexScrollView()
        view = scrollView
        contentStackPointer = .init(value: nil)
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
    public func contentStack(closure: (_ contentStack: inout FlexContentStack) -> any _FlexContentViewType) -> Self {
        var contentStack = FlexContentStack(scrollView.contentView)
        contentStackPointer.value = closure(&contentStack)
        return self
    }

    public func define(superFlex: FlexLayout.Flex) -> Self {
        superFlex.addItem(view).grow(1).shrink(1)
        if let contentStack = contentStackPointer.value as? _FlexInternalContentViewType {
            contentStack.commit()
        }
        return self
    }
}

extension FlexScrollStack: _FlexAlignSelfModifierType {}
extension FlexScrollStack: _FlexDisplayModifierType {}
extension FlexScrollStack: _FlexFrameModifierType {}
extension FlexScrollStack: _FlexGrowModifierType {}
extension FlexScrollStack: _FlexShrinkModifierType {}
extension FlexScrollStack: _FlexPositionModifierType {}
extension FlexScrollStack: _FlexViewVisualPropertiesModifierType {}
// extension FlexScrollStack: _FlexViewLayoutModifierType {}
