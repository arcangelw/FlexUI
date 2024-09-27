//
//  _FlexModifierType.swift
//
//
//  Created by arcangelw on 2024/9/27.
//

#if canImport(FlexLayoutYoga)
    import FlexLayoutYoga
#endif
import FlexLayout

/// 定义修改 Flex 布局的协议。
///
/// `_FlexModifierType` 协议用于修改符合 `FlexView` 的视图，通常与 `FlexModifiedContent` 结构体配合使用，来实现对布局的扩展和修改。
public protocol _FlexModifierType {
    /// 修改给定的 Flex 布局视图。
    ///
    /// - Parameter element: 需要被修改的视图，必须遵循 `FlexView` 协议。
    /// - Returns: 修改后的视图实例，仍然遵循 `FlexView` 协议。
    func modify(element: any FlexView) -> any FlexView
}

/// 代表带有修饰器的 Flex 布局内容。
///
/// `FlexModifiedContent` 结构体用于将修饰器应用到特定的 Flex 布局内容上。修饰器通过实现 `_FlexModifierType` 协议，提供一种修改 Flex 布局的灵活方式。
///
/// - Note: 支持链式调用多个修饰器，允许渐进式地修改视图布局。
public struct FlexModifiedContent<Content: _FlexViewType, Modifier: _FlexModifierType>: _FlexViewType {
    /// 原始的布局内容。
    let content: Content
    /// 应用的修饰器。
    let modifier: Modifier
    /// 前一个修饰器，用于支持链式调用多个修饰器。
    fileprivate let previousModifier: FlexModifier?

    /// 初始化方法。
    ///
    /// - Parameters:
    ///   - content: 原始的布局内容。
    ///   - modifier: 应用的修饰器。
    ///   - previousModifier: 可选的前一个修饰器，用于支持链式调用。
    init(
        content: Content,
        modifier: Modifier,
        previousModifier: FlexModifier? = nil
    ) {
        self.content = content
        self.modifier = modifier
        self.previousModifier = previousModifier
    }

    /// 生成修改后的 Flex 布局视图数组。
    ///
    /// - Returns: 修改后的布局视图数组。
    public func flex_make() -> [any FlexView] {
        content.flex_make().map(modify(element:))
    }

    /// 添加一个新的修饰器，生成新的 `FlexModifiedContent` 实例。
    ///
    /// - Parameter newModifier: 新的修饰器。
    /// - Returns: 新的 `FlexModifiedContent` 实例，包含已应用的修饰器。
    public func modifier<NewModifier: _FlexModifierType>(_ newModifier: NewModifier) -> FlexModifiedContent<Content, NewModifier> {
        .init(content: content, modifier: newModifier, previousModifier: FlexModifier(modify(element:)))
    }

    /// 修改给定的 Flex 布局视图。
    ///
    /// 如果有多个修饰器，会按照链式调用的顺序依次应用每个修饰器。
    ///
    /// - Parameter element: 需要被修改的视图。
    /// - Returns: 修改后的视图。
    private func modify(element: any FlexView) -> any FlexView {
        return modifier.modify(element: previousModifier?.modify(element: element) ?? element)
    }
}

/// 表示修饰器的协议。
///
/// `_FlexModifiedContentType` 协议作为标记协议，标记当前为`FlexModifiedContent`。
/// 该协议本身不定义任何方法或属性，但可以与其他协议结合使用，以提供更多功能。
public protocol _FlexModifiedContentType {}
extension FlexModifiedContent: _FlexModifiedContentType {}

/// 用于定义自定义 Flex 布局修饰器的结构体。
///
/// `FlexModifier` 是一种方便的修饰器实现方式，通过闭包的形式修改 Flex 布局中的视图。
public struct FlexModifier: _FlexModifierType {
    /// 修饰器的闭包，负责修改视图。
    private let _modify: (any FlexView) -> any FlexView

    /// 初始化方法。
    ///
    /// - Parameter modify: 一个闭包，用于修改视图。
    public init(
        _ modify: @escaping (any FlexView) -> any FlexView
    ) {
        _modify = modify
    }

    /// 应用修饰器，修改给定的 Flex 布局视图。
    ///
    /// - Parameter element: 需要被修改的视图。
    /// - Returns: 修改后的视图。
    public func modify(element: any FlexView) -> any FlexView {
        _modify(element)
    }
}

/// `_FlexViewType` 的扩展，提供修饰器相关的方法。
public extension _FlexViewType {
    /// 为布局视图添加修饰器。
    ///
    /// - Parameter modifier: 需要添加的修饰器。
    /// - Returns: 一个新的 `FlexModifiedContent` 实例，包含已应用的修饰器。
    func modifier<Modifier: _FlexModifierType>(_ modifier: Modifier) -> FlexModifiedContent<Self, Modifier> {
        FlexModifiedContent(content: self, modifier: modifier)
    }

    /// 使用闭包修改布局视图。
    ///
    /// - Parameter modify: 一个闭包，用于修改视图。
    /// - Returns: 一个新的 `FlexModifiedContent` 实例，包含已应用的闭包修饰器。
    func modify(_ modify: @escaping (any FlexView) -> Void) -> FlexModifiedContent<Self, FlexModifier> {
        modifier(FlexModifier { element in
            modify(element)
            return element
        })
    }
}
