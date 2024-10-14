//
//  PositionInset.swift
//  FlexUI
//
//  Created by arcangelw on 2024/10/8.
//

import FlexLayout
import UIKit

/// 用于定义和修改视图的内边距的修饰符。
///
/// `FlexInsetModifier` 允许通过 Flex 布局系统的内边距属性设置视图的边距。它支持不同单位的值，包括 `CGFloat` 和 `FPercent`，并可应用于任何遵循 `FlexView` 的视图。
public struct FlexInsetModifier: _FlexModifierType {
    // 左边距的指针
    var leftPointer: FlexValuePointer
    // 上边距的指针
    var topPointer: FlexValuePointer
    // 右边距的指针
    var rightPointer: FlexValuePointer
    // 下边距的指针
    var bottomPointer: FlexValuePointer
    // 开始边距的指针
    var startPointer: FlexValuePointer
    // 结束边距的指针
    var endPointer: FlexValuePointer

    /// 使用 `CGFloat` 值初始化内边距修饰符。
    ///
    /// - Parameters:
    ///   - left: 左边距的 `CGFloat` 值，默认为 `IgnoredFlexCGFloatValue`。
    ///   - top: 上边距的 `CGFloat` 值，默认为 `IgnoredFlexCGFloatValue`。
    ///   - right: 右边距的 `CGFloat` 值，默认为 `IgnoredFlexCGFloatValue`。
    ///   - bottom: 下边距的 `CGFloat` 值，默认为 `IgnoredFlexCGFloatValue`。
    ///   - start: 开始边距的 `CGFloat` 值，默认为 `IgnoredFlexCGFloatValue`。
    ///   - end: 结束边距的 `CGFloat` 值，默认为 `IgnoredFlexCGFloatValue`。
    init(
        left: CGFloat? = IgnoredFlexCGFloatValue,
        top: CGFloat? = IgnoredFlexCGFloatValue,
        right: CGFloat? = IgnoredFlexCGFloatValue,
        bottom: CGFloat? = IgnoredFlexCGFloatValue,
        start: CGFloat? = IgnoredFlexCGFloatValue,
        end: CGFloat? = IgnoredFlexCGFloatValue
    ) {
        leftPointer = FlexValuePointer(left)
        topPointer = FlexValuePointer(top)
        rightPointer = FlexValuePointer(right)
        bottomPointer = FlexValuePointer(bottom)
        startPointer = FlexValuePointer(start)
        endPointer = FlexValuePointer(end)
    }

    /// 使用 `FPercent` 值初始化内边距修饰符。
    ///
    /// - Parameters:
    ///   - left: 左边距的 `FPercent` 值，默认为 `nil`。
    ///   - top: 上边距的 `FPercent` 值，默认为 `nil`。
    ///   - right: 右边距的 `FPercent` 值，默认为 `nil`。
    ///   - bottom: 下边距的 `FPercent` 值，默认为 `nil`。
    ///   - start: 开始边距的 `FPercent` 值，默认为 `nil`。
    ///   - end: 结束边距的 `FPercent` 值，默认为 `nil`。
    init(
        left: FPercent? = nil,
        top: FPercent? = nil,
        right: FPercent? = nil,
        bottom: FPercent? = nil,
        start: FPercent? = nil,
        end: FPercent? = nil
    ) {
        leftPointer = FlexValuePointer(left)
        topPointer = FlexValuePointer(top)
        rightPointer = FlexValuePointer(right)
        bottomPointer = FlexValuePointer(bottom)
        startPointer = FlexValuePointer(start)
        endPointer = FlexValuePointer(end)
    }

    /// 修改给定的 Flex 布局视图的内边距属性。
    ///
    /// - Parameter element: 需要被修改的视图，必须遵循 `FlexView` 协议。
    /// - Returns: 修改后的视图，应用了内边距属性。
    @_spi(Internals)
    public func modify(element: any FlexView) -> any FlexView {
        let flex = element.view.flex
        leftPointer.bindNoOptionalValue(flex.left(_:), flex.left(_:))
        topPointer.bindNoOptionalValue(flex.top(_:), flex.top(_:))
        rightPointer.bindNoOptionalValue(flex.right(_:), flex.right(_:))
        bottomPointer.bindNoOptionalValue(flex.bottom(_:), flex.bottom(_:))
        startPointer.bindNoOptionalValue(flex.start(_:), flex.start(_:))
        endPointer.bindNoOptionalValue(flex.end(_:), flex.end(_:))
        return element
    }
}

public extension _FlexViewType where Self: _FlexPositionModifierType {
    @discardableResult
    func left(_ value: CGFloat) -> FlexModifiedContent<Self, FlexInsetModifier> {
        modifier(FlexInsetModifier(left: value))
    }

