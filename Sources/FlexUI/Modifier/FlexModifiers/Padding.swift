//
//  Padding.swift
//  FlexUI
//
//  Created by arcangelw on 2024/10/8.
//

import FlexLayout
import UIKit

/// 表示支持 `padding` 修饰符的协议。
///
/// `_FlexPaddingModifierType` 协议作为标记协议，没有定义任何方法或属性，用于标识实现该协议的视图可以应用 `padding`相关 修饰符。
public protocol _FlexPaddingModifierType {}

/// 一个用于修改 Flex 布局中 `padding` 相关属性的修饰器。
///
///
/// `FlexPaddingModifier` 允许通过 Flex 布局系统的 `padding`相关属性设置视图的内边距。通过实现 `_FlexModifierType`，它可以应用到任何遵循 `FlexView` 的布局视图上。
public struct FlexPaddingModifier: _FlexModifierType {
    // 左侧内边距指针
    var paddingLeftPointer: FlexValuePointer
    // 顶部内边距指针
    var paddingTopPointer: FlexValuePointer
    // 右侧内边距指针
    var paddingRightPointer: FlexValuePointer
    // 底部内边距指针
    var paddingBottomPointer: FlexValuePointer
    // 开始内边距指针（用于支持从左到右和从右到左的布局）
    var paddingStartPointer: FlexValuePointer
    // 结束内边距指针（用于支持从左到右和从右到左的布局）
    var paddingEndPointer: FlexValuePointer
    // 水平内边距指针
    var paddingHorizontalPointer: FlexValuePointer
    // 垂直内边距指针
    var paddingVerticalPointer: FlexValuePointer
    // 通用内边距指针
    var paddingPointer: FlexValuePointer

    /// 使用指定的内边距值初始化修饰符。
    /// - Parameters:
    ///   - paddingLeft: 左侧内边距，默认为 `IgnoredFlexCGFloatValue`。
    ///   - paddingTop: 顶部内边距，默认为 `IgnoredFlexCGFloatValue`。
    ///   - paddingRight: 右侧内边距，默认为 `IgnoredFlexCGFloatValue`。
    ///   - paddingBottom: 底部内边距，默认为 `IgnoredFlexCGFloatValue`。
    ///   - paddingStart: 开始内边距，默认为 `IgnoredFlexCGFloatValue`。
    ///   - paddingEnd: 结束内边距，默认为 `IgnoredFlexCGFloatValue`。
    ///   - paddingHorizontal: 水平内边距，默认为 `IgnoredFlexCGFloatValue`。
    ///   - paddingVertical: 垂直内边距，默认为 `IgnoredFlexCGFloatValue`。
    ///   - padding: 通用内边距，默认为 `IgnoredFlexCGFloatValue`。
    init(
        paddingLeft: CGFloat? = IgnoredFlexCGFloatValue,
        paddingTop: CGFloat? = IgnoredFlexCGFloatValue,
        paddingRight: CGFloat? = IgnoredFlexCGFloatValue,
        paddingBottom: CGFloat? = IgnoredFlexCGFloatValue,
        paddingStart: CGFloat? = IgnoredFlexCGFloatValue,
        paddingEnd: CGFloat? = IgnoredFlexCGFloatValue,
        paddingHorizontal: CGFloat? = IgnoredFlexCGFloatValue,
        paddingVertical: CGFloat? = IgnoredFlexCGFloatValue,
        padding: CGFloat? = IgnoredFlexCGFloatValue
    ) {
        paddingLeftPointer = FlexValuePointer(paddingLeft)
        paddingTopPointer = FlexValuePointer(paddingTop)
        paddingRightPointer = FlexValuePointer(paddingRight)
        paddingBottomPointer = FlexValuePointer(paddingBottom)
        paddingStartPointer = FlexValuePointer(paddingStart)
        paddingEndPointer = FlexValuePointer(paddingEnd)
        paddingHorizontalPointer = FlexValuePointer(paddingHorizontal)
        paddingVerticalPointer = FlexValuePointer(paddingVertical)
        paddingPointer = FlexValuePointer(padding)
    }

