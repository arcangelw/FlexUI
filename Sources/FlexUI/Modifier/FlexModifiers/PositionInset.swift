//
//  PositionInset.swift
//  FlexUI
//
//  Created by arcangelw on 2024/10/8.
//

import FlexLayout

/// 用于定义和修改视图的内边距的修饰符。
///
/// `FlexInsetModifier` 允许通过 Flex 布局系统的内边距属性设置视图的边距。它支持不同单位的值，包括 `CGFloat` 和 `FPercent`，并可应用于任何遵循 `_FlexView` 和 `_FlexDefinable` 的视图。
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
    /// - Parameter element: 需要被修改的视图，必须遵循 `_FlexView` 和 `_FlexDefinable` 协议。
    /// - Returns: 修改后的视图，应用了内边距属性。
    public func modify(element: any _FlexView & _FlexDefinable) -> any _FlexView & _FlexDefinable {
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
    /// 设置左边距
    ///
    /// - Parameter value: 左边距的 `CGFloat` 值。
    /// - Returns: 应用左边距修饰符后的内容。
    @discardableResult
    func left(_ value: CGFloat) -> FlexModifiedContent<Self, FlexInsetModifier> {
        modifier(FlexInsetModifier(left: value))
    }

    /// 设置左边距
    ///
    /// - Parameter percent: 左边距的 `FPercent` 值。
    /// - Returns: 应用左边距修饰符后的内容。
    @discardableResult
    func left(_ percent: FPercent) -> FlexModifiedContent<Self, FlexInsetModifier> {
        modifier(FlexInsetModifier(left: percent))
    }

    /// 设置上边距
    ///
    /// - Parameter value: 上边距的 `CGFloat` 值。
    /// - Returns: 应用上边距修饰符后的内容。
    @discardableResult
    func top(_ value: CGFloat) -> FlexModifiedContent<Self, FlexInsetModifier> {
        modifier(FlexInsetModifier(top: value))
    }

    /// 设置上边距
    ///
    /// - Parameter percent: 上边距的 `FPercent` 值。
    /// - Returns: 应用上边距修饰符后的内容。
    @discardableResult
    func top(_ percent: FPercent) -> FlexModifiedContent<Self, FlexInsetModifier> {
        modifier(FlexInsetModifier(top: percent))
    }

    /// 设置右边距
    ///
    /// - Parameter value: 右边距的 `CGFloat` 值。
    /// - Returns: 应用右边距修饰符后的内容。
    @discardableResult
    func right(_ value: CGFloat) -> FlexModifiedContent<Self, FlexInsetModifier> {
        modifier(FlexInsetModifier(right: value))
    }

    /// 设置右边距
    ///
    /// - Parameter percent: 右边距的 `FPercent` 值。
    /// - Returns: 应用右边距修饰符后的内容。
    @discardableResult
    func right(_ percent: FPercent) -> FlexModifiedContent<Self, FlexInsetModifier> {
        modifier(FlexInsetModifier(right: percent))
    }

    /// 设置下边距
    ///
    /// - Parameter value: 下边距的 `CGFloat` 值。
    /// - Returns: 应用下边距修饰符后的内容。
    @discardableResult
    func bottom(_ value: CGFloat) -> FlexModifiedContent<Self, FlexInsetModifier> {
        modifier(FlexInsetModifier(bottom: value))
    }

    /// 设置下边距
    ///
    /// - Parameter percent: 下边距的 `FPercent` 值。
    /// - Returns: 应用下边距修饰符后的内容。
    @discardableResult
    func bottom(_ percent: FPercent) -> FlexModifiedContent<Self, FlexInsetModifier> {
        modifier(FlexInsetModifier(bottom: percent))
    }

    /// 设置开始边距
    ///
    /// - Parameter value: 开始边距的 `CGFloat` 值。
    /// - Returns: 应用开始边距修饰符后的内容。
    @discardableResult
    func start(_ value: CGFloat) -> FlexModifiedContent<Self, FlexInsetModifier> {
        modifier(FlexInsetModifier(start: value))
    }

    /// 设置开始边距
    ///
    /// - Parameter percent: 开始边距的 `FPercent` 值。
    /// - Returns: 应用开始边距修饰符后的内容。
    @discardableResult
    func start(_ percent: FPercent) -> FlexModifiedContent<Self, FlexInsetModifier> {
        modifier(FlexInsetModifier(start: percent))
    }

    /// 设置结束边距
    ///
    /// - Parameter value: 结束边距的 `CGFloat` 值。
    /// - Returns: 应用结束边距修饰符后的内容。
    @discardableResult
    func end(_ value: CGFloat) -> FlexModifiedContent<Self, FlexInsetModifier> {
        modifier(FlexInsetModifier(end: value))
    }

    /// 设置结束边距
    ///
    /// - Parameter percent: 结束边距的 `FPercent` 值。
    /// - Returns: 应用结束边距修饰符后的内容。
    @discardableResult
    func end(_ percent: FPercent) -> FlexModifiedContent<Self, FlexInsetModifier> {
        modifier(FlexInsetModifier(end: percent))
    }

    /// 设置水平边距
    ///
    /// - Parameter value: 水平边距的 `CGFloat` 值。
    /// - Returns: 应用水平边距修饰符后的内容。
    @discardableResult
    func horizontally(_ value: CGFloat) -> FlexModifiedContent<Self, FlexInsetModifier> {
        modifier(FlexInsetModifier(left: value, right: value))
    }

    /// 设置水平边距
    ///
    /// - Parameter percent: 水平边距的 `FPercent` 值。
    /// - Returns: 应用水平边距修饰符后的内容。
    @discardableResult
    func horizontally(_ percent: FPercent) -> FlexModifiedContent<Self, FlexInsetModifier> {
        modifier(FlexInsetModifier(left: percent, right: percent))
    }

    /// 设置垂直边距
    ///
    /// - Parameter value: 垂直边距的 `CGFloat` 值。
    /// - Returns: 应用垂直边距修饰符后的内容。
    @discardableResult
    func vertically(_ value: CGFloat) -> FlexModifiedContent<Self, FlexInsetModifier> {
        modifier(FlexInsetModifier(top: value, bottom: value))
    }

    /// 设置垂直边距
    ///
    /// - Parameter percent: 垂直边距的 `FPercent` 值。
    /// - Returns: 应用垂直边距修饰符后的内容。
    @discardableResult
    func vertically(_ percent: FPercent) -> FlexModifiedContent<Self, FlexInsetModifier> {
        modifier(FlexInsetModifier(top: percent, bottom: percent))
    }

    /// 设置所有边距
    ///
    /// - Parameter value: 所有边距的 `CGFloat` 值。
    /// - Returns: 应用所有边距修饰符后的内容。
    @discardableResult
    func all(_ value: CGFloat) -> FlexModifiedContent<Self, FlexInsetModifier> {
        modifier(FlexInsetModifier(left: value, top: value, right: value, bottom: value))
    }

    /// 设置所有边距
    ///
    /// - Parameter percent: 所有边距的 `FPercent` 值。
    /// - Returns: 应用所有边距修饰符后的内容。
    @discardableResult
    func all(_ percent: FPercent) -> FlexModifiedContent<Self, FlexInsetModifier> {
        modifier(FlexInsetModifier(left: percent, top: percent, right: percent, bottom: percent))
    }
}

