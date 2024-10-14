//
//  PositionMargins.swift
//  FlexUI
//
//  Created by arcangelw on 2024/10/8.
//

import FlexLayout
import UIKit

/// 一个用于修改 Flex 布局中 `margin` 相关属性的修饰器。
///
///
/// `FlexMarginModifier` 允许通过 Flex 布局系统的 `margin`相关属性设置视图的外边距。通过实现 `_FlexModifierType`，它可以应用到任何遵循 `FlexView` 的布局视图上。
public struct FlexMarginModifier: _FlexModifierType {
    // 左侧外边距指针
    var marginLeftPointer: FlexValuePointer
    // 顶部外边距指针
    var marginTopPointer: FlexValuePointer
    // 右侧外边距指针
    var marginRightPointer: FlexValuePointer
    // 底部外边距指针
    var marginBottomPointer: FlexValuePointer
    // 开始外边距指针（用于支持从左到右和从右到左的布局）
    var marginStartPointer: FlexValuePointer
    // 结束外边距指针（用于支持从左到右和从右到左的布局）
    var marginEndPointer: FlexValuePointer
    // 水平外边距指针
    var marginHorizontalPointer: FlexValuePointer
    // 垂直外边距指针
    var marginVerticalPointer: FlexValuePointer
    // 通用外边距指针
    var marginPointer: FlexValuePointer

    /// 使用指定的外边距值初始化修饰符。
    /// - Parameters:
    ///   - marginLeft: 左侧外边距，默认为 `IgnoredFlexCGFloatValue`。
    ///   - marginTop: 顶部外边距，默认为 `IgnoredFlexCGFloatValue`。
    ///   - marginRight: 右侧外边距，默认为 `IgnoredFlexCGFloatValue`。
    ///   - marginBottom: 底部外边距，默认为 `IgnoredFlexCGFloatValue`。
    ///   - marginStart: 开始外边距，默认为 `IgnoredFlexCGFloatValue`。
    ///   - marginEnd: 结束外边距，默认为 `IgnoredFlexCGFloatValue`。
    ///   - marginHorizontal: 水平外边距，默认为 `IgnoredFlexCGFloatValue`。
    ///   - marginVertical: 垂直外边距，默认为 `IgnoredFlexCGFloatValue`。
    ///   - margin: 通用外边距，默认为 `IgnoredFlexCGFloatValue`。
    init(
        marginLeft: CGFloat? = IgnoredFlexCGFloatValue,
        marginTop: CGFloat? = IgnoredFlexCGFloatValue,
        marginRight: CGFloat? = IgnoredFlexCGFloatValue,
        marginBottom: CGFloat? = IgnoredFlexCGFloatValue,
        marginStart: CGFloat? = IgnoredFlexCGFloatValue,
        marginEnd: CGFloat? = IgnoredFlexCGFloatValue,
        marginHorizontal: CGFloat? = IgnoredFlexCGFloatValue,
        marginVertical: CGFloat? = IgnoredFlexCGFloatValue,
        margin: CGFloat? = IgnoredFlexCGFloatValue
    ) {
        marginLeftPointer = FlexValuePointer(marginLeft)
        marginTopPointer = FlexValuePointer(marginTop)
        marginRightPointer = FlexValuePointer(marginRight)
        marginBottomPointer = FlexValuePointer(marginBottom)
        marginStartPointer = FlexValuePointer(marginStart)
        marginEndPointer = FlexValuePointer(marginEnd)
        marginHorizontalPointer = FlexValuePointer(marginHorizontal)
        marginVerticalPointer = FlexValuePointer(marginVertical)
        marginPointer = FlexValuePointer(margin)
    }

