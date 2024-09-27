//
//  PositionMargins.swift
//  FlexUI
//
//  Created by arcangelw on 2024/10/8.
//

import FlexLayout

/// 用于设置 Flex 布局的边距修饰符。
public struct FlexMarginModifier: _FlexModifierType {
    // 左边距的值指针
    var marginLeftPointer: FlexValuePointer
    // 上边距的值指针
    var marginTopPointer: FlexValuePointer
    // 右边距的值指针
    var marginRightPointer: FlexValuePointer
    // 下边距的值指针
    var marginBottomPointer: FlexValuePointer
    // 开始边距的值指针
    var marginStartPointer: FlexValuePointer
    // 结束边距的值指针
    var marginEndPointer: FlexValuePointer
    // 水平边距的值指针
    var marginHorizontalPointer: FlexValuePointer
    // 垂直边距的值指针
    var marginVerticalPointer: FlexValuePointer
    // 所有边距的值指针
    var marginPointer: FlexValuePointer

    /// 初始化 `FlexMarginModifier` 结构体，支持通过 `CGFloat?` 设置边距值。
    ///
    /// - Parameters:
    ///   - marginLeft: 左边距的 `CGFloat?` 值，默认为 `IgnoredFlexCGFloatValue`。
    ///   - marginTop: 上边距的 `CGFloat?` 值，默认为 `IgnoredFlexCGFloatValue`。
    ///   - marginRight: 右边距的 `CGFloat?` 值，默认为 `IgnoredFlexCGFloatValue`。
    ///   - marginBottom: 下边距的 `CGFloat?` 值，默认为 `IgnoredFlexCGFloatValue`。
    ///   - marginStart: 开始边距的 `CGFloat?` 值，默认为 `IgnoredFlexCGFloatValue`。
    ///   - marginEnd: 结束边距的 `CGFloat?` 值，默认为 `IgnoredFlexCGFloatValue`。
    ///   - marginHorizontal: 水平边距的 `CGFloat?` 值，默认为 `IgnoredFlexCGFloatValue`。
    ///   - marginVertical: 垂直边距的 `CGFloat?` 值，默认为 `IgnoredFlexCGFloatValue`。
    ///   - margin: 所有边距的 `CGFloat?` 值，默认为 `IgnoredFlexCGFloatValue`。
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

    /// 初始化 `FlexMarginModifier` 结构体，支持通过 `FPercent?` 设置边距值。
    ///
    /// - Parameters:
    ///   - marginLeft: 左边距的 `FPercent?` 值，默认为 `nil`。
    ///   - marginTop: 上边距的 `FPercent?` 值，默认为 `nil`。
    ///   - marginRight: 右边距的 `FPercent?` 值，默认为 `nil`。
    ///   - marginBottom: 下边距的 `FPercent?` 值，默认为 `nil`。
    ///   - marginStart: 开始边距的 `FPercent?` 值，默认为 `nil`。
    ///   - marginEnd: 结束边距的 `FPercent?` 值，默认为 `nil`。
    ///   - marginHorizontal: 水平边距的 `FPercent?` 值，默认为 `nil`。
    ///   - marginVertical: 垂直边距的 `FPercent?` 值，默认为 `nil`。
    ///   - margin: 所有边距的 `FPercent?` 值，默认为 `nil`。
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