public extension FlexModifiedContent where Content: _FlexPositionModifierType {
    /// 设置左边距
    ///
    /// - Parameter value: 左边距的 `CGFloat` 值。
    /// - Returns: 返回修改后的内容对象。
    @discardableResult
    func left(_ value: CGFloat) -> FlexModifiedContent<Content, FlexInsetModifier> {
        modifier(FlexInsetModifier(left: value))
    }

    /// 设置左边距
    ///
    /// - Parameter percent: 左边距的 `FPercent` 值。
    /// - Returns: 返回修改后的内容对象。
    @discardableResult
    func left(_ percent: FPercent) -> FlexModifiedContent<Content, FlexInsetModifier> {
        modifier(FlexInsetModifier(left: percent))
    }

    /// 设置上边距
    ///
    /// - Parameter value: 上边距的 `CGFloat` 值。
    /// - Returns: 返回修改后的内容对象。
    @discardableResult
    func top(_ value: CGFloat) -> FlexModifiedContent<Content, FlexInsetModifier> {
        modifier(FlexInsetModifier(top: value))
    }

    /// 设置上边距
    ///
    /// - Parameter percent: 上边距的 `FPercent` 值。
    /// - Returns: 返回修改后的内容对象。
    @discardableResult
    func top(_ percent: FPercent) -> FlexModifiedContent<Content, FlexInsetModifier> {
        modifier(FlexInsetModifier(top: percent))
    }

    /// 设置右边距
    ///
    /// - Parameter value: 右边距的 `CGFloat` 值。
    /// - Returns: 返回修改后的内容对象。
    @discardableResult
    func right(_ value: CGFloat) -> FlexModifiedContent<Content, FlexInsetModifier> {
        modifier(FlexInsetModifier(right: value))
    }

    /// 设置右边距
    ///
    /// - Parameter percent: 右边距的 `FPercent` 值。
    /// - Returns: 返回修改后的内容对象。
    @discardableResult
    func right(_ percent: FPercent) -> FlexModifiedContent<Content, FlexInsetModifier> {
        modifier(FlexInsetModifier(right: percent))
    }