    /// 使用百分比外边距值初始化修饰符。
    /// - Parameters:
    ///   - marginLeft: 左侧外边距百分比值。
    ///   - marginTop: 顶部外边距百分比值。
    ///   - marginRight: 右侧外边距百分比值。
    ///   - marginBottom: 底部外边距百分比值。
    ///   - marginStart: 开始外边距百分比值。
    ///   - marginEnd: 结束外边距百分比值。
    ///   - marginHorizontal: 水平外边距百分比值。
    ///   - marginVertical: 垂直外边距百分比值。
    ///   - margin: 通用外边距百分比值。
    init(
        marginLeft: FPercent? = nil,
        marginTop: FPercent? = nil,
        marginRight: FPercent? = nil,
        marginBottom: FPercent? = nil,
        marginStart: FPercent? = nil,
        marginEnd: FPercent? = nil,
        marginHorizontal: FPercent? = nil,
        marginVertical: FPercent? = nil,
        margin: FPercent? = nil
    ) {
        marginLeftPointer = FlexValuePointer(marginLeft)
        marginTopPointer = FlexValuePointer(marginTop)
        marginRightPointer = FlexValuePointer(marginRight)
        marginBottomPointer = FlexValuePointer(marginBottom)
        marginStartPointer = FlexValuePointer(marginStart)
        marginEndPointer = FlexValuePointer(marginEnd)
        marginHorizontalPointer = FlexValuePointer(marginHorizontal)
        marginVerticalPointer = FlexValuePointer(marginVertical)
        marginPointer = FlexValuePointer(margin)
    }

    /// 应用外边距到指定的视图。
    /// - Parameter element: 需要修改的视图。
    /// - Returns: 经过修改的视图。
    @_spi(Internals)
    public func modify(element: any FlexView) -> any FlexView {
        let flex = element.view.flex
        marginLeftPointer.bindNoOptionalValue(flex.marginLeft(_:), flex.marginLeft(_:))
        marginTopPointer.bindNoOptionalValue(flex.marginTop(_:), flex.marginTop(_:))
        marginRightPointer.bindNoOptionalValue(flex.marginRight(_:), flex.marginRight(_:))
        marginBottomPointer.bindNoOptionalValue(flex.marginBottom(_:), flex.marginBottom(_:))
        marginStartPointer.bindNoOptionalValue(flex.marginStart(_:), flex.marginStart(_:))
        marginEndPointer.bindNoOptionalValue(flex.marginEnd(_:), flex.marginEnd(_:))
        marginHorizontalPointer.bindNoOptionalValue(flex.marginHorizontal(_:), flex.marginHorizontal(_:))
        marginVerticalPointer.bindNoOptionalValue(flex.marginVertical(_:), flex.marginVertical(_:))
        marginPointer.bindNoOptionalValue(flex.margin(_:), flex.margin(_:))
        return element
    }
}

public extension _FlexViewType where Self: _FlexPositionModifierType {
    @discardableResult
    func marginLeft(_ value: CGFloat) -> FlexModifiedContent<Self, FlexMarginModifier> {
        modifier(FlexMarginModifier(marginLeft: value))
    }

    @discardableResult
    func marginLeft(_ percent: FPercent) -> FlexModifiedContent<Self, FlexMarginModifier> {
        modifier(FlexMarginModifier(marginLeft: percent))
    }

    @discardableResult
    func marginTop(_ value: CGFloat) -> FlexModifiedContent<Self, FlexMarginModifier> {
        modifier(FlexMarginModifier(marginTop: value))
    }

    @discardableResult
    func marginTop(_ percent: FPercent) -> FlexModifiedContent<Self, FlexMarginModifier> {
        modifier(FlexMarginModifier(marginTop: percent))
    }

    @discardableResult
    func marginRight(_ value: CGFloat) -> FlexModifiedContent<Self, FlexMarginModifier> {
        modifier(FlexMarginModifier(marginRight: value))
    }

    @discardableResult
    func marginRight(_ percent: FPercent) -> FlexModifiedContent<Self, FlexMarginModifier> {
        modifier(FlexMarginModifier(marginRight: percent))
    }

    @discardableResult
    func marginBottom(_ value: CGFloat) -> FlexModifiedContent<Self, FlexMarginModifier> {
        modifier(FlexMarginModifier(marginBottom: value))
    }

