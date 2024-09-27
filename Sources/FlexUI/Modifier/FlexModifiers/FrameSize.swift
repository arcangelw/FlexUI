//
//  FrameSize.swift
//  FlexUI
//
//  Created by arcangelw on 2024/10/8.
//

import FlexLayout

/// 用于修改视图的大小的结构体。
public struct FlexSizeModifier: _FlexModifierType {
    // 宽度的指针
    var widthPointer: FlexValuePointer
    // 高度的指针
    var heightPointer: FlexValuePointer

    /// 使用指定的边长初始化 `FlexSizeModifier`。
    ///
    /// - Parameter sideLength: `CGFloat` 类型，指定边长值。
    init(sideLength: CGFloat) {
        widthPointer = FlexValuePointer(sideLength)
        heightPointer = FlexValuePointer(sideLength)
    }

    /// 使用指定的尺寸初始化 `FlexSizeModifier`。
    ///
    /// - Parameter size: `CGSize` 类型，指定宽度和高度。
    init(size: CGSize) {
        widthPointer = FlexValuePointer(size.width)
        heightPointer = FlexValuePointer(size.height)
    }

    /// 使用指定的宽度和高度初始化 `FlexSizeModifier`。
    ///
    /// - Parameters:
    ///   - width: 可选的 `CGFloat` 类型，指定宽度值，默认为 `IgnoredFlexCGFloatValue`。
    ///   - height: 可选的 `CGFloat` 类型，指定高度值，默认为 `IgnoredFlexCGFloatValue`。
    init(width: CGFloat? = IgnoredFlexCGFloatValue, height: CGFloat? = IgnoredFlexCGFloatValue) {
        widthPointer = FlexValuePointer(width)
        heightPointer = FlexValuePointer(height)
    }

    /// 使用指定的百分比宽度和高度初始化 `FlexSizeModifier`。
    ///
    /// - Parameters:
    ///   - width: 可选的 `FPercent` 类型，指定宽度的百分比值。
    ///   - height: 可选的 `FPercent` 类型，指定高度的百分比值。
    init(width: FPercent? = nil, height: FPercent? = nil) {
        widthPointer = FlexValuePointer(width)
        heightPointer = FlexValuePointer(height)
    }

    /// 修改视图元素的大小。
    ///
    /// - Parameter element: 需要修改的视图元素。
    /// - Returns: 修改后的视图元素。
    public func modify(element: any _FlexView & _FlexDefinable) -> any _FlexView & _FlexDefinable {
        let flex = element.view.flex
        widthPointer.bindValue(flex.width(_:), flex.width(_:))
        heightPointer.bindValue(flex.height(_:), flex.height(_:))
        return element
    }
}

public extension _FlexViewType where Self: _FlexFrameModifierType {
    /// 设置视图的大小。
    ///
    /// - Parameter size: `CGSize` 类型，指定视图的大小。
    /// - Returns: 应用大小修改后的视图内容。
    @discardableResult
    func size(_ size: CGSize) -> FlexModifiedContent<Self, FlexSizeModifier> {
        modifier(FlexSizeModifier(size: size))
    }

    /// 设置视图的边长。
    ///
    /// - Parameter sideLength: `CGFloat` 类型，指定边长。
    /// - Returns: 应用边长修改后的视图内容。
    @discardableResult
    func size(_ sideLength: CGFloat) -> FlexModifiedContent<Self, FlexSizeModifier> {
        modifier(FlexSizeModifier(sideLength: sideLength))
    }

    /// 设置视图的宽度。
    ///
    /// - Parameter width: 可选的 `CGFloat` 类型，指定宽度值。
    /// - Returns: 应用宽度修改后的视图内容。
    @discardableResult
    func width(_ width: CGFloat?) -> FlexModifiedContent<Self, FlexSizeModifier> {
        modifier(FlexSizeModifier(width: width))
    }

    /// 设置视图的高度。
    ///
    /// - Parameter height: 可选的 `CGFloat` 类型，指定高度值。
    /// - Returns: 应用高度修改后的视图内容。
    @discardableResult
    func height(_ height: CGFloat?) -> FlexModifiedContent<Self, FlexSizeModifier> {
        modifier(FlexSizeModifier(height: height))
    }

    /// 设置视图的百分比宽度。
    ///
    /// - Parameter width: `FPercent` 类型，指定宽度的百分比值。
    /// - Returns: 应用宽度修改后的视图内容。
    @discardableResult
    func width(_ width: FPercent) -> FlexModifiedContent<Self, FlexSizeModifier> {
        modifier(FlexSizeModifier(width: width))
    }

    /// 设置视图的百分比高度。
    ///
    /// - Parameter height: `FPercent` 类型，指定高度的百分比值。
    /// - Returns: 应用高度修改后的视图内容。
    @discardableResult
    func height(_ height: FPercent) -> FlexModifiedContent<Self, FlexSizeModifier> {
        modifier(FlexSizeModifier(height: height))
    }

    /// 设置视图的框架。
    ///
    /// - Parameters:
    ///   - width: 可选的 `CGFloat` 类型，指定宽度值，默认为 `IgnoredFlexCGFloatValue`。
    ///   - height: 可选的 `CGFloat` 类型，指定高度值，默认为 `IgnoredFlexCGFloatValue`。
    /// - Returns: 应用框架修改后的视图内容。
    @discardableResult
    func frame(width: CGFloat? = IgnoredFlexCGFloatValue, height: CGFloat? = IgnoredFlexCGFloatValue) -> FlexModifiedContent<Self, FlexSizeModifier> {
        modifier(FlexSizeModifier(width: width, height: height))
    }
}

