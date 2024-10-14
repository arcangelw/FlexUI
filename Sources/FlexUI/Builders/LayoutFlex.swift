//
//  LayoutFlex.swift
//  FlexUI
//
//  Created by arcangel on 2024/10/12.
//

/// 定义了 Flex 布局规则的协议。
///
/// 实现此协议的视图或容器需要定义 `layoutDefine` 方法，用于设置布局的具体细节。
public protocol _FlexLayoutDefinable {
    /// 定义布局规则的方法。
    ///
    /// 该方法将在实现该协议的视图中调用，负责设置子视图的布局逻辑。
    @_spi(Internals)
    func layoutDefine()
}

extension FlexModifiedContent: _FlexLayoutDefinable where Content: _FlexLayoutDefinable {
    /// 扩展 `FlexModifiedContent` 以遵守 `_FlexLayoutDefinable` 协议。
    ///
    /// 该方法首先执行 `flex_make()` 来创建布局上下文，然后调用其子视图 `content` 的 `layoutDefine()` 方法来定义具体布局规则。
    @_spi(Internals)
    public func layoutDefine() {
        _ = flex_make()
        content.layoutDefine()
    }
}

/// `LayoutFlex` 结构体用于触发 `FlexUI` 布局 `DSL` 的生效。
///
/// 该结构体作为 FlexUI 布局的锚点，调用传入视图的 `layoutDefine` 方法来初始化并定义布局。
///
/// - Parameters:
///   - Content: 必须实现 `_FlexViewType` 和 `_FlexLayoutDefinable` 协议的视图类型。
/// - Note: 该结构体用于将 Flex 布局规则应用到其包含的子视图上。
public struct LayoutFlex<Content> where Content: _FlexViewType & _FlexLayoutDefinable {
    /// 初始化 `LayoutFlex` 并触发布局定义。
    ///
    /// - Parameter content: 一个返回 `Content` 类型的闭包，`Content` 必须遵循 `_FlexViewType` 和 `_FlexLayoutDefinable` 协议。
    /// - Returns: 返回当前 `LayoutFlex` 实例，用于执行布局定义。
    @discardableResult
    public init(content: () -> Content) {
        content().layoutDefine() // 触发布局定义
    }
}