    /// 设置下边距
    ///
    /// - Parameter value: 下边距的 `CGFloat` 值。
    /// - Returns: 返回修改后的内容对象。
    @discardableResult
    func bottom(_ value: CGFloat) -> FlexModifiedContent<Content, FlexInsetModifier> {
        modifier(FlexInsetModifier(bottom: value))
    }

    /// 设置下边距
    ///
    /// - Parameter percent: 下边距的 `FPercent` 值。
    /// - Returns: 返回修改后的内容对象。
    @discardableResult
    func bottom(_ percent: FPercent) -> FlexModifiedContent<Content, FlexInsetModifier> {
        modifier(FlexInsetModifier(bottom: percent))
    }

    /// 设置开始边距
    ///
    /// - Parameter value: 开始边距的 `CGFloat` 值。
    /// - Returns: 返回修改后的内容对象。
    @discardableResult
    func start(_ value: CGFloat) -> FlexModifiedContent<Content, FlexInsetModifier> {
        modifier(FlexInsetModifier(start: value))
    }

    /// 设置开始边距
    ///
    /// - Parameter percent: 开始边距的 `FPercent` 值。
    /// - Returns: 返回修改后的内容对象。
    @discardableResult
    func start(_ percent: FPercent) -> FlexModifiedContent<Content, FlexInsetModifier> {
        modifier(FlexInsetModifier(start: percent))
    }

    /// 设置结束边距
    ///
    /// - Parameter value: 结束边距的 `CGFloat` 值。
    /// - Returns: 返回修改后的内容对象。
    @discardableResult
    func end(_ value: CGFloat) -> FlexModifiedContent<Content, FlexInsetModifier> {
        modifier(FlexInsetModifier(end: value))
    }

    /// 设置结束边距
    ///
    /// - Parameter percent: 结束边距的 `FPercent` 值。
    /// - Returns: 返回修改后的内容对象。
    @discardableResult
    func end(_ percent: FPercent) -> FlexModifiedContent<Content, FlexInsetModifier> {
        modifier(FlexInsetModifier(end: percent))
    }

    /// 设置水平边距
    ///
    /// - Parameter value: 水平边距的 `CGFloat` 值。
    /// - Returns: 返回修改后的内容对象。
    @discardableResult
    func horizontally(_ value: CGFloat) -> FlexModifiedContent<Content, FlexInsetModifier> {
        modifier(FlexInsetModifier(left: value, right: value))
    }

    /// 设置水平边距
    ///
    /// - Parameter percent: 水平边距的 `FPercent` 值。
    /// - Returns: 返回修改后的内容对象。
    @discardableResult
    func horizontally(_ percent: FPercent) -> FlexModifiedContent<Content, FlexInsetModifier> {
        modifier(FlexInsetModifier(left: percent, right: percent))
    }

    /// 设置垂直边距
    ///
    /// - Parameter value: 垂直边距的 `CGFloat` 值。
    /// - Returns: 返回修改后的内容对象。
    @discardableResult
    func vertically(_ value: CGFloat) -> FlexModifiedContent<Content, FlexInsetModifier> {
        modifier(FlexInsetModifier(top: value, bottom: value))
    }

    /// 设置垂直边距
    ///
    /// - Parameter percent: 垂直边距的 `FPercent` 值。
    /// - Returns: 返回修改后的内容对象。
    @discardableResult
    func vertically(_ percent: FPercent) -> FlexModifiedContent<Content, FlexInsetModifier> {
        modifier(FlexInsetModifier(top: percent, bottom: percent))
    }

    /// 设置所有边距
    ///
    /// - Parameter value: 所有边距的 `CGFloat` 值。
    /// - Returns: 返回修改后的内容对象。
    @discardableResult
    func all(_ value: CGFloat) -> FlexModifiedContent<Content, FlexInsetModifier> {
        modifier(FlexInsetModifier(left: value, top: value, right: value, bottom: value))
    }

    /// 设置所有边距
    ///
    /// - Parameter percent: 所有边距的 `FPercent` 值。
    /// - Returns: 返回修改后的内容对象。
    @discardableResult
    func all(_ percent: FPercent) -> FlexModifiedContent<Content, FlexInsetModifier> {
        modifier(FlexInsetModifier(left: percent, top: percent, right: percent, bottom: percent))
    }
}

public extension FlexModifiedContent where Modifier == FlexInsetModifier {
    /// 设置左边距
    ///
    /// - Parameter value: 左边距的 `CGFloat` 值。
    /// - Returns: 当前内容对象。
    @discardableResult
    func left(_ value: CGFloat) -> Self {
        modifier.leftPointer.value = FlexValue(value)
        return self
    }

