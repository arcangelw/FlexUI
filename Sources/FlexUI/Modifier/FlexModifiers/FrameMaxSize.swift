//
//  FrameMaxSize.swift
//  FlexUI
//
//  Created by arcangelw on 2024/10/8.
//

import FlexLayout
import UIKit

/// 一个用于修改 Flex 布局中 `maxSize`最大尺寸相关属性的修饰器。
///
///
/// `FlexMaxSizeModifier` 允许通过 Flex 布局系统的 `maxSize`相关属性设置视图的尺寸参数。
/// 它支持不同单位的值，包括 `CGFloat` 和 `FPercent`，通过实现 `_FlexModifierType`，它可以应用到任何遵循 `FlexView` 的布局视图上。
public struct FlexMaxSizeModifier: _FlexModifierType {
    // 最大宽度指针
    var maxWidthPointer: FlexValuePointer
    // 最大高度指针
    var maxHeightPointer: FlexValuePointer

    /// 使用相同的边长初始化最大宽度和最大高度。
    /// - Parameter sideLength: 边长值。
    init(sideLength: CGFloat) {
        maxWidthPointer = FlexValuePointer(sideLength)
        maxHeightPointer = FlexValuePointer(sideLength)
    }

    /// 使用给定的尺寸初始化最大宽度和最大高度。
    /// - Parameter size: 尺寸值。
    init(size: CGSize) {
        maxWidthPointer = FlexValuePointer(size.width)
        maxHeightPointer = FlexValuePointer(size.height)
    }

    /// 使用指定的最大宽度和最大高度初始化修饰符。
    /// - Parameters:
    ///   - maxWidth: 最大宽度值，默认为 `IgnoredFlexCGFloatValue`。
    ///   - maxHeight: 最大高度值，默认为 `IgnoredFlexCGFloatValue`。
    init(maxWidth: CGFloat? = IgnoredFlexCGFloatValue, maxHeight: CGFloat? = IgnoredFlexCGFloatValue) {
        maxWidthPointer = FlexValuePointer(maxWidth)
        maxHeightPointer = FlexValuePointer(maxHeight)
    }

    /// 使用百分比初始化最大宽度和最大高度。
    /// - Parameters:
    ///   - maxWidth: 最大宽度百分比值。
    ///   - maxHeight: 最大高度百分比值。
    init(maxWidth: FPercent? = nil, maxHeight: FPercent? = nil) {
        maxWidthPointer = FlexValuePointer(maxWidth)
        maxHeightPointer = FlexValuePointer(maxHeight)
    }

    /// 应用最大宽度和最大高度到指定的视图。
    /// - Parameter element: 需要修改的视图。
    /// - Returns: 经过修改的视图。
    @_spi(Internals)
    public func modify(element: any FlexView) -> any FlexView {
        let flex = element.view.flex
        maxWidthPointer.bindValue(flex.maxWidth(_:), flex.maxWidth(_:))
        maxHeightPointer.bindValue(flex.maxHeight(_:), flex.maxHeight(_:))
        return element
    }
}

public extension _FlexViewType where Self: _FlexFrameModifierType {
    @discardableResult
    func maxSize(_ size: CGSize) -> FlexModifiedContent<Self, FlexMaxSizeModifier> {
        modifier(FlexMaxSizeModifier(size: size))
    }

    @discardableResult
    func maxSize(_ sideLength: CGFloat) -> FlexModifiedContent<Self, FlexMaxSizeModifier> {
        modifier(FlexMaxSizeModifier(sideLength: sideLength))
    }

    @discardableResult
    func maxWidth(_ maxWidth: CGFloat?) -> FlexModifiedContent<Self, FlexMaxSizeModifier> {
        modifier(FlexMaxSizeModifier(maxWidth: maxWidth))
    }

    @discardableResult
    func maxHeight(_ maxHeight: CGFloat?) -> FlexModifiedContent<Self, FlexMaxSizeModifier> {
        modifier(FlexMaxSizeModifier(maxHeight: maxHeight))
    }

    @discardableResult
    func maxWidth(_ maxWidth: FPercent) -> FlexModifiedContent<Self, FlexMaxSizeModifier> {
        modifier(FlexMaxSizeModifier(maxWidth: maxWidth))
    }