    @discardableResult
    func marginBottom(_ percent: FPercent) -> FlexModifiedContent<Self, FlexMarginModifier> {
        modifier(FlexMarginModifier(marginBottom: percent))
    }

    @discardableResult
    func marginStart(_ value: CGFloat) -> FlexModifiedContent<Self, FlexMarginModifier> {
        modifier(FlexMarginModifier(marginStart: value))
    }

    @discardableResult
    func marginStart(_ percent: FPercent) -> FlexModifiedContent<Self, FlexMarginModifier> {
        modifier(FlexMarginModifier(marginStart: percent))
    }

    @discardableResult
    func marginEnd(_ value: CGFloat) -> FlexModifiedContent<Self, FlexMarginModifier> {
        modifier(FlexMarginModifier(marginEnd: value))
    }

    @discardableResult
    func marginEnd(_ percent: FPercent) -> FlexModifiedContent<Self, FlexMarginModifier> {
        modifier(FlexMarginModifier(marginEnd: percent))
    }

    @discardableResult
    func marginHorizontal(_ value: CGFloat) -> FlexModifiedContent<Self, FlexMarginModifier> {
        modifier(FlexMarginModifier(marginHorizontal: value))
    }

    @discardableResult
    func marginHorizontal(_ percent: FPercent) -> FlexModifiedContent<Self, FlexMarginModifier> {
        modifier(FlexMarginModifier(marginHorizontal: percent))
    }

    @discardableResult
    func marginVertical(_ value: CGFloat) -> FlexModifiedContent<Self, FlexMarginModifier> {
        modifier(FlexMarginModifier(marginVertical: value))
    }

    @discardableResult
    func marginVertical(_ percent: FPercent) -> FlexModifiedContent<Self, FlexMarginModifier> {
        modifier(FlexMarginModifier(marginVertical: percent))
    }

    @discardableResult
    func margin(_ insets: UIEdgeInsets) -> FlexModifiedContent<Self, FlexMarginModifier> {
        modifier(FlexMarginModifier(marginLeft: insets.left, marginTop: insets.top, marginRight: insets.right, marginBottom: insets.bottom))
    }

    @discardableResult
    func margin(_ directionalInsets: NSDirectionalEdgeInsets) -> FlexModifiedContent<Self, FlexMarginModifier> {
        modifier(FlexMarginModifier(marginTop: directionalInsets.top, marginBottom: directionalInsets.bottom, marginStart: directionalInsets.leading, marginEnd: directionalInsets.trailing))
    }

    @discardableResult
    func margin(_ value: CGFloat) -> FlexModifiedContent<Self, FlexMarginModifier> {
        modifier(FlexMarginModifier(margin: value))
    }

    @discardableResult
    func margin(_ percent: FPercent) -> FlexModifiedContent<Self, FlexMarginModifier> {
        modifier(FlexMarginModifier(margin: percent))
    }

    @discardableResult
    func margin(_ vertical: CGFloat, _ horizontal: CGFloat) -> FlexModifiedContent<Self, FlexMarginModifier> {
        modifier(FlexMarginModifier(marginHorizontal: horizontal, marginVertical: vertical))
    }

    @discardableResult
    func margin(_ vertical: FPercent, _ horizontal: FPercent) -> FlexModifiedContent<Self, FlexMarginModifier> {
        modifier(FlexMarginModifier(marginHorizontal: horizontal, marginVertical: vertical))
    }

    @discardableResult
    func margin(_ top: CGFloat, _ horizontal: CGFloat, _ bottom: CGFloat) -> FlexModifiedContent<Self, FlexMarginModifier> {
        modifier(FlexMarginModifier(marginTop: top, marginBottom: bottom, marginHorizontal: horizontal))
    }

