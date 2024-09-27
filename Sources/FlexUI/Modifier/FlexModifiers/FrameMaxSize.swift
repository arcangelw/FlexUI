//
//  FrameMaxSize.swift
//  FlexUI
//
//  Created by arcangelw on 2024/10/8.
//

import FlexLayout

/// 用于设置弹性布局的最大尺寸的修饰符。
public struct FlexMaxSizeModifier: _FlexModifierType {
    // 最大宽度指针
    var maxWidthPointer: FlexValuePointer
    // 最大高度指针
    var maxHeightPointer: FlexValuePointer

    /// 初始化 `FlexMaxSizeModifier`，使用给定的边长设置最大宽度和最大高度。
    /// - Parameter sideLength: 边长值，用于设置最大宽度和最大高度。
    init(sideLength: CGFloat) {
        maxWidthPointer = FlexValuePointer(sideLength)
        maxHeightPointer = FlexValuePointer(sideLength)
    }

    /// 初始化 `FlexMaxSizeModifier`，使用给定的尺寸设置最大宽度和最大高度。
    /// - Parameter size: 尺寸值，用于设置最大宽度和最大高度。
    init(size: CGSize) {
        maxWidthPointer = FlexValuePointer(size.width)
        maxHeightPointer = FlexValuePointer(size.height)
    }

    /// 初始化 `FlexMaxSizeModifier`，可选择性地设置最大宽度和最大高度。
    /// - Parameters:
    ///   - maxWidth: 最大宽度值，默认为 `IgnoredFlexCGFloatValue`。
    ///   - maxHeight: 最大高度值，默认为 `IgnoredFlexCGFloatValue`。
    init(maxWidth: CGFloat? = IgnoredFlexCGFloatValue, maxHeight: CGFloat? = IgnoredFlexCGFloatValue) {
        maxWidthPointer = FlexValuePointer(maxWidth)
        maxHeightPointer = FlexValuePointer(maxHeight)
    }

    /// 初始化 `FlexMaxSizeModifier`，可选择性地使用百分比设置最大宽度和最大高度。
    /// - Parameters:
    ///   - maxWidth: 最大宽度百分比值，默认为 `nil`。
    ///   - maxHeight: 最大高度百分比值，默认为 `nil`。
    init(maxWidth: FPercent? = nil, maxHeight: FPercent? = nil) {
        maxWidthPointer = FlexValuePointer(maxWidth)
        maxHeightPointer = FlexValuePointer(maxHeight)
    }

    /// 修改指定的弹性视图，以应用最大宽度和最大高度的限制。
    /// - Parameter element: 需要修改的弹性视图。
    /// - Returns: 修改后的弹性视图。
    public func modify(element: any _FlexView & _FlexDefinable) -> any _FlexView & _FlexDefinable {
        let flex = element.view.flex
        maxWidthPointer.bindValue(flex.maxWidth(_:), flex.maxWidth(_:))
        maxHeightPointer.bindValue(flex.maxHeight(_:), flex.maxHeight(_:))
        return element
    }
}

public extension _FlexViewType where Self: _FlexFrameModifierType {
    /// 设置最大尺寸。
    /// - Parameter size: 最大尺寸值。
    /// - Returns: 修改后的内容。
    @discardableResult
    func maxSize(_ size: CGSize) -> FlexModifiedContent<Self, FlexMaxSizeModifier> {
        modifier(FlexMaxSizeModifier(size: size))
    }

    /// 设置最大尺寸。
    /// - Parameter sideLength: 最大边长值。
    /// - Returns: 修改后的内容。
    @discardableResult
    func maxSize(_ sideLength: CGFloat) -> FlexModifiedContent<Self, FlexMaxSizeModifier> {
        modifier(FlexMaxSizeModifier(sideLength: sideLength))
    }