public extension FlexModifiedContent where Content: _FlexFrameModifierType {
    /// 设置修改内容的大小。
    ///
    /// - Parameter size: `CGSize` 类型，指定修改内容的大小。
    /// - Returns: 应用大小修改后的内容。
    @discardableResult
    func size(_ size: CGSize) -> FlexModifiedContent<Content, FlexSizeModifier> {
        modifier(FlexSizeModifier(size: size))
    }

    /// 设置修改内容的边长。
    ///
    /// - Parameter sideLength: `CGFloat` 类型，指定边长。
    /// - Returns: 应用边长修改后的内容。
    @discardableResult
    func size(_ sideLength: CGFloat) -> FlexModifiedContent<Content, FlexSizeModifier> {
        modifier(FlexSizeModifier(sideLength: sideLength))
    }

    /// 设置修改内容的宽度。
    ///
    /// - Parameter width: 可选的 `CGFloat` 类型，指定宽度值。
    /// - Returns: 应用宽度修改后的内容。
    @discardableResult
    func width(_ width: CGFloat?) -> FlexModifiedContent<Content, FlexSizeModifier> {
        modifier(FlexSizeModifier(width: width))
    }

    /// 设置修改内容的高度。
    ///
    /// - Parameter height: 可选的 `CGFloat` 类型，指定高度值。
    /// - Returns: 应用高度修改后的内容。
    @discardableResult
    func height(_ height: CGFloat?) -> FlexModifiedContent<Content, FlexSizeModifier> {
        modifier(FlexSizeModifier(height: height))
    }

    /// 设置修改内容的百分比宽度。
    ///
    /// - Parameter width: `FPercent` 类型，指定宽度的百分比值。
    /// - Returns: 应用宽度修改后的内容。
    @discardableResult
    func width(_ width: FPercent) -> FlexModifiedContent<Content, FlexSizeModifier> {
        modifier(FlexSizeModifier(width: width))
    }

    /// 设置修改内容的百分比高度。
    ///
    /// - Parameter height: `FPercent` 类型，指定高度的百分比值。
    /// - Returns: 应用高度修改后的内容。
    @discardableResult
    func height(_ height: FPercent) -> FlexModifiedContent<Content, FlexSizeModifier> {
        modifier(FlexSizeModifier(height: height))
    }

    /// 设置修改内容的框架。
    ///
    /// - Parameters:
    ///   - width: 可选的 `CGFloat` 类型，指定宽度值，默认为 `IgnoredFlexCGFloatValue`。
    ///   - height: 可选的 `CGFloat` 类型，指定高度值，默认为 `IgnoredFlexCGFloatValue`。
    /// - Returns: 应用框架修改后的内容。
    @discardableResult
    func frame(width: CGFloat? = IgnoredFlexCGFloatValue, height: CGFloat? = IgnoredFlexCGFloatValue) -> FlexModifiedContent<Content, FlexSizeModifier> {
        modifier(FlexSizeModifier(width: width, height: height))
    }
}

public extension FlexModifiedContent where Modifier == FlexSizeModifier {
    /// 设置修改内容的大小。
    ///
    /// - Parameter size: `CGSize` 类型，指定修改内容的大小。
    /// - Returns: 应用大小修改后的内容。
    @discardableResult
    func size(_ size: CGSize) -> Self {
        modifier.widthPointer.value = FlexValue(size.width)
        modifier.heightPointer.value = FlexValue(size.height)
        return self
    }

    /// 设置修改内容的边长。
    ///
    /// - Parameter sideLength: `CGFloat` 类型，指定边长。
    /// - Returns: 应用边长修改后的内容。
    @discardableResult
    func size(_ sideLength: CGFloat) -> Self {
        modifier.widthPointer.value = FlexValue(sideLength)
        modifier.heightPointer.value = FlexValue(sideLength)
        return self
    }

    /// 设置修改内容的宽度。
    ///
    /// - Parameter width: 可选的 `CGFloat` 类型，指定宽度值。
    /// - Returns: 应用宽度修改后的内容。
    @discardableResult
    func width(_ width: CGFloat?) -> Self {
        modifier.widthPointer.value = FlexValue(width)
        return self
    }

    /// 设置修改内容的高度。
    ///
    /// - Parameter height: 可选的 `CGFloat` 类型，指定高度值。
    /// - Returns: 应用高度修改后的内容。
    @discardableResult
    func height(_ height: CGFloat?) -> Self {
        modifier.heightPointer.value = FlexValue(height)
        return self
    }

    /// 设置修改内容的百分比宽度。
    ///
    /// - Parameter width: `FPercent` 类型，指定宽度的百分比值。
    /// - Returns: 应用宽度修改后的内容。
    @discardableResult
    func width(_ width: FPercent) -> Self {
        modifier.widthPointer.value = FlexValue(width)
        return self
    }

    /// 设置修改内容的百分比高度。
    ///
    /// - Parameter height: `FPercent` 类型，指定高度的百分比值。
    /// - Returns: 应用高度修改后的内容。
    @discardableResult
    func height(_ height: FPercent) -> Self {
        modifier.heightPointer.value = FlexValue(height)
        return self
    }

    /// 设置修改内容的框架。
    ///
    /// - Parameters:
    ///   - width: 可选的 `CGFloat` 类型，指定宽度值，默认为 `IgnoredFlexCGFloatValue`。
    ///   - height: 可选的 `CGFloat` 类型，指定高度值，默认为 `IgnoredFlexCGFloatValue`。
    /// - Returns: 应用框架修改后的内容。
    @discardableResult
    func frame(width: CGFloat? = IgnoredFlexCGFloatValue, height: CGFloat? = IgnoredFlexCGFloatValue) -> Self {
        modifier.widthPointer.value = FlexValue(width)
        modifier.heightPointer.value = FlexValue(height)
        return self
    }
}
