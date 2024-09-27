//
//  FrameMinSize.swift
//  FlexUI
//
//  Created by arcangelw on 2024/10/8.
//

import FlexLayout
import UIKit

/// 一个用于修改 Flex 布局中 `minSize`最小尺寸相关属性的修饰器。
///
///
/// `FlexMiniSizeModifier` 允许通过 Flex 布局系统的 `minSize`相关属性设置视图的尺寸参数。
/// 它支持不同单位的值，包括 `CGFloat` 和 `FPercent`，通过实现 `_FlexModifierType`，它可以应用到任何遵循 `FlexView` 的布局视图上。
public struct FlexMiniSizeModifier: _FlexModifierType {
    // 最小宽度指针
    var minWidthPointer: FlexValuePointer
    // 最小高度指针
    var minHeightPointer: FlexValuePointer

    /// 使用相同的边长初始化最小宽度和最小高度。
    /// - Parameter sideLength: 边长值。
    init(sideLength: CGFloat) {
        minWidthPointer = FlexValuePointer(sideLength)
        minHeightPointer = FlexValuePointer(sideLength)
    }

    /// 使用给定的尺寸初始化最小宽度和最小高度。
    /// - Parameter size: 尺寸值。
    init(size: CGSize) {
        minWidthPointer = FlexValuePointer(size.width)
        minHeightPointer = FlexValuePointer(size.height)
    }

    /// 使用指定的最小宽度和最小高度初始化修饰符。
    /// - Parameters:
    ///   - minWidth: 最小宽度值，默认为 `IgnoredFlexCGFloatValue`。
    ///   - minHeight: 最小高度值，默认为 `IgnoredFlexCGFloatValue`。
    init(minWidth: CGFloat? = IgnoredFlexCGFloatValue, minHeight: CGFloat? = IgnoredFlexCGFloatValue) {
        minWidthPointer = FlexValuePointer(minWidth)
        minHeightPointer = FlexValuePointer(minHeight)
    }

    /// 使用百分比初始化最小宽度和最小高度。
    /// - Parameters:
    ///   - minWidth: 最小宽度百分比值。
    ///   - minHeight: 最小高度百分比值。
    init(minWidth: FPercent? = nil, minHeight: FPercent? = nil) {
        minWidthPointer = FlexValuePointer(minWidth)
        minHeightPointer = FlexValuePointer(minHeight)
    }

    /// 应用最小宽度和最小高度到指定的视图。
    /// - Parameter element: 需要修改的视图。
    /// - Returns: 经过修改的视图。
    public func modify(element: any FlexView) -> any FlexView {
        let flex = element.view.flex
        minWidthPointer.bindValue(flex.minWidth(_:), flex.minWidth(_:))
        minHeightPointer.bindValue(flex.minHeight(_:), flex.minHeight(_:))
        return element
    }
}

public extension _FlexViewType where Self: _FlexFrameModifierType {
    @discardableResult
    func minSize(_ size: CGSize) -> FlexModifiedContent<Self, FlexMiniSizeModifier> {
        modifier(FlexMiniSizeModifier(size: size))
    }

    @discardableResult
    func minSize(_ sideLength: CGFloat) -> FlexModifiedContent<Self, FlexMiniSizeModifier> {
        modifier(FlexMiniSizeModifier(sideLength: sideLength))
    }

    @discardableResult
    func minWidth(_ minWidth: CGFloat?) -> FlexModifiedContent<Self, FlexMiniSizeModifier> {
        modifier(FlexMiniSizeModifier(minWidth: minWidth))
    }

    @discardableResult
    func minHeight(_ minHeight: CGFloat?) -> FlexModifiedContent<Self, FlexMiniSizeModifier> {
        modifier(FlexMiniSizeModifier(minHeight: minHeight))
    }

    @discardableResult
    func minWidth(_ minWidth: FPercent) -> FlexModifiedContent<Self, FlexMiniSizeModifier> {
        modifier(FlexMiniSizeModifier(minWidth: minWidth))
    }

