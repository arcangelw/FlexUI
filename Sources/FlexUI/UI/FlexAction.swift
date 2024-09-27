//
//  FlexAction.swift
//  FlexUI
//
//  Created by arcangelw on 2024/10/9.
//

import UIKit

public extension _FlexView where View: UIControl {
    @discardableResult
    func addTarget(_ target: Any?, action: Selector, for controlEvents: UIControl.Event) -> Self {
        view.addTarget(target, action: action, for: controlEvents)
        return self
    }

    @discardableResult
    func removeTarget(_ target: Any?, action: Selector, for controlEvents: UIControl.Event) -> Self {
        view.removeTarget(target, action: action, for: controlEvents)
        return self
    }
}

public extension FlexModifiedContent where Content: _FlexView, Content.View: UIControl {
    @discardableResult
    func addTarget(_ target: Any?, action: Selector, for controlEvents: UIControl.Event) -> Self {
        content.view.addTarget(target, action: action, for: controlEvents)
        return self
    }

    @discardableResult
    func removeTarget(_ target: Any?, action: Selector, for controlEvents: UIControl.Event) -> Self {
        content.view.removeTarget(target, action: action, for: controlEvents)
        return self
    }
}