    @discardableResult
    func left(_ percent: FPercent) -> FlexModifiedContent<Self, FlexInsetModifier> {
        modifier(FlexInsetModifier(left: percent))
    }

    @discardableResult
    func top(_ value: CGFloat) -> FlexModifiedContent<Self, FlexInsetModifier> {
        modifier(FlexInsetModifier(top: value))
    }

    @discardableResult
    func top(_ percent: FPercent) -> FlexModifiedContent<Self, FlexInsetModifier> {
        modifier(FlexInsetModifier(top: percent))
    }

    @discardableResult
    func right(_ value: CGFloat) -> FlexModifiedContent<Self, FlexInsetModifier> {
        modifier(FlexInsetModifier(right: value))
    }

    @discardableResult
    func right(_ percent: FPercent) -> FlexModifiedContent<Self, FlexInsetModifier> {
        modifier(FlexInsetModifier(right: percent))
    }

    @discardableResult
    func bottom(_ value: CGFloat) -> FlexModifiedContent<Self, FlexInsetModifier> {
        modifier(FlexInsetModifier(bottom: value))
    }

    @discardableResult
    func bottom(_ percent: FPercent) -> FlexModifiedContent<Self, FlexInsetModifier> {
        modifier(FlexInsetModifier(bottom: percent))
    }

    @discardableResult
    func start(_ value: CGFloat) -> FlexModifiedContent<Self, FlexInsetModifier> {
        modifier(FlexInsetModifier(start: value))
    }

    @discardableResult
    func start(_ percent: FPercent) -> FlexModifiedContent<Self, FlexInsetModifier> {
        modifier(FlexInsetModifier(start: percent))
    }

    @discardableResult
    func end(_ value: CGFloat) -> FlexModifiedContent<Self, FlexInsetModifier> {
        modifier(FlexInsetModifier(end: value))
    }

    @discardableResult
    func end(_ percent: FPercent) -> FlexModifiedContent<Self, FlexInsetModifier> {
        modifier(FlexInsetModifier(end: percent))
    }

    @discardableResult
    func horizontally(_ value: CGFloat) -> FlexModifiedContent<Self, FlexInsetModifier> {
        modifier(FlexInsetModifier(left: value, right: value))
    }

    @discardableResult
    func horizontally(_ percent: FPercent) -> FlexModifiedContent<Self, FlexInsetModifier> {
        modifier(FlexInsetModifier(left: percent, right: percent))
    }

    @discardableResult
    func vertically(_ value: CGFloat) -> FlexModifiedContent<Self, FlexInsetModifier> {
        modifier(FlexInsetModifier(top: value, bottom: value))
    }

    @discardableResult
    func vertically(_ percent: FPercent) -> FlexModifiedContent<Self, FlexInsetModifier> {
        modifier(FlexInsetModifier(top: percent, bottom: percent))
    }

    @discardableResult
    func all(_ value: CGFloat) -> FlexModifiedContent<Self, FlexInsetModifier> {
        modifier(FlexInsetModifier(left: value, top: value, right: value, bottom: value))
    }

    @discardableResult
    func all(_ percent: FPercent) -> FlexModifiedContent<Self, FlexInsetModifier> {
        modifier(FlexInsetModifier(left: percent, top: percent, right: percent, bottom: percent))
    }
}

public extension FlexModifiedContent where Content: _FlexPositionModifierType {
    @discardableResult
    func left(_ value: CGFloat) -> FlexModifiedContent<Content, FlexInsetModifier> {
        modifier(FlexInsetModifier(left: value))
    }

    @discardableResult
    func left(_ percent: FPercent) -> FlexModifiedContent<Content, FlexInsetModifier> {
        modifier(FlexInsetModifier(left: percent))
    }

    @discardableResult
    func top(_ value: CGFloat) -> FlexModifiedContent<Content, FlexInsetModifier> {
        modifier(FlexInsetModifier(top: value))
    }

    @discardableResult
    func top(_ percent: FPercent) -> FlexModifiedContent<Content, FlexInsetModifier> {
        modifier(FlexInsetModifier(top: percent))
    }

    @discardableResult
    func right(_ value: CGFloat) -> FlexModifiedContent<Content, FlexInsetModifier> {
        modifier(FlexInsetModifier(right: value))
    }

    @discardableResult
    func right(_ percent: FPercent) -> FlexModifiedContent<Content, FlexInsetModifier> {
        modifier(FlexInsetModifier(right: percent))
    }

    @discardableResult
    func bottom(_ value: CGFloat) -> FlexModifiedContent<Content, FlexInsetModifier> {
        modifier(FlexInsetModifier(bottom: value))
    }

