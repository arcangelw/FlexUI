//
//  FrameMinSize.swift
//  FlexUI
//
//  Created by arcangelw on 2024/10/8.
//

import FlexLayout

/// 用于管理最小尺寸的修饰符。
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
    public func modify(element: any _FlexView & _FlexDefinable) -> any _FlexView & _FlexDefinable {
        let flex = element.view.flex
        minWidthPointer.bindValue(flex.minWidth(_:), flex.minWidth(_:))
        minHeightPointer.bindValue(flex.minHeight(_:), flex.minHeight(_:))
        return element
    }
}

public extension _FlexViewType where Self: _FlexFrameModifierType {
    /// 通过给定的尺寸设置最小尺寸。
    /// - Parameter size: 尺寸值。
    /// - Returns: 经过修改的内容。
    @discardableResult
    func minSize(_ size: CGSize) -> FlexModifiedContent<Self, FlexMiniSizeModifier> {
        modifier(FlexMiniSizeModifier(size: size))
    }

    /// 通过相同的边长设置最小尺寸。
    /// - Parameter sideLength: 边长值。
    /// - Returns: 经过修改的内容。
    @discardableResult
    func minSize(_ sideLength: CGFloat) -> FlexModifiedContent<Self, FlexMiniSizeModifier> {
        modifier(FlexMiniSizeModifier(sideLength: sideLength))
    }

    /// 设置最小宽度。
    /// - Parameter minWidth: 最小宽度值。
    /// - Returns: 经过修改的内容。
    @discardableResult
    func minWidth(_ minWidth: CGFloat?) -> FlexModifiedContent<Self, FlexMiniSizeModifier> {
        modifier(FlexMiniSizeModifier(minWidth: minWidth))
    }

    /// 设置最小高度。
    /// - Parameter minHeight: 最小高度值。
    /// - Returns: 经过修改的内容。
    @discardableResult
    func minHeight(_ minHeight: CGFloat?) -> FlexModifiedContent<Self, FlexMiniSizeModifier> {
        modifier(FlexMiniSizeModifier(minHeight: minHeight))
    }

    /// 设置最小宽度百分比。
    /// - Parameter minWidth: 最小宽度百分比值。
    /// - Returns: 经过修改的内容。
    @discardableResult
    func minWidth(_ minWidth: FPercent) -> FlexModifiedContent<Self, FlexMiniSizeModifier> {
        modifier(FlexMiniSizeModifier(minWidth: minWidth))
    }

    /// 设置最小高度百分比。
    /// - Parameter minHeight: 最小高度百分比值。
    /// - Returns: 经过修改的内容。
    @discardableResult
    func minHeight(_ minHeight: FPercent) -> FlexModifiedContent<Self, FlexMiniSizeModifier> {
        modifier(FlexMiniSizeModifier(minHeight: minHeight))
    }

    /// 设置最小框架宽度和高度。
    /// - Parameters:
    ///   - minWidth: 最小宽度值，默认为 `IgnoredFlexCGFloatValue`。
    ///   - minHeight: 最小高度值，默认为 `IgnoredFlexCGFloatValue`。
    /// - Returns: 经过修改的内容。
    @discardableResult
    func frame(minWidth: CGFloat? = IgnoredFlexCGFloatValue, minHeight: CGFloat? = IgnoredFlexCGFloatValue) -> FlexModifiedContent<Self, FlexMiniSizeModifier> {
        modifier(FlexMiniSizeModifier(minWidth: minWidth, minHeight: minHeight))
    }
}

public extension FlexModifiedContent where Content: _FlexFrameModifierType {
    /// 通过给定的尺寸设置最小尺寸。
    /// - Parameter size: 尺寸值。
    /// - Returns: 经过修改的内容。
    @discardableResult
    func minSize(_ size: CGSize) -> FlexModifiedContent<Content, FlexMiniSizeModifier> {
        modifier(FlexMiniSizeModifier(size: size))
    }

    /// 通过相同的边长设置最小尺寸。
    /// - Parameter sideLength: 边长值。
    /// - Returns: 经过修改的内容。
    @discardableResult
    func minSize(_ sideLength: CGFloat) -> FlexModifiedContent<Content, FlexMiniSizeModifier> {
        modifier(FlexMiniSizeModifier(sideLength: sideLength))
    }

    /// 设置最小宽度。
    /// - Parameter minWidth: 最小宽度值。
    /// - Returns: 经过修改的内容。
    @discardableResult
    func minWidth(_ minWidth: CGFloat?) -> FlexModifiedContent<Content, FlexMiniSizeModifier> {
        modifier(FlexMiniSizeModifier(minWidth: minWidth))
    }

