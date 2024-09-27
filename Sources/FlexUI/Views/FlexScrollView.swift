//
//  FlexScrollView.swift
//  FlexUI
//
//  Created by arcangelw on 2024/10/9.
//

import FlexLayout
import UIKit

final class FlexScrollContentView: FlexView {}

final class FlexScrollView: UIScrollView {
    let contentView = FlexScrollContentView()

    var layoutDirection: FlexScrollStack.LayoutDirection = .vertical {
        didSet {
            guard oldValue != layoutDirection else { return }
            updateState()
        }
    }

    var alwaysBounces: Bool = true {
        didSet {
            guard oldValue != alwaysBounces else { return }
            updateState()
        }
    }

    var showsScrollIndicator: Bool = true {
        didSet {
            guard oldValue != showsScrollIndicator else { return }
            updateState()
        }
    }

    override var bounces: Bool {
        didSet {
            guard oldValue != bounces else { return }
            updateState()
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        flex.direction(.column)
            .justifyContent(.start)
            .alignItems(.stretch)
            .define { flex in
                flex.addItem(contentView).position(.static)
            }
        updateState()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        guard bounds.width > 0, bounds.height > 0 else { return }
        contentView.frame.origin = .zero

        switch layoutDirection {
        case .horizontal:
            contentView.frame.size.height = bounds.height
            contentView.flex.layout(mode: .adjustWidth)
        case .vertical:
            contentView.frame.size.width = bounds.width
            contentView.flex.layout(mode: .adjustHeight)
        }
        contentSize = contentView.frame.size
    }

    override var intrinsicContentSize: CGSize {
        return sizeThatFits(CGSize(width: CGFloat.nan, height: CGFloat.nan))
    }

    override func sizeThatFits(_ size: CGSize) -> CGSize {
        // 计算并返回适合的尺寸。
        var limitSize = size
        switch layoutDirection {
        case .horizontal:
            limitSize.width = .nan
        case .vertical:
            limitSize.height = .nan
        }
        return contentView.flex.sizeThatFits(size: limitSize)
    }

    private func updateState() {
        switch layoutDirection {
        case .horizontal:
            alwaysBounceVertical = false
            alwaysBounceHorizontal = alwaysBounces && bounces
            showsVerticalScrollIndicator = false
            showsHorizontalScrollIndicator = showsScrollIndicator
        case .vertical:
            alwaysBounceVertical = alwaysBounces && bounces
            alwaysBounceHorizontal = false
            showsVerticalScrollIndicator = showsScrollIndicator
            showsHorizontalScrollIndicator = false
        }
    }
}