    /// 使用百分比内边距值初始化修饰符。
    /// - Parameters:
    ///   - paddingLeft: 左侧内边距百分比值。
    ///   - paddingTop: 顶部内边距百分比值。
    ///   - paddingRight: 右侧内边距百分比值。
    ///   - paddingBottom: 底部内边距百分比值。
    ///   - paddingStart: 开始内边距百分比值。
    ///   - paddingEnd: 结束内边距百分比值。
    ///   - paddingHorizontal: 水平内边距百分比值。
    ///   - paddingVertical: 垂直内边距百分比值。
    ///   - padding: 通用内边距百分比值。
    init(
        paddingLeft: FPercent? = nil,
        paddingTop: FPercent? = nil,
        paddingRight: FPercent? = nil,
        paddingBottom: FPercent? = nil,
        paddingStart: FPercent? = nil,
        paddingEnd: FPercent? = nil,
        paddingHorizontal: FPercent? = nil,
        paddingVertical: FPercent? = nil,
        padding: FPercent? = nil
    ) {
        paddingLeftPointer = FlexValuePointer(paddingLeft)
        paddingTopPointer = FlexValuePointer(paddingTop)
        paddingRightPointer = FlexValuePointer(paddingRight)
        paddingBottomPointer = FlexValuePointer(paddingBottom)
        paddingStartPointer = FlexValuePointer(paddingStart)
        paddingEndPointer = FlexValuePointer(paddingEnd)
        paddingHorizontalPointer = FlexValuePointer(paddingHorizontal)
        paddingVerticalPointer = FlexValuePointer(paddingVertical)
        paddingPointer = FlexValuePointer(padding)
    }

    /// 应用内边距到指定的视图。
    /// - Parameter element: 需要修改的视图。
    /// - Returns: 经过修改的视图。
    public func modify(element: any FlexView) -> any FlexView {
        let flex = element.view.flex
        paddingLeftPointer.bindNoOptionalValue(flex.paddingLeft(_:), flex.paddingLeft(_:))
        paddingTopPointer.bindNoOptionalValue(flex.paddingTop(_:), flex.paddingTop(_:))
        paddingRightPointer.bindNoOptionalValue(flex.paddingRight(_:), flex.paddingRight(_:))
        paddingBottomPointer.bindNoOptionalValue(flex.paddingBottom(_:), flex.paddingBottom(_:))
        paddingStartPointer.bindNoOptionalValue(flex.paddingStart(_:), flex.paddingStart(_:))
        paddingEndPointer.bindNoOptionalValue(flex.paddingEnd(_:), flex.paddingEnd(_:))
        paddingHorizontalPointer.bindNoOptionalValue(flex.paddingHorizontal(_:), flex.paddingHorizontal(_:))
        paddingVerticalPointer.bindNoOptionalValue(flex.paddingVertical(_:), flex.paddingVertical(_:))
        paddingPointer.bindNoOptionalValue(flex.padding(_:), flex.padding(_:))
        return element
    }
}

public extension _FlexViewType where Self: _FlexPaddingModifierType {
    @discardableResult
    func paddingLeft(_ value: CGFloat) -> FlexModifiedContent<Self, FlexPaddingModifier> {
        modifier(FlexPaddingModifier(paddingLeft: value))
    }

    @discardableResult
    func paddingLeft(_ percent: FPercent) -> FlexModifiedContent<Self, FlexPaddingModifier> {
        modifier(FlexPaddingModifier(paddingLeft: percent))
    }

    @discardableResult
    func paddingTop(_ value: CGFloat) -> FlexModifiedContent<Self, FlexPaddingModifier> {
        modifier(FlexPaddingModifier(paddingTop: value))
    }

    @discardableResult
    func paddingTop(_ percent: FPercent) -> FlexModifiedContent<Self, FlexPaddingModifier> {
        modifier(FlexPaddingModifier(paddingTop: percent))
    }

    @discardableResult
    func paddingRight(_ value: CGFloat) -> FlexModifiedContent<Self, FlexPaddingModifier> {
        modifier(FlexPaddingModifier(paddingRight: value))
    }

    @discardableResult
    func paddingRight(_ percent: FPercent) -> FlexModifiedContent<Self, FlexPaddingModifier> {
        modifier(FlexPaddingModifier(paddingRight: percent))
    }

