//
//  _FlexZStackView.swift
//
//
//  Created by arcangelw on 2024/9/27.
//

import FlexLayout
import UIKit

final class _FlexZContentView: _FlexView {
    func calculateSize(_ size: CGSize) -> CGSize {
        isHidden = true
        defer {
            isHidden = false
        }
        frame.size = size
        flex.layout(mode: .fitContainer)
        var contentSize = CGSize.zero
        for subview in subviews {
            let subSize = subview.frame.size
            contentSize.width = max(contentSize.width, subSize.width)
            contentSize.height = max(contentSize.height, subSize.height)
        }
        return contentSize
    }

    override func updateLayout() {
        guard isFlexEnabled, bounds.width > 0, bounds.height > 0 else { return }
        flex.layout(mode: .fitContainer)
    }
}

final class _FlexZStackView: _FlexView {
    private let _contentView = _FlexView()

    let contentView = _FlexZContentView()

    var flexibleMode: FlexibleMode = .flexibleWidth

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(_contentView)
        _contentView.addSubview(contentView)
    }

    override func updateLayout() {
        guard bounds.width > 0, bounds.height > 0 else { return }
        _contentView.frame = bounds
        contentView.frame = _contentView.bounds
    }

    override func sizeThatFits(_ size: CGSize) -> CGSize {
        let fix: (CGFloat) -> CGFloat = { value in
            if value.isNaN || value.isInfinite || value == .greatestFiniteMagnitude {
                return 0
            }
            return value
        }
        var limitSize = CGSize(width: fix(size.width), height: fix(size.height))
        switch flexibleMode {
        case .flexibleWidth:
            limitSize.width = 0
        case .flexibleHeight:
            limitSize.height = 0
        }
        contentView.yoga.direction = yoga.direction
        return contentView.calculateSize(limitSize)
    }
}