    @discardableResult
    func maxHeight(_ maxHeight: FPercent) -> FlexModifiedContent<Self, FlexMaxSizeModifier> {
        modifier(FlexMaxSizeModifier(maxHeight: maxHeight))
    }

    @discardableResult
    func frame(maxWidth: CGFloat? = IgnoredFlexCGFloatValue, maxHeight: CGFloat? = IgnoredFlexCGFloatValue) -> FlexModifiedContent<Self, FlexMaxSizeModifier> {
        modifier(FlexMaxSizeModifier(maxWidth: maxWidth, maxHeight: maxHeight))
    }
}

public extension FlexModifiedContent where Content: _FlexFrameModifierType {
    @discardableResult
    func maxSize(_ size: CGSize) -> FlexModifiedContent<Content, FlexMaxSizeModifier> {
        modifier(FlexMaxSizeModifier(size: size))
    }

    @discardableResult
    func maxSize(_ sideLength: CGFloat) -> FlexModifiedContent<Content, FlexMaxSizeModifier> {
        modifier(FlexMaxSizeModifier(sideLength: sideLength))
    }

    @discardableResult
    func maxWidth(_ maxWidth: CGFloat?) -> FlexModifiedContent<Content, FlexMaxSizeModifier> {
        modifier(FlexMaxSizeModifier(maxWidth: maxWidth))
    }

    @discardableResult
    func maxHeight(_ maxHeight: CGFloat?) -> FlexModifiedContent<Content, FlexMaxSizeModifier> {
        modifier(FlexMaxSizeModifier(maxHeight: maxHeight))
    }

    @discardableResult
    func maxWidth(_ maxWidth: FPercent) -> FlexModifiedContent<Content, FlexMaxSizeModifier> {
        modifier(FlexMaxSizeModifier(maxWidth: maxWidth))
    }

    @discardableResult
    func maxHeight(_ maxHeight: FPercent) -> FlexModifiedContent<Content, FlexMaxSizeModifier> {
        modifier(FlexMaxSizeModifier(maxHeight: maxHeight))
    }

    @discardableResult
    func frame(maxWidth: CGFloat? = IgnoredFlexCGFloatValue, maxHeight: CGFloat? = IgnoredFlexCGFloatValue) -> FlexModifiedContent<Content, FlexMaxSizeModifier> {
        modifier(FlexMaxSizeModifier(maxWidth: maxWidth, maxHeight: maxHeight))
    }
}

public extension FlexModifiedContent where Content: _FlexModifiedContentType, Modifier == FlexMaxSizeModifier {
    @discardableResult
    func maxSize(_ size: CGSize) -> Self {
        modifier.maxWidthPointer.value = FlexValue(size.width)
        modifier.maxHeightPointer.value = FlexValue(size.height)
        return self
    }

    @discardableResult
    func maxSize(_ sideLength: CGFloat) -> Self {
        modifier.maxWidthPointer.value = FlexValue(sideLength)
        modifier.maxHeightPointer.value = FlexValue(sideLength)
        return self
    }

    @discardableResult
    func maxWidth(_ maxWidth: CGFloat?) -> Self {
        modifier.maxWidthPointer.value = FlexValue(maxWidth)
        return self
    }

    @discardableResult
    func maxHeight(_ maxHeight: CGFloat?) -> Self {
        modifier.maxHeightPointer.value = FlexValue(maxHeight)
        return self
    }

    @discardableResult
    func maxWidth(_ maxWidth: FPercent) -> Self {
        modifier.maxWidthPointer.value = FlexValue(maxWidth)
        return self
    }

    @discardableResult
    func maxHeight(_ maxHeight: FPercent) -> Self {
        modifier.maxHeightPointer.value = FlexValue(maxHeight)
        return self
    }

    @discardableResult
    func frame(maxWidth: CGFloat? = IgnoredFlexCGFloatValue, maxHeight: CGFloat? = IgnoredFlexCGFloatValue) -> Self {
        modifier.maxWidthPointer.value = FlexValue(maxWidth)
        modifier.maxHeightPointer.value = FlexValue(maxHeight)
        return self
    }
}
