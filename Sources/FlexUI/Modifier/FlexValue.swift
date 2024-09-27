//
//  FlexValue.swift
//  FlexUI
//
//  Created by arcangelw on 2024/10/8.
//

import FlexLayout
import Foundation

/// 用于 Flex 布局中忽略 `CGFloat` 设置的特殊值。
///
/// `IgnoredFlexCGFloatValue` 被赋值为 `.infinity`，表示在某些情况下需要忽略具体的 `CGFloat` 值，通常用于可选的布局设置。
/// 当 `FlexUI` 内部检测到该值时，会跳过对该属性的处理。
///
/// - Note: 用作明确忽略 `CGFloat` 设置的标记。
public let IgnoredFlexCGFloatValue: CGFloat = .infinity

/// 表示 Flex 布局中的值类型，支持忽略、点值和百分比。
///
/// `FlexValue` 枚举表示不同类型的布局值，可以是被忽略的值、具体的点值或百分比形式的值。
/// - `ignored`: 表示布局系统应忽略该值。
/// - `point`: 表示具体的 `CGFloat` 点值，用于定义布局中的尺寸或间距。
/// - `percent`: 表示相对于父视图百分比的值，用 `FPercent` 表示。
enum FlexValue {
    // 忽略该布局值的情况
    case ignored
    // 使用具体的浮点数值
    case point(_ value: CGFloat?)
    // 使用百分比值
    case percent(_ percent: FPercent)

    /// 根据给定的 `CGFloat?` 值初始化 `FlexValue`。
    ///
    /// 如果传入的值为 `IgnoredFlexCGFloatValue`，则表示忽略该值，否则将其作为 `point` 值处理。
    ///
    /// - Parameter value: 可选的 `CGFloat` 值。
    init(_ value: CGFloat?) {
        if value == IgnoredFlexCGFloatValue {
            self = .ignored
        } else {
            self = .point(value)
        }
    }

    /// 根据给定的 `FPercent?` 值初始化 `FlexValue`。
    ///
    /// 如果传入 `FPercent` 值，则将其作为 `percent` 处理；如果为空，则表示忽略该值。
    ///
    /// - Parameter percent: 可选的 `FPercent` 百分比值。
    init(_ percent: FPercent?) {
        if let percent {
            self = .percent(percent)
        } else {
            self = .ignored
        }
    }
}

/// 表示 `FlexValue` 的指针类型，用于处理不安全的内存操作。
typealias FlexValuePointer = UnsafeMutablePointer<FlexValue>

/// 对 `UnsafeMutablePointer` 的扩展，添加便捷的 `value` 属性来获取和设置指针指向的值。
extension UnsafeMutablePointer {
    /// 获取和设置指针所指向的值。
    var value: Pointee {
        get {
            return pointee
        }
        nonmutating set {
            pointee = newValue
        }
    }

    /// 通过给定值初始化 `UnsafeMutablePointer`。
    ///
    /// - Parameter value: 初始化指针的值。
    init(value: Pointee) {
        self = .allocate(capacity: 1)
        initialize(to: value)
    }
}

extension UnsafeMutablePointer where Pointee == FlexValue {
    /// 通过 `CGFloat?` 值初始化 `FlexValue` 指针。
    ///
    /// - Parameter floatValue: 可选的 `CGFloat` 值，转换为 `FlexValue`。
    init(_ floatValue: CGFloat?) {
        self.init(value: FlexValue(floatValue))
    }

    /// 通过 `FPercent?` 值初始化 `FlexValue` 指针。
    ///
    /// - Parameter percentValue: 可选的 `FPercent` 值，转换为 `FlexValue`。
    init(_ percentValue: FPercent?) {
        self.init(value: FlexValue(percentValue))
    }
}

extension FlexValuePointer {
    /// 绑定 Flex 布局中的值，根据 `FlexValue` 类型调用对应的布局设置方法。
    ///
    /// 此方法根据 `FlexValue` 的不同类型，将数值传递给 `setPoint` 或 `setPercent` 方法以应用对应的布局设置。
    /// 如果 `FlexValue` 为 `.point` 类型，则调用 `setPoint` 方法；
    /// 如果为 `.percent` 类型，则调用 `setPercent` 方法。
    ///
    /// - Parameters:
    ///   - setPoint: 当 `FlexValue` 为 `.point` 类型时，设置具体的 `CGFloat` 值的闭包。
    ///   - setPercent: 当 `FlexValue` 为 `.percent` 类型时，设置百分比的闭包，默认为 `nil`。
    func bindValue(_ setPoint: (CGFloat) -> Flex, _ setPercent: ((FPercent) -> FlexLayout.Flex)?) {
        switch value {
        case let .point(value):
            _ = setPoint(value!) // 绑定并应用 CGFloat 值
        case let .percent(value):
            _ = setPercent?(value) // 绑定并应用百分比值
        default: ()
        }
    }

    /// 绑定 Flex 布局中的值，仅当 `FlexValue` 不为 `nil` 时应用布局设置。
    ///
    /// 此方法与 `bindValue` 类似，但它额外检查 `.point` 类型中的值是否为 `nil`。如果值不为 `nil`，则会调用 `setPoint` 方法。
    ///
    /// - Parameters:
    ///   - setPoint: 当 `FlexValue` 为 `.point` 且值不为 `nil` 时，设置具体的 `CGFloat` 值的闭包。
    ///   - setPercent: 当 `FlexValue` 为 `.percent` 类型时，设置百分比的闭包，默认为 `nil`。
    func bindNoOptionalValue(_ setPoint: (CGFloat) -> Flex, _ setPercent: ((FPercent) -> FlexLayout.Flex)?) {
        switch value {
        case let .point(value) where value != nil:
            _ = setPoint(value!) // 仅当值不为 nil 时绑定并应用 CGFloat 值
        case let .percent(value):
            _ = setPercent?(value) // 绑定并应用百分比值
        default: ()
        }
    }
}