    @discardableResult
    func margin(_ top: FPercent, _ horizontal: FPercent, _ bottom: FPercent) -> FlexModifiedContent<Self, FlexMarginModifier> {
        modifier(FlexMarginModifier(marginTop: top, marginBottom: bottom, marginHorizontal: horizontal))
    }

    @discardableResult
    func margin(_ top: CGFloat, _ left: CGFloat, _ bottom: CGFloat, _ right: CGFloat) -> FlexModifiedContent<Self, FlexMarginModifier> {
        modifier(FlexMarginModifier(marginLeft: left, marginTop: top, marginRight: right, marginBottom: bottom))
    }

    @discardableResult
    func margin(_ top: FPercent, _ left: FPercent, _ bottom: FPercent, _ right: FPercent) -> FlexModifiedContent<Self, FlexMarginModifier> {
        modifier(FlexMarginModifier(marginLeft: left, marginTop: top, marginRight: right, marginBottom: bottom))
    }
}

public extension FlexModifiedContent where Content: _FlexPositionModifierType {
    @discardableResult
    func marginLeft(_ value: CGFloat) -> FlexModifiedContent<Content, FlexMarginModifier> {
        modifier(FlexMarginModifier(marginLeft: value))
    }

    @discardableResult
    func marginLeft(_ percent: FPercent) -> FlexModifiedContent<Content, FlexMarginModifier> {
        modifier(FlexMarginModifier(marginLeft: percent))
    }

    @discardableResult
    func marginTop(_ value: CGFloat) -> FlexModifiedContent<Content, FlexMarginModifier> {
        modifier(FlexMarginModifier(marginTop: value))
    }

    @discardableResult
    func marginTop(_ percent: FPercent) -> FlexModifiedContent<Content, FlexMarginModifier> {
        modifier(FlexMarginModifier(marginTop: percent))
    }

    @discardableResult
    func marginRight(_ value: CGFloat) -> FlexModifiedContent<Content, FlexMarginModifier> {
        modifier(FlexMarginModifier(marginRight: value))
    }

    @discardableResult
    func marginRight(_ percent: FPercent) -> FlexModifiedContent<Content, FlexMarginModifier> {
        modifier(FlexMarginModifier(marginRight: percent))
    }

    @discardableResult
    func marginBottom(_ value: CGFloat) -> FlexModifiedContent<Content, FlexMarginModifier> {
        modifier(FlexMarginModifier(marginBottom: value))
    }

    @discardableResult
    func marginBottom(_ percent: FPercent) -> FlexModifiedContent<Content, FlexMarginModifier> {
        modifier(FlexMarginModifier(marginBottom: percent))
    }

    @discardableResult
    func marginStart(_ value: CGFloat) -> FlexModifiedContent<Content, FlexMarginModifier> {
        modifier(FlexMarginModifier(marginStart: value))
    }

    @discardableResult
    func marginStart(_ percent: FPercent) -> FlexModifiedContent<Content, FlexMarginModifier> {
        modifier(FlexMarginModifier(marginStart: percent))
    }

    @discardableResult
    func marginEnd(_ value: CGFloat) -> FlexModifiedContent<Content, FlexMarginModifier> {
        modifier(FlexMarginModifier(marginEnd: value))
    }

    @discardableResult
    func marginEnd(_ percent: FPercent) -> FlexModifiedContent<Content, FlexMarginModifier> {
        modifier(FlexMarginModifier(marginEnd: percent))
    }

    @discardableResult
    func marginHorizontal(_ value: CGFloat) -> FlexModifiedContent<Content, FlexMarginModifier> {
        modifier(FlexMarginModifier(marginHorizontal: value))
    }

    @discardableResult
    func marginHorizontal(_ percent: FPercent) -> FlexModifiedContent<Content, FlexMarginModifier> {
        modifier(FlexMarginModifier(marginHorizontal: percent))
    }

    @discardableResult
    func marginVertical(_ value: CGFloat) -> FlexModifiedContent<Content, FlexMarginModifier> {
        modifier(FlexMarginModifier(marginVertical: value))
    }