    /// 应用边距修饰符到给定的元素上。
    ///
    /// - Parameter element: 需要应用修饰符的元素，遵循 `_FlexView` 和 `_FlexDefinable` 协议。
    /// - Returns: 返回修改后的元素。
    public func modify(element: any _FlexView & _FlexDefinable) -> any _FlexView & _FlexDefinable {
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
    /// 设置左侧边距
    /// - Parameter value: 左侧边距的值，单位为点。
    /// - Returns: 修改后的内容，应用了左侧边距的修改器。
    @discardableResult
    func marginLeft(_ value: CGFloat) -> FlexModifiedContent<Self, FlexMarginModifier> {
        modifier(FlexMarginModifier(marginLeft: value))
    }

    /// 设置左侧边距
    /// - Parameter percent: 左侧边距的百分比值。
    /// - Returns: 修改后的内容，应用了左侧边距的修改器。
    @discardableResult
    func marginLeft(_ percent: FPercent) -> FlexModifiedContent<Self, FlexMarginModifier> {
        modifier(FlexMarginModifier(marginLeft: percent))
    }

    /// 设置上侧边距
    /// - Parameter value: 上侧边距的值，单位为点。
    /// - Returns: 修改后的内容，应用了上侧边距的修改器。
    @discardableResult
    func marginTop(_ value: CGFloat) -> FlexModifiedContent<Self, FlexMarginModifier> {
        modifier(FlexMarginModifier(marginTop: value))
    }

    /// 设置上侧边距
    /// - Parameter percent: 上侧边距的百分比值。
    /// - Returns: 修改后的内容，应用了上侧边距的修改器。
    @discardableResult
    func marginTop(_ percent: FPercent) -> FlexModifiedContent<Self, FlexMarginModifier> {
        modifier(FlexMarginModifier(marginTop: percent))
    }

    /// 设置右侧边距
    /// - Parameter value: 右侧边距的值，单位为点。
    /// - Returns: 修改后的内容，应用了右侧边距的修改器。
    @discardableResult
    func marginRight(_ value: CGFloat) -> FlexModifiedContent<Self, FlexMarginModifier> {
        modifier(FlexMarginModifier(marginRight: value))
    }

    /// 设置右侧边距
    /// - Parameter percent: 右侧边距的百分比值。
    /// - Returns: 修改后的内容，应用了右侧边距的修改器。
    @discardableResult
    func marginRight(_ percent: FPercent) -> FlexModifiedContent<Self, FlexMarginModifier> {
        modifier(FlexMarginModifier(marginRight: percent))
    }

    /// 设置下侧边距
    /// - Parameter value: 下侧边距的值，单位为点。
    /// - Returns: 修改后的内容，应用了下侧边距的修改器。
    @discardableResult
    func marginBottom(_ value: CGFloat) -> FlexModifiedContent<Self, FlexMarginModifier> {
        modifier(FlexMarginModifier(marginBottom: value))
    }

    /// 设置下侧边距
    /// - Parameter percent: 下侧边距的百分比值。
    /// - Returns: 修改后的内容，应用了下侧边距的修改器。
    @discardableResult
    func marginBottom(_ percent: FPercent) -> FlexModifiedContent<Self, FlexMarginModifier> {
        modifier(FlexMarginModifier(marginBottom: percent))
    }

    /// 设置起始边距
    /// - Parameter value: 起始边距的值，单位为点。
    /// - Returns: 修改后的内容，应用了起始边距的修改器。
    @discardableResult
    func marginStart(_ value: CGFloat) -> FlexModifiedContent<Self, FlexMarginModifier> {
        modifier(FlexMarginModifier(marginStart: value))
    }

    /// 设置起始边距
    /// - Parameter percent: 起始边距的百分比值。
    /// - Returns: 修改后的内容，应用了起始边距的修改器。
    @discardableResult
    func marginStart(_ percent: FPercent) -> FlexModifiedContent<Self, FlexMarginModifier> {
        modifier(FlexMarginModifier(marginStart: percent))
    }

    /// 设置结束边距
    /// - Parameter value: 结束边距的值，单位为点。
    /// - Returns: 修改后的内容，应用了结束边距的修改器。
    @discardableResult
    func marginEnd(_ value: CGFloat) -> FlexModifiedContent<Self, FlexMarginModifier> {
        modifier(FlexMarginModifier(marginEnd: value))
    }

    /// 设置结束边距
    /// - Parameter percent: 结束边距的百分比值。
    /// - Returns: 修改后的内容，应用了结束边距的修改器。
    @discardableResult
    func marginEnd(_ percent: FPercent) -> FlexModifiedContent<Self, FlexMarginModifier> {
        modifier(FlexMarginModifier(marginEnd: percent))
    }

    /// 设置水平边距
    /// - Parameter value: 水平边距的值，单位为点。
    /// - Returns: 修改后的内容，应用了水平边距的修改器。
    @discardableResult
    func marginHorizontal(_ value: CGFloat) -> FlexModifiedContent<Self, FlexMarginModifier> {
        modifier(FlexMarginModifier(marginHorizontal: value))
    }

    /// 设置水平边距
    /// - Parameter percent: 水平边距的百分比值。
    /// - Returns: 修改后的内容，应用了水平边距的修改器。
    @discardableResult
    func marginHorizontal(_ percent: FPercent) -> FlexModifiedContent<Self, FlexMarginModifier> {
        modifier(FlexMarginModifier(marginHorizontal: percent))
    }

    /// 设置垂直边距
    /// - Parameter value: 垂直边距的值，单位为点。
    /// - Returns: 修改后的内容，应用了垂直边距的修改器。
    @discardableResult
    func marginVertical(_ value: CGFloat) -> FlexModifiedContent<Self, FlexMarginModifier> {
        modifier(FlexMarginModifier(marginVertical: value))
    }

    /// 设置垂直边距
    /// - Parameter percent: 垂直边距的百分比值。
    /// - Returns: 修改后的内容，应用了垂直边距的修改器。
    @discardableResult
    func marginVertical(_ percent: FPercent) -> FlexModifiedContent<Self, FlexMarginModifier> {
        modifier(FlexMarginModifier(marginVertical: percent))
    }

    /// 设置边距
    /// - Parameter insets: 使用 `UIEdgeInsets` 来定义四个方向的边距。
    /// - Returns: 修改后的内容，应用了边距的修改器。
    @discardableResult
    func margin(_ insets: UIEdgeInsets) -> FlexModifiedContent<Self, FlexMarginModifier> {
        modifier(FlexMarginModifier(marginLeft: insets.left, marginTop: insets.top, marginRight: insets.right, marginBottom: insets.bottom))
    }

    /// 设置方向性边距
    /// - Parameter directionalInsets: 使用 `NSDirectionalEdgeInsets` 来定义四个方向的边距。
    /// - Returns: 修改后的内容，应用了方向性边距的修改器。
    @discardableResult
    func margin(_ directionalInsets: NSDirectionalEdgeInsets) -> FlexModifiedContent<Self, FlexMarginModifier> {
        modifier(FlexMarginModifier(marginTop: directionalInsets.top, marginBottom: directionalInsets.bottom, marginStart: directionalInsets.leading, marginEnd: directionalInsets.trailing))
    }

    /// 设置统一边距
    /// - Parameter value: 边距的值，单位为点。
    /// - Returns: 修改后的内容，应用了统一边距的修改器。
    @discardableResult
    func margin(_ value: CGFloat) -> FlexModifiedContent<Self, FlexMarginModifier> {
        modifier(FlexMarginModifier(margin: value))
    }

    /// 设置统一边距
    /// - Parameter percent: 边距的百分比值。
    /// - Returns: 修改后的内容，应用了统一边距的修改器。
    @discardableResult
    func margin(_ percent: FPercent) -> FlexModifiedContent<Self, FlexMarginModifier> {
        modifier(FlexMarginModifier(margin: percent))
    }

    /// 设置垂直和水平边距
    /// - Parameters:
    ///   - vertical: 垂直方向的边距值，单位为点。
    ///   - horizontal: 水平方向的边距值，单位为点。
    /// - Returns: 修改后的内容，应用了垂直和水平边距的修改器。
    @discardableResult
    func margin(_ vertical: CGFloat, _ horizontal: CGFloat) -> FlexModifiedContent<Self, FlexMarginModifier> {
        modifier(FlexMarginModifier(marginHorizontal: horizontal, marginVertical: vertical))
    }

    /// 设置垂直和水平边距
    /// - Parameters:
    ///   - vertical: 垂直方向的百分比边距值。
    ///   - horizontal: 水平方向的百分比边距值。
    /// - Returns: 修改后的内容，应用了垂直和水平边距的修改器。
    @discardableResult
    func margin(_ vertical: FPercent, _ horizontal: FPercent) -> FlexModifiedContent<Self, FlexMarginModifier> {
        modifier(FlexMarginModifier(marginHorizontal: horizontal, marginVertical: vertical))
    }

    /// 设置上下边距和水平边距
    /// - Parameters:
    ///   - top: 上方的边距值，单位为点。
    ///   - horizontal: 水平方向的边距值，单位为点。
    ///   - bottom: 下方的边距值，单位为点。
    /// - Returns: 修改后的内容，应用了上下边距和水平边距的修改器。
    @discardableResult
    func margin(_ top: CGFloat, _ horizontal: CGFloat, _ bottom: CGFloat) -> FlexModifiedContent<Self, FlexMarginModifier> {
        modifier(FlexMarginModifier(marginTop: top, marginBottom: bottom, marginHorizontal: horizontal))
    }

    /// 设置上下边距和水平边距
    /// - Parameters:
    ///   - top: 上方的百分比边距值。
    ///   - horizontal: 水平方向的百分比边距值。
    ///   - bottom: 下方的百分比边距值。
    /// - Returns: 修改后的内容，应用了上下边距和水平边距的修改器。
    @discardableResult
    func margin(_ top: FPercent, _ horizontal: FPercent, _ bottom: FPercent) -> FlexModifiedContent<Self, FlexMarginModifier> {
        modifier(FlexMarginModifier(marginTop: top, marginBottom: bottom, marginHorizontal: horizontal))
    }

    /// 设置四个方向的边距
    /// - Parameters:
    ///   - top: 上方的边距值，单位为点。
    ///   - left: 左侧的边距值，单位为点。
    ///   - bottom: 下方的边距值，单位为点。
    ///   - right: 右侧的边距值，单位为点。
    /// - Returns: 修改后的内容，应用了四个方向的边距修改器。
    @discardableResult
    func margin(_ top: CGFloat, _ left: CGFloat, _ bottom: CGFloat, _ right: CGFloat) -> FlexModifiedContent<Self, FlexMarginModifier> {
        modifier(FlexMarginModifier(marginLeft: left, marginTop: top, marginRight: right, marginBottom: bottom))
    }

    /// 设置四个方向的边距
    /// - Parameters:
    ///   - top: 上方的百分比边距值。
    ///   - left: 左侧的百分比边距值。
    ///   - bottom: 下方的百分比边距值。
    ///   - right: 右侧的百分比边距值。
    /// - Returns: 修改后的内容，应用了四个方向的边距修改器。
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

public extension FlexModifiedContent where Modifier == FlexMarginModifier {
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
