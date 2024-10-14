//
//  FrameAspectRatio.swift
//  FlexUI
//
//  Created by arcangelw on 2024/10/8.
//

import FlexLayout
import UIKit

/// 一个用于修改 Flex 布局视图`aspectRatio`宽高比修饰器。
///
/// `FlexAspectRatioModifier` 允许通过 Flex 布局系统设置视图的宽高比。通过实现 `_FlexModifierType`，它可以应用到任何遵循 `FlexView` 的布局视图上。
public struct FlexAspectRatioModifier: _FlexModifierType {
    /// 宽高比的 Flex 值指针。
    var valuePointer: FlexValuePointer

    /// 初始化方法。
    ///
    /// - Parameter value: `CGFloat?` 值，表示视图的宽高比，默认为 `IgnoredFlexCGFloatValue`。
    init(_ value: CGFloat? = IgnoredFlexCGFloatValue) {
        valuePointer = FlexValuePointer(value)
    }

    /// 修改给定的 Flex 布局视图的宽高比属性。
    ///
    /// - Parameter element: 需要被修改的视图，必须遵循 `FlexView` 协议。
    /// - Returns: 修改后的视图，应用了宽高比属性。
    @_spi(Internals)
    public func modify(element: any FlexView) -> any FlexView {
        if case let .point(value) = valuePointer.value {
            element.view.flex.aspectRatio(value)
        }
        return element
    }
}

public extension _FlexViewType where Self: _FlexFrameModifierType {
    /// 为布局视图应用宽高比修饰符。
    ///
    /// 该方法允许设置 Flex 布局的宽高比。
    ///
    /// - Parameter value: `CGFloat?` 值，指定视图的宽高比。
    /// - Returns: 包含应用了宽高比修饰符的视图内容。
    @discardableResult
    func aspectRatio(_ value: CGFloat?) -> FlexModifiedContent<Self, FlexAspectRatioModifier> {
        modifier(FlexAspectRatioModifier(value))
    }

    /// 根据给定的 `UIImageView` 设置宽高比。
    ///
    /// - Parameter imageView: 需要获取宽高比的 `UIImageView`。
    /// - Returns: 包含应用了宽高比修饰符的视图内容。
    @discardableResult
    func aspectRatio(of imageView: UIImageView) -> FlexModifiedContent<Self, FlexAspectRatioModifier> {
        return aspectRatio(imageView.aspectRatio)
    }
}

public extension FlexModifiedContent where Content: _FlexFrameModifierType {
    /// 为已经应用修饰器的视图内容添加宽高比修饰符。
    ///
    /// 允许在链式调用的基础上继续设置 Flex 布局的宽高比。
    ///
    /// - Parameter value: `CGFloat?` 值，指定视图的宽高比。
    /// - Returns: 包含应用了宽高比修饰符的视图内容。
    @discardableResult
    func aspectRatio(_ value: CGFloat?) -> FlexModifiedContent<Content, FlexAspectRatioModifier> {
        modifier(FlexAspectRatioModifier(value))
    }

    /// 根据给定的 `UIImageView` 设置宽高比。
    ///
    /// - Parameter imageView: 需要获取宽高比的 `UIImageView`。
    /// - Returns: 包含应用了宽高比修饰符的视图内容。
    @discardableResult
    func aspectRatio(of imageView: UIImageView) -> FlexModifiedContent<Content, FlexAspectRatioModifier> {
        return aspectRatio(imageView.aspectRatio)
    }
}

public extension FlexModifiedContent where Content: _FlexModifiedContentType, Modifier == FlexAspectRatioModifier {
    /// 设置宽高比。
    ///
    /// - Parameter value: `CGFloat?` 值，指定视图的宽高比。
    /// - Returns: 修改后的内容。
    @discardableResult
    func aspectRatio(_ value: CGFloat?) -> Self {
        modifier.valuePointer.value = FlexValue(value)
        return self
    }

    /// 根据给定的 `UIImageView` 设置宽高比。
    ///
    /// - Parameter imageView: 需要获取宽高比的 `UIImageView`。
    /// - Returns: 修改后的内容。
    @discardableResult
    func aspectRatio(of imageView: UIImageView) -> Self {
        return aspectRatio(imageView.aspectRatio)
    }
}

private extension UIImageView {
    /// 获取 `UIImageView` 的宽高比。
    ///
    /// - Returns: 宽高比值，如果没有图像则返回 `nil`。
    var aspectRatio: CGFloat? {
        guard let imageSize = image?.size else { return nil }
        return imageSize.width / imageSize.height
    }
}