    @discardableResult
    func minHeight(_ minHeight: FPercent) -> FlexModifiedContent<Self, FlexMiniSizeModifier> {
        modifier(FlexMiniSizeModifier(minHeight: minHeight))
    }

    @discardableResult
    func frame(minWidth: CGFloat? = IgnoredFlexCGFloatValue, minHeight: CGFloat? = IgnoredFlexCGFloatValue) -> FlexModifiedContent<Self, FlexMiniSizeModifier> {
        modifier(FlexMiniSizeModifier(minWidth: minWidth, minHeight: minHeight))
    }
}

public extension FlexModifiedContent where Content: _FlexFrameModifierType {
    @discardableResult
    func minSize(_ size: CGSize) -> FlexModifiedContent<Content, FlexMiniSizeModifier> {
        modifier(FlexMiniSizeModifier(size: size))
    }

    @discardableResult
    func minSize(_ sideLength: CGFloat) -> FlexModifiedContent<Content, FlexMiniSizeModifier> {
        modifier(FlexMiniSizeModifier(sideLength: sideLength))
    }

    @discardableResult
    func minWidth(_ minWidth: CGFloat?) -> FlexModifiedContent<Content, FlexMiniSizeModifier> {
        modifier(FlexMiniSizeModifier(minWidth: minWidth))
    }

    @discardableResult
    func minHeight(_ minHeight: CGFloat?) -> FlexModifiedContent<Content, FlexMiniSizeModifier> {
        modifier(FlexMiniSizeModifier(minHeight: minHeight))
    }

    @discardableResult
    func minWidth(_ minWidth: FPercent) -> FlexModifiedContent<Content, FlexMiniSizeModifier> {
        modifier(FlexMiniSizeModifier(minWidth: minWidth))
    }

    @discardableResult
    func minHeight(_ minHeight: FPercent) -> FlexModifiedContent<Content, FlexMiniSizeModifier> {
        modifier(FlexMiniSizeModifier(minHeight: minHeight))
    }

    @discardableResult
    func frame(minWidth: CGFloat? = IgnoredFlexCGFloatValue, minHeight: CGFloat? = IgnoredFlexCGFloatValue) -> FlexModifiedContent<Content, FlexMiniSizeModifier> {
        modifier(FlexMiniSizeModifier(minWidth: minWidth, minHeight: minHeight))
    }
}

public extension FlexModifiedContent where Content: _FlexModifiedContentType, Modifier == FlexMiniSizeModifier {
    @discardableResult
    func minSize(_ size: CGSize) -> Self {
        modifier.minWidthPointer.value = FlexValue(size.width)
        modifier.minHeightPointer.value = FlexValue(size.height)
        return self
    }

    @discardableResult
    func minSize(_ sideLength: CGFloat) -> Self {
        modifier.minWidthPointer.value = FlexValue(sideLength)
        modifier.minHeightPointer.value = FlexValue(sideLength)
        return self
    }

    @discardableResult
    func minWidth(_ minWidth: CGFloat?) -> Self {
        modifier.minWidthPointer.value = FlexValue(minWidth)
        return self
    }

    @discardableResult
    func minHeight(_ minHeight: CGFloat?) -> Self {
        modifier.minHeightPointer.value = FlexValue(minHeight)
        return self
    }

    @discardableResult
    func minWidth(_ minWidth: FPercent) -> Self {
        modifier.minWidthPointer.value = FlexValue(minWidth)
        return self
    }

    @discardableResult
    func minHeight(_ minHeight: FPercent) -> Self {
        modifier.minHeightPointer.value = FlexValue(minHeight)
        return self
    }

    @discardableResult
    func frame(minWidth: CGFloat? = IgnoredFlexCGFloatValue, minHeight: CGFloat? = IgnoredFlexCGFloatValue) -> Self {
        modifier.minWidthPointer.value = FlexValue(minWidth)
        modifier.minHeightPointer.value = FlexValue(minHeight)
        return self
    }
}
