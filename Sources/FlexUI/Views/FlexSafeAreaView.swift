//
//  FlexSafeAreaView.swift
//  FlexUI
//
//  Created by arcangelw on 2024/10/9.
//

import FlexLayout
import UIKit

final class FlexSafeAreaView: UIView {
    let contentView: UIView = FlexView()
    var automaticallyRelayoutOnSafeAreaChanges = true

    override public init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        flex.direction(.column)
            .justifyContent(.start)
            .alignItems(.stretch)
            .define { flex in
                flex.addItem(contentView).grow(1).shrink(1)
            }
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override public func layoutSubviews() {
        super.layoutSubviews()
        flex.layout(mode: .fitContainer)
    }

    override public func safeAreaInsetsDidChange() {
        super.safeAreaInsetsDidChange()
        if automaticallyRelayoutOnSafeAreaChanges {
            flex.padding(safeAreaInsets).layout(mode: .fitContainer)
        }
    }
}