    @discardableResult
    func paddingBottom(_ value: CGFloat) -> FlexModifiedContent<Self, FlexPaddingModifier> {
        modifier(FlexPaddingModifier(paddingBottom: value))
    }

    @discardableResult
    func paddingBottom(_ percent: FPercent) -> FlexModifiedContent<Self, FlexPaddingModifier> {
        modifier(FlexPaddingModifier(paddingBottom: percent))
    }

    @discardableResult
    func paddingStart(_ value: CGFloat) -> FlexModifiedContent<Self, FlexPaddingModifier> {
        modifier(FlexPaddingModifier(paddingStart: value))
    }

    @discardableResult
    func paddingStart(_ percent: FPercent) -> FlexModifiedContent<Self, FlexPaddingModifier> {
        modifier(FlexPaddingModifier(paddingStart: percent))
    }

    @discardableResult
    func paddingEnd(_ value: CGFloat) -> FlexModifiedContent<Self, FlexPaddingModifier> {
        modifier(FlexPaddingModifier(paddingEnd: value))
    }

    @discardableResult
    func paddingEnd(_ percent: FPercent) -> FlexModifiedContent<Self, FlexPaddingModifier> {
        modifier(FlexPaddingModifier(paddingEnd: percent))
    }

    @discardableResult
    func paddingHorizontal(_ value: CGFloat) -> FlexModifiedContent<Self, FlexPaddingModifier> {
        modifier(FlexPaddingModifier(paddingHorizontal: value))
    }

    @discardableResult
    func paddingHorizontal(_ percent: FPercent) -> FlexModifiedContent<Self, FlexPaddingModifier> {
        modifier(FlexPaddingModifier(paddingHorizontal: percent))
    }

    @discardableResult
    func paddingVertical(_ value: CGFloat) -> FlexModifiedContent<Self, FlexPaddingModifier> {
        modifier(FlexPaddingModifier(paddingVertical: value))
    }

    @discardableResult
    func paddingVertical(_ percent: FPercent) -> FlexModifiedContent<Self, FlexPaddingModifier> {
        modifier(FlexPaddingModifier(paddingVertical: percent))
    }

    @discardableResult
    func padding(_ insets: UIEdgeInsets) -> FlexModifiedContent<Self, FlexPaddingModifier> {
        modifier(FlexPaddingModifier(paddingLeft: insets.left, paddingTop: insets.top, paddingRight: insets.right, paddingBottom: insets.bottom))
    }

    @discardableResult
    func padding(_ directionalInsets: NSDirectionalEdgeInsets) -> FlexModifiedContent<Self, FlexPaddingModifier> {
        modifier(FlexPaddingModifier(paddingTop: directionalInsets.top, paddingBottom: directionalInsets.bottom, paddingStart: directionalInsets.leading, paddingEnd: directionalInsets.trailing))
    }

    @discardableResult
    func padding(_ value: CGFloat) -> FlexModifiedContent<Self, FlexPaddingModifier> {
        modifier(FlexPaddingModifier(padding: value))
    }

    @discardableResult
    func padding(_ percent: FPercent) -> FlexModifiedContent<Self, FlexPaddingModifier> {
        modifier(FlexPaddingModifier(padding: percent))
    }

    @discardableResult
    func padding(_ vertical: CGFloat, _ horizontal: CGFloat) -> FlexModifiedContent<Self, FlexPaddingModifier> {
        modifier(FlexPaddingModifier(paddingHorizontal: horizontal, paddingVertical: vertical))
    }

    @discardableResult
    func padding(_ vertical: FPercent, _ horizontal: FPercent) -> FlexModifiedContent<Self, FlexPaddingModifier> {
        modifier(FlexPaddingModifier(paddingHorizontal: horizontal, paddingVertical: vertical))
    }

    @discardableResult
    func padding(_ top: CGFloat, _ horizontal: CGFloat, _ bottom: CGFloat) -> FlexModifiedContent<Self, FlexPaddingModifier> {
        modifier(FlexPaddingModifier(paddingTop: top, paddingBottom: bottom, paddingHorizontal: horizontal))
    }