    /// 设置左边距
    ///
    /// - Parameter percent: 左边距的 `FPercent` 值。
    /// - Returns: 当前内容对象。
    @discardableResult
    func left(_ percent: FPercent) -> Self {
        modifier.leftPointer.value = FlexValue(percent)
        return self
    }

    /// 设置上边距
    ///
    /// - Parameter value: 上边距的 `CGFloat` 值。
    /// - Returns: 当前内容对象。
    @discardableResult
    func top(_ value: CGFloat) -> Self {
        modifier.topPointer.value = FlexValue(value)
        return self
    }

    /// 设置上边距
    ///
    /// - Parameter percent: 上边距的 `FPercent` 值。
    /// - Returns: 当前内容对象。
    @discardableResult
    func top(_ percent: FPercent) -> Self {
        modifier.topPointer.value = FlexValue(percent)
        return self
    }

    /// 设置右边距
    ///
    /// - Parameter value: 右边距的 `CGFloat` 值。
    /// - Returns: 当前内容对象。
    @discardableResult
    func right(_ value: CGFloat) -> Self {
        modifier.rightPointer.value = FlexValue(value)
        return self
    }

    /// 设置右边距
    ///
    /// - Parameter percent: 右边距的 `FPercent` 值。
    /// - Returns: 当前内容对象。
    @discardableResult
    func right(_ percent: FPercent) -> Self {
        modifier.rightPointer.value = FlexValue(percent)
        return self
    }

    /// 设置下边距
    ///
    /// - Parameter value: 下边距的 `CGFloat` 值。
    /// - Returns: 当前内容对象。
    @discardableResult
    func bottom(_ value: CGFloat) -> Self {
        modifier.bottomPointer.value = FlexValue(value)
        return self
    }

    /// 设置下边距
    ///
    /// - Parameter percent: 下边距的 `FPercent` 值。
    /// - Returns: 当前内容对象。
    @discardableResult
    func bottom(_ percent: FPercent) -> Self {
        modifier.bottomPointer.value = FlexValue(percent)
        return self
    }

    /// 设置开始边距
    ///
    /// - Parameter value: 开始边距的 `CGFloat` 值。
    /// - Returns: 当前内容对象。
    @discardableResult
    func start(_ value: CGFloat) -> Self {
        modifier.startPointer.value = FlexValue(value)
        return self
    }

    /// 设置开始边距
    ///
    /// - Parameter percent: 开始边距的 `FPercent` 值。
    /// - Returns: 当前内容对象。
    @discardableResult
    func start(_ percent: FPercent) -> Self {
        modifier.startPointer.value = FlexValue(percent)
        return self
    }

    /// 设置结束边距
    ///
    /// - Parameter value: 结束边距的 `CGFloat` 值。
    /// - Returns: 当前内容对象。
    @discardableResult
    func end(_ value: CGFloat) -> Self {
        modifier.endPointer.value = FlexValue(value)
        return self
    }

    /// 设置结束边距
    ///
    /// - Parameter percent: 结束边距的 `FPercent` 值。
    /// - Returns: 当前内容对象。
    @discardableResult
    func end(_ percent: FPercent) -> Self {
        modifier.endPointer.value = FlexValue(percent)
        return self
    }

    /// 设置水平边距
    ///
    /// - Parameter value: 水平边距的 `CGFloat` 值。
    /// - Returns: 当前内容对象。
    @discardableResult
    func horizontally(_ value: CGFloat) -> Self {
        return left(value).right(value)
    }

    /// 设置水平边距
    ///
    /// - Parameter percent: 水平边距的 `FPercent` 值。
    /// - Returns: 当前内容对象。
    @discardableResult
    func horizontally(_ percent: FPercent) -> Self {
        return left(percent).right(percent)
    }

    /// 设置垂直边距
    ///
    /// - Parameter value: 垂直边距的 `CGFloat` 值。
    /// - Returns: 当前内容对象。
    @discardableResult
    func vertically(_ value: CGFloat) -> Self {
        return top(value).bottom(value)
    }

    /// 设置垂直边距
    ///
    /// - Parameter percent: 垂直边距的 `FPercent` 值。
    /// - Returns: 当前内容对象。
    @discardableResult
    func vertically(_ percent: FPercent) -> Self {
        return top(percent).bottom(percent)
    }

    /// 设置所有边距
    ///
    /// - Parameter value: 所有边距的 `CGFloat` 值。
    /// - Returns: 当前内容对象。
    @discardableResult
    func all(_ value: CGFloat) -> Self {
        return left(value).top(value).right(value).bottom(value)
    }

    /// 设置所有边距
    ///
    /// - Parameter percent: 所有边距的 `FPercent` 值。
    /// - Returns: 当前内容对象。
    @discardableResult
    func all(_ percent: FPercent) -> Self {
        return left(percent).top(percent).right(percent).bottom(percent)
    }
}