    @discardableResult
    func marginVertical(_ percent: FPercent) -> FlexModifiedContent<Content, FlexMarginModifier> {
        modifier(FlexMarginModifier(marginVertical: percent))
    }

    @discardableResult
    func margin(_ insets: UIEdgeInsets) -> FlexModifiedContent<Content, FlexMarginModifier> {
        modifier(FlexMarginModifier(marginLeft: insets.left, marginTop: insets.top, marginRight: insets.right, marginBottom: insets.bottom))
    }

    @discardableResult
    func margin(_ directionalInsets: NSDirectionalEdgeInsets) -> FlexModifiedContent<Content, FlexMarginModifier> {
        modifier(FlexMarginModifier(marginTop: directionalInsets.top, marginBottom: directionalInsets.bottom, marginStart: directionalInsets.leading, marginEnd: directionalInsets.trailing))
    }

    @discardableResult
    func margin(_ value: CGFloat) -> FlexModifiedContent<Content, FlexMarginModifier> {
        modifier(FlexMarginModifier(margin: value))
    }

    @discardableResult
    func margin(_ percent: FPercent) -> FlexModifiedContent<Content, FlexMarginModifier> {
        modifier(FlexMarginModifier(margin: percent))
    }

    @discardableResult
    func margin(_ vertical: CGFloat, _ horizontal: CGFloat) -> FlexModifiedContent<Content, FlexMarginModifier> {
        modifier(FlexMarginModifier(marginHorizontal: horizontal, marginVertical: vertical))
    }

    @discardableResult
    func margin(_ vertical: FPercent, _ horizontal: FPercent) -> FlexModifiedContent<Content, FlexMarginModifier> {
        modifier(FlexMarginModifier(marginHorizontal: horizontal, marginVertical: vertical))
    }

    @discardableResult
    func margin(_ top: CGFloat, _ horizontal: CGFloat, _ bottom: CGFloat) -> FlexModifiedContent<Content, FlexMarginModifier> {
        modifier(FlexMarginModifier(marginTop: top, marginBottom: bottom, marginHorizontal: horizontal))
    }

    @discardableResult
    func margin(_ top: FPercent, _ horizontal: FPercent, _ bottom: FPercent) -> FlexModifiedContent<Content, FlexMarginModifier> {
        modifier(FlexMarginModifier(marginTop: top, marginBottom: bottom, marginHorizontal: horizontal))
    }

    @discardableResult
    func margin(_ top: CGFloat, _ left: CGFloat, _ bottom: CGFloat, _ right: CGFloat) -> FlexModifiedContent<Content, FlexMarginModifier> {
        modifier(FlexMarginModifier(marginLeft: left, marginTop: top, marginRight: right, marginBottom: bottom))
    }

    @discardableResult
    func margin(_ top: FPercent, _ left: FPercent, _ bottom: FPercent, _ right: FPercent) -> FlexModifiedContent<Content, FlexMarginModifier> {
        modifier(FlexMarginModifier(marginLeft: left, marginTop: top, marginRight: right, marginBottom: bottom))
    }
}

public extension FlexModifiedContent where Content: _FlexModifiedContentType, Modifier == FlexMarginModifier {
    @discardableResult
    func marginLeft(_ value: CGFloat) -> Self {
        modifier.marginLeftPointer.value = FlexValue(value)
        return self
    }

    @discardableResult
    func marginLeft(_ percent: FPercent) -> Self {
        modifier.marginLeftPointer.value = FlexValue(percent)
        return self
    }

    @discardableResult
    func marginTop(_ value: CGFloat) -> Self {
        modifier.marginTopPointer.value = FlexValue(value)
        return self
    }

    @discardableResult
    func marginTop(_ percent: FPercent) -> Self {
        modifier.marginTopPointer.value = FlexValue(percent)
        return self
    }

    @discardableResult
    func marginRight(_ value: CGFloat) -> Self {
        modifier.marginRightPointer.value = FlexValue(value)
        return self
    }