    @discardableResult
    func padding(_ top: FPercent, _ horizontal: FPercent, _ bottom: FPercent) -> FlexModifiedContent<Self, FlexPaddingModifier> {
        modifier(FlexPaddingModifier(paddingTop: top, paddingBottom: bottom, paddingHorizontal: horizontal))
    }

    @discardableResult
    func padding(_ top: CGFloat, _ left: CGFloat, _ bottom: CGFloat, _ right: CGFloat) -> FlexModifiedContent<Self, FlexPaddingModifier> {
        modifier(FlexPaddingModifier(paddingLeft: left, paddingTop: top, paddingRight: right, paddingBottom: bottom))
    }

    @discardableResult
    func padding(_ top: FPercent, _ left: FPercent, _ bottom: FPercent, _ right: FPercent) -> FlexModifiedContent<Self, FlexPaddingModifier> {
        modifier(FlexPaddingModifier(paddingLeft: left, paddingTop: top, paddingRight: right, paddingBottom: bottom))
    }
}

public extension FlexModifiedContent where Content: _FlexPaddingModifierType {
    @discardableResult
    func paddingLeft(_ value: CGFloat) -> FlexModifiedContent<Content, FlexPaddingModifier> {
        modifier(FlexPaddingModifier(paddingLeft: value))
    }

    @discardableResult
    func paddingLeft(_ percent: FPercent) -> FlexModifiedContent<Content, FlexPaddingModifier> {
        modifier(FlexPaddingModifier(paddingLeft: percent))
    }

    @discardableResult
    func paddingTop(_ value: CGFloat) -> FlexModifiedContent<Content, FlexPaddingModifier> {
        modifier(FlexPaddingModifier(paddingTop: value))
    }

    @discardableResult
    func paddingTop(_ percent: FPercent) -> FlexModifiedContent<Content, FlexPaddingModifier> {
        modifier(FlexPaddingModifier(paddingTop: percent))
    }

    @discardableResult
    func paddingRight(_ value: CGFloat) -> FlexModifiedContent<Content, FlexPaddingModifier> {
        modifier(FlexPaddingModifier(paddingRight: value))
    }

    @discardableResult
    func paddingRight(_ percent: FPercent) -> FlexModifiedContent<Content, FlexPaddingModifier> {
        modifier(FlexPaddingModifier(paddingRight: percent))
    }

    @discardableResult
    func paddingBottom(_ value: CGFloat) -> FlexModifiedContent<Content, FlexPaddingModifier> {
        modifier(FlexPaddingModifier(paddingBottom: value))
    }

    @discardableResult
    func paddingBottom(_ percent: FPercent) -> FlexModifiedContent<Content, FlexPaddingModifier> {
        modifier(FlexPaddingModifier(paddingBottom: percent))
    }

    @discardableResult
    func paddingStart(_ value: CGFloat) -> FlexModifiedContent<Content, FlexPaddingModifier> {
        modifier(FlexPaddingModifier(paddingStart: value))
    }

    @discardableResult
    func paddingStart(_ percent: FPercent) -> FlexModifiedContent<Content, FlexPaddingModifier> {
        modifier(FlexPaddingModifier(paddingStart: percent))
    }

    @discardableResult
    func paddingEnd(_ value: CGFloat) -> FlexModifiedContent<Content, FlexPaddingModifier> {
        modifier(FlexPaddingModifier(paddingEnd: value))
    }

    @discardableResult
    func paddingEnd(_ percent: FPercent) -> FlexModifiedContent<Content, FlexPaddingModifier> {
        modifier(FlexPaddingModifier(paddingEnd: percent))
    }

    @discardableResult
    func paddingHorizontal(_ value: CGFloat) -> FlexModifiedContent<Content, FlexPaddingModifier> {
        modifier(FlexPaddingModifier(paddingHorizontal: value))
    }

    @discardableResult
    func paddingHorizontal(_ percent: FPercent) -> FlexModifiedContent<Content, FlexPaddingModifier> {
        modifier(FlexPaddingModifier(paddingHorizontal: percent))
    }