    @discardableResult
    func bottom(_ percent: FPercent) -> FlexModifiedContent<Content, FlexInsetModifier> {
        modifier(FlexInsetModifier(bottom: percent))
    }

    @discardableResult
    func start(_ value: CGFloat) -> FlexModifiedContent<Content, FlexInsetModifier> {
        modifier(FlexInsetModifier(start: value))
    }

    @discardableResult
    func start(_ percent: FPercent) -> FlexModifiedContent<Content, FlexInsetModifier> {
        modifier(FlexInsetModifier(start: percent))
    }

    @discardableResult
    func end(_ value: CGFloat) -> FlexModifiedContent<Content, FlexInsetModifier> {
        modifier(FlexInsetModifier(end: value))
    }

    @discardableResult
    func end(_ percent: FPercent) -> FlexModifiedContent<Content, FlexInsetModifier> {
        modifier(FlexInsetModifier(end: percent))
    }

    @discardableResult
    func horizontally(_ value: CGFloat) -> FlexModifiedContent<Content, FlexInsetModifier> {
        modifier(FlexInsetModifier(left: value, right: value))
    }

    @discardableResult
    func horizontally(_ percent: FPercent) -> FlexModifiedContent<Content, FlexInsetModifier> {
        modifier(FlexInsetModifier(left: percent, right: percent))
    }

    @discardableResult
    func vertically(_ value: CGFloat) -> FlexModifiedContent<Content, FlexInsetModifier> {
        modifier(FlexInsetModifier(top: value, bottom: value))
    }

    @discardableResult
    func vertically(_ percent: FPercent) -> FlexModifiedContent<Content, FlexInsetModifier> {
        modifier(FlexInsetModifier(top: percent, bottom: percent))
    }

    @discardableResult
    func all(_ value: CGFloat) -> FlexModifiedContent<Content, FlexInsetModifier> {
        modifier(FlexInsetModifier(left: value, top: value, right: value, bottom: value))
    }

    @discardableResult
    func all(_ percent: FPercent) -> FlexModifiedContent<Content, FlexInsetModifier> {
        modifier(FlexInsetModifier(left: percent, top: percent, right: percent, bottom: percent))
    }
}

public extension FlexModifiedContent where Content: _FlexModifiedContentType, Modifier == FlexInsetModifier {
    @discardableResult
    func left(_ value: CGFloat) -> Self {
        modifier.leftPointer.value = FlexValue(value)
        return self
    }

    @discardableResult
    func left(_ percent: FPercent) -> Self {
        modifier.leftPointer.value = FlexValue(percent)
        return self
    }

    @discardableResult
    func top(_ value: CGFloat) -> Self {
        modifier.topPointer.value = FlexValue(value)
        return self
    }

    @discardableResult
    func top(_ percent: FPercent) -> Self {
        modifier.topPointer.value = FlexValue(percent)
        return self
    }

    @discardableResult
    func right(_ value: CGFloat) -> Self {
        modifier.rightPointer.value = FlexValue(value)
        return self
    }

    @discardableResult
    func right(_ percent: FPercent) -> Self {
        modifier.rightPointer.value = FlexValue(percent)
        return self
    }

    @discardableResult
    func bottom(_ value: CGFloat) -> Self {
        modifier.bottomPointer.value = FlexValue(value)
        return self
    }

    @discardableResult
    func bottom(_ percent: FPercent) -> Self {
        modifier.bottomPointer.value = FlexValue(percent)
        return self
    }

    @discardableResult
    func start(_ value: CGFloat) -> Self {
        modifier.startPointer.value = FlexValue(value)
        return self
    }

    @discardableResult
    func start(_ percent: FPercent) -> Self {
        modifier.startPointer.value = FlexValue(percent)
        return self
    }

    @discardableResult
    func end(_ value: CGFloat) -> Self {
        modifier.endPointer.value = FlexValue(value)
        return self
    }

    @discardableResult
    func end(_ percent: FPercent) -> Self {
        modifier.endPointer.value = FlexValue(percent)
        return self
    }

    @discardableResult
    func horizontally(_ value: CGFloat) -> Self {
        return left(value).right(value)
    }

    @discardableResult
    func horizontally(_ percent: FPercent) -> Self {
        return left(percent).right(percent)
    }

    @discardableResult
    func vertically(_ value: CGFloat) -> Self {
        return top(value).bottom(value)
    }

    @discardableResult
    func vertically(_ percent: FPercent) -> Self {
        return top(percent).bottom(percent)
    }

    @discardableResult
    func all(_ value: CGFloat) -> Self {
        return left(value).top(value).right(value).bottom(value)
    }

    @discardableResult
    func all(_ percent: FPercent) -> Self {
        return left(percent).top(percent).right(percent).bottom(percent)
    }
}