    @discardableResult
    func marginRight(_ percent: FPercent) -> Self {
        modifier.marginRightPointer.value = FlexValue(percent)
        return self
    }

    @discardableResult
    func marginBottom(_ value: CGFloat) -> Self {
        modifier.marginBottomPointer.value = FlexValue(value)
        return self
    }

    @discardableResult
    func marginBottom(_ percent: FPercent) -> Self {
        modifier.marginBottomPointer.value = FlexValue(percent)
        return self
    }

    @discardableResult
    func marginStart(_ value: CGFloat) -> Self {
        modifier.marginStartPointer.value = FlexValue(value)
        return self
    }

    @discardableResult
    func marginStart(_ percent: FPercent) -> Self {
        modifier.marginStartPointer.value = FlexValue(percent)
        return self
    }

    @discardableResult
    func marginEnd(_ value: CGFloat) -> Self {
        modifier.marginEndPointer.value = FlexValue(value)
        return self
    }

    @discardableResult
    func marginEnd(_ percent: FPercent) -> Self {
        modifier.marginEndPointer.value = FlexValue(percent)
        return self
    }

    @discardableResult
    func marginHorizontal(_ value: CGFloat) -> Self {
        modifier.marginHorizontalPointer.value = FlexValue(value)
        return self
    }

    @discardableResult
    func marginHorizontal(_ percent: FPercent) -> Self {
        modifier.marginHorizontalPointer.value = FlexValue(percent)
        return self
    }

    @discardableResult
    func marginVertical(_ value: CGFloat) -> Self {
        modifier.marginVerticalPointer.value = FlexValue(value)
        return marginTop(value).marginBottom(value)
    }

    @discardableResult
    func marginVertical(_ percent: FPercent) -> Self {
        modifier.marginVerticalPointer.value = FlexValue(percent)
        return self
    }

    @discardableResult
    func margin(_ insets: UIEdgeInsets) -> Self {
        marginLeft(insets.left).marginTop(insets.top).marginRight(insets.right).marginBottom(insets.bottom)
    }

    @discardableResult
    func margin(_ directionalInsets: NSDirectionalEdgeInsets) -> Self {
        marginStart(directionalInsets.leading).marginTop(directionalInsets.top).marginEnd(directionalInsets.trailing).marginBottom(directionalInsets.bottom)
    }

    @discardableResult
    func margin(_ value: CGFloat) -> Self {
        modifier.marginPointer.value = FlexValue(value)
        return self
    }

    @discardableResult
    func margin(_ percent: FPercent) -> Self {
        modifier.marginPointer.value = FlexValue(percent)
        return self
    }

    @discardableResult
    func margin(_ vertical: CGFloat, _ horizontal: CGFloat) -> Self {
        marginVertical(vertical).marginHorizontal(horizontal)
    }

    @discardableResult
    func margin(_ vertical: FPercent, _ horizontal: FPercent) -> Self {
        marginVertical(vertical).marginHorizontal(horizontal)
    }

    @discardableResult
    func margin(_ top: CGFloat, _ horizontal: CGFloat, _ bottom: CGFloat) -> Self {
        marginTop(top).marginHorizontal(horizontal).marginBottom(bottom)
    }

    @discardableResult
    func margin(_ top: FPercent, _ horizontal: FPercent, _ bottom: FPercent) -> Self {
        marginTop(top).marginHorizontal(horizontal).marginBottom(bottom)
    }

    @discardableResult
    func margin(_ top: CGFloat, _ left: CGFloat, _ bottom: CGFloat, _ right: CGFloat) -> Self {
        marginTop(top).marginLeft(left).marginBottom(bottom).marginRight(right)
    }

    @discardableResult
    func margin(_ top: FPercent, _ left: FPercent, _ bottom: FPercent, _ right: FPercent) -> Self {
        marginTop(top).marginLeft(left).marginBottom(bottom).marginRight(right)
    }
}