    /// 设置最大宽度。
    /// - Parameter maxWidth: 最大宽度值。
    /// - Returns: 修改后的内容。
    @discardableResult
    func maxWidth(_ maxWidth: CGFloat?) -> FlexModifiedContent<Self, FlexMaxSizeModifier> {
        modifier(FlexMaxSizeModifier(maxWidth: maxWidth))
    }

    /// 设置最大高度。
    /// - Parameter maxHeight: 最大高度值。
    /// - Returns: 修改后的内容。
    @discardableResult
    func maxHeight(_ maxHeight: CGFloat?) -> FlexModifiedContent<Self, FlexMaxSizeModifier> {
        modifier(FlexMaxSizeModifier(maxHeight: maxHeight))
    }

    /// 设置最大宽度百分比。
    /// - Parameter maxWidth: 最大宽度百分比值。
    /// - Returns: 修改后的内容。
    @discardableResult
    func maxWidth(_ maxWidth: FPercent) -> FlexModifiedContent<Self, FlexMaxSizeModifier> {
        modifier(FlexMaxSizeModifier(maxWidth: maxWidth))
    }

    /// 设置最大高度百分比。
    /// - Parameter maxHeight: 最大高度百分比值。
    /// - Returns: 修改后的内容。
    @discardableResult
    func maxHeight(_ maxHeight: FPercent) -> FlexModifiedContent<Self, FlexMaxSizeModifier> {
        modifier(FlexMaxSizeModifier(maxHeight: maxHeight))
    }

    /// 设置最大框架宽度和高度。
    /// - Parameters:
    ///   - maxWidth: 最大宽度值，默认为 `IgnoredFlexCGFloatValue`。
    ///   - maxHeight: 最大高度值，默认为 `IgnoredFlexCGFloatValue`。
    /// - Returns: 修改后的内容。
    @discardableResult
    func frame(maxWidth: CGFloat? = IgnoredFlexCGFloatValue, maxHeight: CGFloat? = IgnoredFlexCGFloatValue) -> FlexModifiedContent<Self, FlexMaxSizeModifier> {
        modifier(FlexMaxSizeModifier(maxWidth: maxWidth, maxHeight: maxHeight))
    }
}

public extension FlexModifiedContent where Content: _FlexFrameModifierType {
    /// 设置最大尺寸。
    /// - Parameter size: 最大尺寸值。
    /// - Returns: 修改后的内容。
    @discardableResult
    func maxSize(_ size: CGSize) -> FlexModifiedContent<Content, FlexMaxSizeModifier> {
        modifier(FlexMaxSizeModifier(size: size))
    }

    /// 设置最大尺寸。
    /// - Parameter sideLength: 最大边长值。
    /// - Returns: 修改后的内容。
    @discardableResult
    func maxSize(_ sideLength: CGFloat) -> FlexModifiedContent<Content, FlexMaxSizeModifier> {
        modifier(FlexMaxSizeModifier(sideLength: sideLength))
    }

    /// 设置最大宽度。
    /// - Parameter maxWidth: 最大宽度值。
    /// - Returns: 修改后的内容。
    @discardableResult
    func maxWidth(_ maxWidth: CGFloat?) -> FlexModifiedContent<Content, FlexMaxSizeModifier> {
        modifier(FlexMaxSizeModifier(maxWidth: maxWidth))
    }

    /// 设置最大高度。
    /// - Parameter maxHeight: 最大高度值。
    /// - Returns: 修改后的内容。
    @discardableResult
    func maxHeight(_ maxHeight: CGFloat?) -> FlexModifiedContent<Content, FlexMaxSizeModifier> {
        modifier(FlexMaxSizeModifier(maxHeight: maxHeight))
    }

    /// 设置最大宽度百分比。
    /// - Parameter maxWidth: 最大宽度百分比值。
    /// - Returns: 修改后的内容。
    @discardableResult
    func maxWidth(_ maxWidth: FPercent) -> FlexModifiedContent<Content, FlexMaxSizeModifier> {
        modifier(FlexMaxSizeModifier(maxWidth: maxWidth))
    }

