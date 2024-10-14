//
//  FrameSize.swift
//  FlexUI
//
//  Created by arcangelw on 2024/10/8.
//

import FlexLayout
import UIKit

/// 一个用于修改 Flex 布局中 `size`尺寸相关属性的修饰器。
///
///
/// `FlexSizeModifier` 允许通过 Flex 布局系统的 `size`相关属性设置视图的尺寸参数。
/// 它支持不同单位的值，包括 `CGFloat` 和 `FPercent`，通过实现 `_FlexModifierType`，它可以应用到任何遵循 `FlexView` 的布局视图上。
public struct FlexSizeModifier: _FlexModifierType {
    // 宽度指针
    var widthPointer: FlexValuePointer
    // 高度指针
    var heightPointer: FlexValuePointer

    /// 使用相同的边长初始化宽度和高度。
    /// - Parameter sideLength: 边长值。
    init(sideLength: CGFloat) {
        widthPointer = FlexValuePointer(sideLength)
        heightPointer = FlexValuePointer(sideLength)
    }

    /// 使用给定的尺寸初始化宽度和高度。
    /// - Parameter size: 尺寸值。
    init(size: CGSize) {
        widthPointer = FlexValuePointer(size.width)
        heightPointer = FlexValuePointer(size.height)
    }

    /// 使用指定的宽度和高度初始化修饰符。
    /// - Parameters:
    ///   - width: 宽度值，默认为 `IgnoredFlexCGFloatValue`。
    ///   - height: 高度值，默认为 `IgnoredFlexCGFloatValue`。
    init(width: CGFloat? = IgnoredFlexCGFloatValue, height: CGFloat? = IgnoredFlexCGFloatValue) {
        widthPointer = FlexValuePointer(width)
        heightPointer = FlexValuePointer(height)
    }

    /// 使用百分比初始化宽度和高度。
    /// - Parameters:
    ///   - width: 宽度百分比值。
    ///   - height: 高度百分比值。
    init(width: FPercent? = nil, height: FPercent? = nil) {
        widthPointer = FlexValuePointer(width)
        heightPointer = FlexValuePointer(height)
    }

    /// 应用宽度和高度到指定的视图。
    /// - Parameter element: 需要修改的视图。
    /// - Returns: 经过修改的视图。
    @_spi(Internals)
    public func modify(element: any FlexView) -> any FlexView {
        let flex = element.view.flex
        widthPointer.bindValue(flex.width(_:), flex.width(_:))
        heightPointer.bindValue(flex.height(_:), flex.height(_:))
        return element
    }
}

public extension _FlexViewType where Self: _FlexFrameModifierType {
    @discardableResult
    func size(_ size: CGSize) -> FlexModifiedContent<Self, FlexSizeModifier> {
        modifier(FlexSizeModifier(size: size))
    }

    @discardableResult
    func size(_ sideLength: CGFloat) -> FlexModifiedContent<Self, FlexSizeModifier> {
        modifier(FlexSizeModifier(sideLength: sideLength))
    }

    @discardableResult
    func width(_ width: CGFloat?) -> FlexModifiedContent<Self, FlexSizeModifier> {
        modifier(FlexSizeModifier(width: width))
    }

    @discardableResult
    func height(_ height: CGFloat?) -> FlexModifiedContent<Self, FlexSizeModifier> {
        modifier(FlexSizeModifier(height: height))
    }

    @discardableResult
    func width(_ width: FPercent) -> FlexModifiedContent<Self, FlexSizeModifier> {
        modifier(FlexSizeModifier(width: width))
    }

    @discardableResult
    func height(_ height: FPercent) -> FlexModifiedContent<Self, FlexSizeModifier> {
        modifier(FlexSizeModifier(height: height))
    }

    @discardableResult
    func frame(width: CGFloat? = IgnoredFlexCGFloatValue, height: CGFloat? = IgnoredFlexCGFloatValue) -> FlexModifiedContent<Self, FlexSizeModifier> {
        modifier(FlexSizeModifier(width: width, height: height))
    }
}

public extension FlexModifiedContent where Content: _FlexFrameModifierType {
    @discardableResult
    func size(_ size: CGSize) -> FlexModifiedContent<Content, FlexSizeModifier> {
        modifier(FlexSizeModifier(size: size))
    }

    @discardableResult
    func size(_ sideLength: CGFloat) -> FlexModifiedContent<Content, FlexSizeModifier> {
        modifier(FlexSizeModifier(sideLength: sideLength))
    }

    @discardableResult
    func width(_ width: CGFloat?) -> FlexModifiedContent<Content, FlexSizeModifier> {
        modifier(FlexSizeModifier(width: width))
    }

    @discardableResult
    func height(_ height: CGFloat?) -> FlexModifiedContent<Content, FlexSizeModifier> {
        modifier(FlexSizeModifier(height: height))
    }

    @discardableResult
    func width(_ width: FPercent) -> FlexModifiedContent<Content, FlexSizeModifier> {
        modifier(FlexSizeModifier(width: width))
    }

    @discardableResult
    func height(_ height: FPercent) -> FlexModifiedContent<Content, FlexSizeModifier> {
        modifier(FlexSizeModifier(height: height))
    }

    @discardableResult
    func frame(width: CGFloat? = IgnoredFlexCGFloatValue, height: CGFloat? = IgnoredFlexCGFloatValue) -> FlexModifiedContent<Content, FlexSizeModifier> {
        modifier(FlexSizeModifier(width: width, height: height))
    }
}

public extension FlexModifiedContent where Content: _FlexModifiedContentType, Modifier == FlexSizeModifier {
    @discardableResult
    func size(_ size: CGSize) -> Self {
        modifier.widthPointer.value = FlexValue(size.width)
        modifier.heightPointer.value = FlexValue(size.height)
        return self
    }

    @discardableResult
    func size(_ sideLength: CGFloat) -> Self {
        modifier.widthPointer.value = FlexValue(sideLength)
        modifier.heightPointer.value = FlexValue(sideLength)
        return self
    }

    @discardableResult
    func width(_ width: CGFloat?) -> Self {
        modifier.widthPointer.value = FlexValue(width)
        return self
    }

    @discardableResult
    func height(_ height: CGFloat?) -> Self {
        modifier.heightPointer.value = FlexValue(height)
        return self
    }

    @discardableResult
    func width(_ width: FPercent) -> Self {
        modifier.widthPointer.value = FlexValue(width)
        return self
    }

    @discardableResult
    func height(_ height: FPercent) -> Self {
        modifier.heightPointer.value = FlexValue(height)
        return self
    }

    @discardableResult
    func frame(width: CGFloat? = IgnoredFlexCGFloatValue, height: CGFloat? = IgnoredFlexCGFloatValue) -> Self {
        modifier.widthPointer.value = FlexValue(width)
        modifier.heightPointer.value = FlexValue(height)
        return self
    }
}