    @discardableResult
    func paddingVertical(_ value: CGFloat) -> FlexModifiedContent<Content, FlexPaddingModifier> {
        modifier(FlexPaddingModifier(paddingVertical: value))
    }

    @discardableResult
    func paddingVertical(_ percent: FPercent) -> FlexModifiedContent<Content, FlexPaddingModifier> {
        modifier(FlexPaddingModifier(paddingVertical: percent))
    }

    @discardableResult
    func padding(_ insets: UIEdgeInsets) -> FlexModifiedContent<Content, FlexPaddingModifier> {
        modifier(FlexPaddingModifier(paddingLeft: insets.left, paddingTop: insets.top, paddingRight: insets.right, paddingBottom: insets.bottom))
    }

    @discardableResult
    func padding(_ directionalInsets: NSDirectionalEdgeInsets) -> FlexModifiedContent<Content, FlexPaddingModifier> {
        modifier(FlexPaddingModifier(paddingTop: directionalInsets.top, paddingBottom: directionalInsets.bottom, paddingStart: directionalInsets.leading, paddingEnd: directionalInsets.trailing))
    }

    @discardableResult
    func padding(_ value: CGFloat) -> FlexModifiedContent<Content, FlexPaddingModifier> {
        modifier(FlexPaddingModifier(padding: value))
    }

    @discardableResult
    func padding(_ percent: FPercent) -> FlexModifiedContent<Content, FlexPaddingModifier> {
        modifier(FlexPaddingModifier(padding: percent))
    }

    @discardableResult
    func padding(_ vertical: CGFloat, _ horizontal: CGFloat) -> FlexModifiedContent<Content, FlexPaddingModifier> {
        modifier(FlexPaddingModifier(paddingHorizontal: horizontal, paddingVertical: vertical))
    }

    @discardableResult
    func padding(_ vertical: FPercent, _ horizontal: FPercent) -> FlexModifiedContent<Content, FlexPaddingModifier> {
        modifier(FlexPaddingModifier(paddingHorizontal: horizontal, paddingVertical: vertical))
    }

    @discardableResult
    func padding(_ top: CGFloat, _ horizontal: CGFloat, _ bottom: CGFloat) -> FlexModifiedContent<Content, FlexPaddingModifier> {
        modifier(FlexPaddingModifier(paddingTop: top, paddingBottom: bottom, paddingHorizontal: horizontal))
    }

    @discardableResult
    func padding(_ top: FPercent, _ horizontal: FPercent, _ bottom: FPercent) -> FlexModifiedContent<Content, FlexPaddingModifier> {
        modifier(FlexPaddingModifier(paddingTop: top, paddingBottom: bottom, paddingHorizontal: horizontal))
    }

    @discardableResult
    func padding(_ top: CGFloat, _ left: CGFloat, _ bottom: CGFloat, _ right: CGFloat) -> FlexModifiedContent<Content, FlexPaddingModifier> {
        modifier(FlexPaddingModifier(paddingLeft: left, paddingTop: top, paddingRight: right, paddingBottom: bottom))
    }

    @discardableResult
    func padding(_ top: FPercent, _ left: FPercent, _ bottom: FPercent, _ right: FPercent) -> FlexModifiedContent<Content, FlexPaddingModifier> {
        modifier(FlexPaddingModifier(paddingLeft: left, paddingTop: top, paddingRight: right, paddingBottom: bottom))
    }
}

public extension FlexModifiedContent where Content: _FlexModifiedContentType, Modifier == FlexPaddingModifier {
    @discardableResult
    func paddingLeft(_ value: CGFloat) -> Self {
        modifier.paddingLeftPointer.value = FlexValue(value)
        return self
    }

    @discardableResult
    func paddingLeft(_ percent: FPercent) -> Self {
        modifier.paddingLeftPointer.value = FlexValue(percent)
        return self
    }

    @discardableResult
    func paddingTop(_ value: CGFloat) -> Self {
        modifier.paddingTopPointer.value = FlexValue(value)
        return self
    }

    @discardableResult
    func paddingTop(_ percent: FPercent) -> Self {
        modifier.paddingTopPointer.value = FlexValue(percent)
        return self
    }

