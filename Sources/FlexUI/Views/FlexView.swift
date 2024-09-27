//
//  FlexView.swift
//
//
//  Created by arcangelw on 2024/9/27.
//

import FlexLayout
import UIKit

@usableFromInline
class FlexView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override open func layoutSubviews() {
        super.layoutSubviews()
        updateLayout()
    }

    func updateLayout() {}

    override func sizeThatFits(_ size: CGSize) -> CGSize {
        // https://github.com/facebook/yoga/issues/606
        if isFlexEnabled, isMember(of: FlexView.self), subviews.isEmpty {
            return .zero
        }
        return super.sizeThatFits(size)
    }
}
