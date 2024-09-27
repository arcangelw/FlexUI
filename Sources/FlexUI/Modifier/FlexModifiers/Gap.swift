//
//  Gap.swift
//  FlexUI
//
//  Created by arcangelw on 2024/10/8.
//

import FlexLayout
import UIKit

/// 类型别名，用于替代 `FlexSpacingModifier`。
@available(*, deprecated, renamed: "FlexSpacingModifier", message: "Will be removed in a future major release.")
public typealias FlexGapModifier = FlexSpacingModifier

/// 类型别名，用于替代 `_FlexSpacingModifierType`。
@available(*, deprecated, renamed: "_FlexSpacingModifierType", message: "Will be removed in a future major release.")
public typealias _FlexGapModifierType = _FlexSpacingModifierType

/// 表示支`spacing`修饰符的协议。
///
/// `_FlexSpacingModifierType` 协议作为标记协议，标识实现该协议的视图可以应用间距修饰符。
public protocol _FlexSpacingModifierType {}

/// 用于设置 Flex 布局视图的间距修饰器。
///
/// `FlexSpacingModifier` 允许通过 Flex 布局系统设置视图的行间距、列间距和整体间距。
public struct FlexSpacingModifier: _FlexModifierType {
    /// 水平方向间距的指针，使用 `FlexValuePointer` 类型。
    var horizontalSpacingPointer: FlexValuePointer
    /// 垂直方向间距的指针，使用 `FlexValuePointer` 类型。
    var verticalSpacingPointer: FlexValuePointer
    /// 整体间距的指针，使用 `FlexValuePointer` 类型。
    var spacingPointer: FlexValuePointer

    /// 初始化方法。
    ///
    /// - Parameters:
    ///   - columnGap: `CGFloat?` 类型，表示列间距，默认值为 `IgnoredFlexCGFloatValue`。
    ///   - rowGap: `CGFloat?` 类型，表示行间距，默认值为 `IgnoredFlexCGFloatValue`。
    ///   - gap: `CGFloat?` 类型，表示整体间距，默认值为 `IgnoredFlexCGFloatValue`。
    init(
        columnGap: CGFloat? = IgnoredFlexCGFloatValue,
        rowGap: CGFloat? = IgnoredFlexCGFloatValue,
        gap: CGFloat? = IgnoredFlexCGFloatValue
    ) {
        horizontalSpacingPointer = FlexValuePointer(columnGap)
        verticalSpacingPointer = FlexValuePointer(rowGap)
        spacingPointer = FlexValuePointer(gap)
    }

    /// 修改给定的 Flex 布局视图的间距属性。
    ///
    /// - Parameter element: 需要被修改的视图，必须遵循 `FlexView` 协议。
    /// - Returns: 修改后的视图，应用了间距属性。
    public func modify(element: any FlexView) -> any FlexView {
        let flex = element.view.flex
        horizontalSpacingPointer.bindNoOptionalValue(flex.columnGap(_:), nil)
        verticalSpacingPointer.bindNoOptionalValue(flex.rowGap(_:), nil)
        spacingPointer.bindNoOptionalValue(flex.gap(_:), nil)
        return element
    }
}

public extension _FlexViewType where Self: _FlexSpacingModifierType {
    /// 为布局视图设置列间距。
    ///
    /// - Parameter value: `CGFloat` 类型，指定列间距的值。
    /// - Returns: 包含应用了列间距的视图内容。
    @available(*, deprecated, renamed: "spacing(horizontal:)", message: "Will be removed in a future major release.")
    @discardableResult
    func columnGap(_ value: CGFloat) -> FlexModifiedContent<Self, FlexGapModifier> {
        return spacing(horizontal: value)
    }

    /// 为布局视图设置行间距。
    ///
    /// - Parameter value: `CGFloat` 类型，指定行间距的值。
    /// - Returns: 包含应用了行间距的视图内容。
    @available(*, deprecated, renamed: "spacing(vertical:)", message: "Will be removed in a future major release.")
    @discardableResult
    func rowGap(_ value: CGFloat) -> FlexModifiedContent<Self, FlexGapModifier> {
        return spacing(vertical: value)
    }

    /// 为布局视图设置整体间距。
    ///
    /// - Parameter value: `CGFloat` 类型，指定整体间距的值。
    /// - Returns: 包含应用了整体间距的视图内容。
    @available(*, deprecated, renamed: "spacing(_:)", message: "Will be removed in a future major release.")
    @discardableResult
    func gap(_ value: CGFloat) -> FlexModifiedContent<Self, FlexGapModifier> {
        return spacing(value)
    }

    /// 为布局视图设置水平方向的间距。
    ///
    /// - Parameter value: `CGFloat` 类型，指定水平方向的间距值。
    /// - Returns: 包含应用了水平方向间距的视图内容。
    @discardableResult
    func spacing(horizontal value: CGFloat) -> FlexModifiedContent<Self, FlexSpacingModifier> {
        return modifier(FlexSpacingModifier(columnGap: value))
    }

    /// 为布局视图设置垂直方向的间距。
    ///
    /// - Parameter value: `CGFloat` 类型，指定垂直方向的间距值。
    /// - Returns: 包含应用了垂直方向间距的视图内容。
    @discardableResult
    func spacing(vertical value: CGFloat) -> FlexModifiedContent<Self, FlexSpacingModifier> {
        return modifier(FlexSpacingModifier(rowGap: value))
    }