    @discardableResult
    func paddingRight(_ value: CGFloat) -> Self {
        modifier.paddingRightPointer.value = FlexValue(value)
        return self
    }

    @discardableResult
    func paddingRight(_ percent: FPercent) -> Self {
        modifier.paddingRightPointer.value = FlexValue(percent)
        return self
    }

    @discardableResult
    func paddingBottom(_ value: CGFloat) -> Self {
        modifier.paddingBottomPointer.value = FlexValue(value)
        return self
    }

    @discardableResult
    func paddingBottom(_ percent: FPercent) -> Self {
        modifier.paddingBottomPointer.value = FlexValue(percent)
        return self
    }

    @discardableResult
    func paddingStart(_ value: CGFloat) -> Self {
        modifier.paddingStartPointer.value = FlexValue(value)
        return self
    }

    @discardableResult
    func paddingStart(_ percent: FPercent) -> Self {
        modifier.paddingStartPointer.value = FlexValue(percent)
        return self
    }

    @discardableResult
    func paddingEnd(_ value: CGFloat) -> Self {
        modifier.paddingEndPointer.value = FlexValue(value)
        return self
    }

    @discardableResult
    func paddingEnd(_ percent: FPercent) -> Self {
        modifier.paddingEndPointer.value = FlexValue(percent)
        return self
    }

    @discardableResult
    func paddingHorizontal(_ value: CGFloat) -> Self {
        modifier.paddingHorizontalPointer.value = FlexValue(value)
        return self
    }

    @discardableResult
    func paddingHorizontal(_ percent: FPercent) -> Self {
        modifier.paddingHorizontalPointer.value = FlexValue(percent)
        return self
    }

    @discardableResult
    func paddingVertical(_ value: CGFloat) -> Self {
        modifier.paddingVerticalPointer.value = FlexValue(value)
        return paddingTop(value).paddingBottom(value)
    }

    @discardableResult
    func paddingVertical(_ percent: FPercent) -> Self {
        modifier.paddingVerticalPointer.value = FlexValue(percent)
        return self
    }

    @discardableResult
    func padding(_ insets: UIEdgeInsets) -> Self {
        paddingLeft(insets.left).paddingTop(insets.top).paddingRight(insets.right).paddingBottom(insets.bottom)
    }

    @discardableResult
    func padding(_ directionalInsets: NSDirectionalEdgeInsets) -> Self {
        paddingStart(directionalInsets.leading).paddingTop(directionalInsets.top).paddingEnd(directionalInsets.trailing).paddingBottom(directionalInsets.bottom)
    }

    @discardableResult
    func padding(_ value: CGFloat) -> Self {
        modifier.paddingPointer.value = FlexValue(value)
        return self
    }

    @discardableResult
    func padding(_ percent: FPercent) -> Self {
        modifier.paddingPointer.value = FlexValue(percent)
        return self
    }

    @discardableResult
    func padding(_ vertical: CGFloat, _ horizontal: CGFloat) -> Self {
        paddingVertical(vertical).paddingHorizontal(horizontal)
    }

    @discardableResult
    func padding(_ vertical: FPercent, _ horizontal: FPercent) -> Self {
        paddingVertical(vertical).paddingHorizontal(horizontal)
    }

    @discardableResult
    func padding(_ top: CGFloat, _ horizontal: CGFloat, _ bottom: CGFloat) -> Self {
        paddingTop(top).paddingHorizontal(horizontal).paddingBottom(bottom)
    }

    @discardableResult
    func padding(_ top: FPercent, _ horizontal: FPercent, _ bottom: FPercent) -> Self {
        paddingTop(top).paddingHorizontal(horizontal).paddingBottom(bottom)
    }

    @discardableResult
    func padding(_ top: CGFloat, _ left: CGFloat, _ bottom: CGFloat, _ right: CGFloat) -> Self {
        paddingTop(top).paddingLeft(left).paddingBottom(bottom).paddingRight(right)
    }

    @discardableResult
    func padding(_ top: FPercent, _ left: FPercent, _ bottom: FPercent, _ right: FPercent) -> Self {
        paddingTop(top).paddingLeft(left).paddingBottom(bottom).paddingRight(right)
    }
}