    /// 设置最小高度。
    /// - Parameter minHeight: 最小高度值。
    /// - Returns: 经过修改的内容。
    @discardableResult
    func minHeight(_ minHeight: CGFloat?) -> FlexModifiedContent<Content, FlexMiniSizeModifier> {
        modifier(FlexMiniSizeModifier(minHeight: minHeight))
    }

    /// 设置最小宽度百分比。
    /// - Parameter minWidth: 最小宽度百分比值。
    /// - Returns: 经过修改的内容。
    @discardableResult
    func minWidth(_ minWidth: FPercent) -> FlexModifiedContent<Content, FlexMiniSizeModifier> {
        modifier(FlexMiniSizeModifier(minWidth: minWidth))
    }

    /// 设置最小高度百分比。
    /// - Parameter minHeight: 最小高度百分比值。
    /// - Returns: 经过修改的内容。
    @discardableResult
    func minHeight(_ minHeight: FPercent) -> FlexModifiedContent<Content, FlexMiniSizeModifier> {
        modifier(FlexMiniSizeModifier(minHeight: minHeight))
    }

    /// 设置最小框架宽度和高度。
    /// - Parameters:
    ///   - minWidth: 最小宽度值，默认为 `IgnoredFlexCGFloatValue`。
    ///   - minHeight: 最小高度值，默认为 `IgnoredFlexCGFloatValue`。
    /// - Returns: 经过修改的内容。
    @discardableResult
    func frame(minWidth: CGFloat? = IgnoredFlexCGFloatValue, minHeight: CGFloat? = IgnoredFlexCGFloatValue) -> FlexModifiedContent<Content, FlexMiniSizeModifier> {
        modifier(FlexMiniSizeModifier(minWidth: minWidth, minHeight: minHeight))
    }
}

public extension FlexModifiedContent where Modifier == FlexMiniSizeModifier {
    /// 通过给定的尺寸设置最小尺寸。
    /// - Parameter size: 尺寸值。
    /// - Returns: 经过修改的内容。
    @discardableResult
    func minSize(_ size: CGSize) -> Self {
        modifier.minWidthPointer.value = FlexValue(size.width)
        modifier.minHeightPointer.value = FlexValue(size.height)
        return self
    }

    /// 通过相同的边长设置最小尺寸。
    /// - Parameter sideLength: 边长值。
    /// - Returns: 经过修改的内容。
    @discardableResult
    func minSize(_ sideLength: CGFloat) -> Self {
        modifier.minWidthPointer.value = FlexValue(sideLength)
        modifier.minHeightPointer.value = FlexValue(sideLength)
        return self
    }

    /// 设置最小宽度。
    /// - Parameter minWidth: 最小宽度值。
    /// - Returns: 经过修改的内容。
    @discardableResult
    func minWidth(_ minWidth: CGFloat?) -> Self {
        modifier.minWidthPointer.value = FlexValue(minWidth)
        return self
    }

    /// 设置最小高度。
    /// - Parameter minHeight: 最小高度值。
    /// - Returns: 经过修改的内容。
    @discardableResult
    func minHeight(_ minHeight: CGFloat?) -> Self {
        modifier.minHeightPointer.value = FlexValue(minHeight)
        return self
    }

    /// 设置最小宽度百分比。
    /// - Parameter minWidth: 最小宽度百分比值。
    /// - Returns: 经过修改的内容。
    @discardableResult
    func minWidth(_ minWidth: FPercent) -> Self {
        modifier.minWidthPointer.value = FlexValue(minWidth)
        return self
    }

    /// 设置最小高度百分比。
    /// - Parameter minHeight: 最小高度百分比值。
    /// - Returns: 经过修改的内容。
    @discardableResult
    func minHeight(_ minHeight: FPercent) -> Self {
        modifier.minHeightPointer.value = FlexValue(minHeight)
        return self
    }

    /// 设置最小框架宽度和高度。
    /// - Parameters:
    ///   - minWidth: 最小宽度值，默认为 `IgnoredFlexCGFloatValue`。
    ///   - minHeight: 最小高度值，默认为 `IgnoredFlexCGFloatValue`。
    /// - Returns: 经过修改的内容。
    @discardableResult
    func frame(minWidth: CGFloat? = IgnoredFlexCGFloatValue, minHeight: CGFloat? = IgnoredFlexCGFloatValue) -> Self {
        modifier.minWidthPointer.value = FlexValue(minWidth)
        modifier.minHeightPointer.value = FlexValue(minHeight)
        return self
    }
}