    /// 为布局视图设置整体间距。
    ///
    /// - Parameter value: `CGFloat` 类型，指定整体间距值。
    /// - Returns: 包含应用了整体间距的视图内容。
    @discardableResult
    func spacing(_ value: CGFloat) -> FlexModifiedContent<Self, FlexSpacingModifier> {
        return modifier(FlexSpacingModifier(gap: value))
    }
}

public extension FlexModifiedContent where Content: _FlexSpacingModifierType {
    /// 为已经应用修饰器的视图内容设置列间距。
    ///
    /// - Parameter value: `CGFloat` 类型，指定列间距的值。
    /// - Returns: 包含应用了列间距的视图内容。
    @available(*, deprecated, renamed: "spacing(horizontal:)", message: "Will be removed in a future major release.")
    @discardableResult
    func columnGap(_ value: CGFloat) -> FlexModifiedContent<Content, FlexSpacingModifier> {
        return spacing(horizontal: value)
    }

    /// 为已经应用修饰器的视图内容设置行间距。
    ///
    /// - Parameter value: `CGFloat` 类型，指定行间距的值。
    /// - Returns: 包含应用了行间距的视图内容。
    @available(*, deprecated, renamed: "spacing(vertical:)", message: "Will be removed in a future major release.")
    @discardableResult
    func rowGap(_ value: CGFloat) -> FlexModifiedContent<Content, FlexSpacingModifier> {
        return spacing(vertical: value)
    }

    /// 为已经应用修饰器的视图内容设置整体间距。
    ///
    /// - Parameter value: `CGFloat` 类型，指定整体间距的值。
    /// - Returns: 包含应用了整体间距的视图内容。
    @available(*, deprecated, renamed: "spacing(_:)", message: "Will be removed in a future major release.")
    @discardableResult
    func gap(_ value: CGFloat) -> FlexModifiedContent<Content, FlexSpacingModifier> {
        return spacing(value)
    }

    /// 为已经应用修饰器的视图内容设置水平方向的间距。
    ///
    /// - Parameter value: `CGFloat` 类型，指定水平方向的间距值。
    /// - Returns: 包含应用了水平方向间距的视图内容。
    @discardableResult
    func spacing(horizontal value: CGFloat) -> FlexModifiedContent<Content, FlexSpacingModifier> {
        return modifier(FlexSpacingModifier(columnGap: value))
    }

    /// 为已经应用修饰器的视图内容设置垂直方向的间距。
    ///
    /// - Parameter value: `CGFloat` 类型，指定垂直方向的间距值。
    /// - Returns: 包含应用了垂直方向间距的视图内容。
    @discardableResult
    func spacing(vertical value: CGFloat) -> FlexModifiedContent<Content, FlexSpacingModifier> {
        return modifier(FlexSpacingModifier(rowGap: value))
    }

    /// 为已经应用修饰器的视图内容设置整体间距。
    ///
    /// - Parameter value: `CGFloat` 类型，指定整体间距值。
    /// - Returns: 包含应用了整体间距的视图内容。
    @discardableResult
    func spacing(_ value: CGFloat) -> FlexModifiedContent<Content, FlexSpacingModifier> {
        return modifier(FlexSpacingModifier(gap: value))
    }
}

public extension FlexModifiedContent where Content: _FlexModifiedContentType, Modifier == FlexSpacingModifier {
    /// 为已应用 `FlexSpacingModifier` 的内容设置列间距。
    ///
    /// - Parameter value: `CGFloat` 类型，指定列间距的值。
    /// - Returns: 包含应用了列间距的视图内容。
    @available(*, deprecated, renamed: "spacing(horizontal:)", message: "Will be removed in a future major release.")
    @discardableResult
    func columnGap(_ value: CGFloat) -> Self {
        return spacing(horizontal: value)
    }

    /// 为已应用 `FlexSpacingModifier` 的内容设置行间距。
    ///
    /// - Parameter value: `CGFloat` 类型，指定行间距的值。
    /// - Returns: 包含应用了行间距的视图内容。
    @available(*, deprecated, renamed: "spacing(vertical:)", message: "Will be removed in a future major release.")
    @discardableResult
    func rowGap(_ value: CGFloat) -> Self {
        return spacing(vertical: value)
    }

    /// 为已应用 `FlexSpacingModifier` 的内容设置整体间距。
    ///
    /// - Parameter value: `CGFloat` 类型，指定整体间距的值。
    /// - Returns: 包含应用了整体间距的视图内容。
    @available(*, deprecated, renamed: "spacing(_:)", message: "Will be removed in a future major release.")
    @discardableResult
    func gap(_ value: CGFloat) -> Self {
        return spacing(value)
    }

    /// 设置水平方向的间距值。
    ///
    /// - Parameter value: `CGFloat` 类型，指定水平方向的间距值。
    /// - Returns: 应用水平方向间距后的视图内容。
    @discardableResult
    func spacing(horizontal value: CGFloat) -> Self {
        modifier.horizontalSpacingPointer.value = FlexValue(value)
        return self
    }

    /// 设置垂直方向的间距值。
    ///
    /// - Parameter value: `CGFloat` 类型，指定垂直方向的间距值。
    /// - Returns: 应用垂直方向间距后的视图内容。
    @discardableResult
    func spacing(vertical value: CGFloat) -> Self {
        modifier.verticalSpacingPointer.value = FlexValue(value)
        return self
    }

    /// 设置整体间距值。
    ///
    /// - Parameter value: `CGFloat` 类型，指定整体间距值。
    /// - Returns: 应用整体间距后的视图内容。
    @discardableResult
    func spacing(_ value: CGFloat) -> Self {
        modifier.spacingPointer.value = FlexValue(value)
        return self
    }
}