    /// 设置最大高度百分比。
    /// - Parameter maxHeight: 最大高度百分比值。
    /// - Returns: 修改后的内容。
    @discardableResult
    func maxHeight(_ maxHeight: FPercent) -> FlexModifiedContent<Content, FlexMaxSizeModifier> {
        modifier(FlexMaxSizeModifier(maxHeight: maxHeight))
    }

    /// 设置最大框架宽度和高度。
    /// - Parameters:
    ///   - maxWidth: 最大宽度值，默认为 `IgnoredFlexCGFloatValue`。
    ///   - maxHeight: 最大高度值，默认为 `IgnoredFlexCGFloatValue`。
    /// - Returns: 修改后的内容。
    @discardableResult
    func frame(maxWidth: CGFloat? = IgnoredFlexCGFloatValue, maxHeight: CGFloat? = IgnoredFlexCGFloatValue) -> FlexModifiedContent<Content, FlexMaxSizeModifier> {
        modifier(FlexMaxSizeModifier(maxWidth: maxWidth, maxHeight: maxHeight))
    }
}

public extension FlexModifiedContent where Modifier == FlexMaxSizeModifier {
    /// 设置最大尺寸。
    /// - Parameter size: 最大尺寸值。
    /// - Returns: 修改后的内容。
    @discardableResult
    func maxSize(_ size: CGSize) -> Self {
        modifier.maxWidthPointer.value = FlexValue(size.width)
        modifier.maxHeightPointer.value = FlexValue(size.height)
        return self
    }

    /// 设置最大尺寸。
    /// - Parameter sideLength: 最大边长值。
    /// - Returns: 修改后的内容。
    @discardableResult
    func maxSize(_ sideLength: CGFloat) -> Self {
        modifier.maxWidthPointer.value = FlexValue(sideLength)
        modifier.maxHeightPointer.value = FlexValue(sideLength)
        return self
    }

    /// 设置最大宽度。
    /// - Parameter maxWidth: 最大宽度值。
    /// - Returns: 修改后的内容。
    @discardableResult
    func maxWidth(_ maxWidth: CGFloat?) -> Self {
        modifier.maxWidthPointer.value = FlexValue(maxWidth)
        return self
    }

    /// 设置最大高度。
    /// - Parameter maxHeight: 最大高度值。
    /// - Returns: 修改后的内容。
    @discardableResult
    func maxHeight(_ maxHeight: CGFloat?) -> Self {
        modifier.maxHeightPointer.value = FlexValue(maxHeight)
        return self
    }

    /// 设置最大宽度百分比。
    /// - Parameter maxWidth: 最大宽度百分比值。
    /// - Returns: 修改后的内容。
    @discardableResult
    func maxWidth(_ maxWidth: FPercent) -> Self {
        modifier.maxWidthPointer.value = FlexValue(maxWidth)
        return self
    }

    /// 设置最大高度百分比。
    /// - Parameter maxHeight: 最大高度百分比值。
    /// - Returns: 修改后的内容。
    @discardableResult
    func maxHeight(_ maxHeight: FPercent) -> Self {
        modifier.maxHeightPointer.value = FlexValue(maxHeight)
        return self
    }

    /// 设置最大框架宽度和高度。
    /// - Parameters:
    ///   - maxWidth: 最大宽度值，默认为 `IgnoredFlexCGFloatValue`。
    ///   - maxHeight: 最大高度值，默认为 `IgnoredFlexCGFloatValue`。
    /// - Returns: 修改后的内容。
    @discardableResult
    func frame(maxWidth: CGFloat? = IgnoredFlexCGFloatValue, maxHeight: CGFloat? = IgnoredFlexCGFloatValue) -> Self {
        modifier.maxWidthPointer.value = FlexValue(maxWidth)
        modifier.maxHeightPointer.value = FlexValue(maxHeight)
        return self
    }
}
