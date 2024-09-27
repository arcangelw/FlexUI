//
//  FlexContainerCell.swift
//  FlexUI
//
//  Created by arcangelw on 2024/10/10.
//

import FlexLayout
import UIKit

open class FlexContainerCell: UICollectionViewCell {
    public let flexContentView: UIView = _FlexView()

    public var flexibleMode: FlexibleMode = .flexibleHeight

    override public init(frame: CGRect) {
        super.init(frame: frame)
        setUpContentView()
        setUpFlex()
    }

    @available(*, unavailable)
    public required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setUpContentView() {
        backgroundColor = .clear
        contentView.addSubview(flexContentView)
    }

    open func setUpFlex() {}

    override open func layoutSubviews() {
        super.layoutSubviews()
        updateLayout()
    }

    open func updateLayout() {
        guard bounds.width > 0, bounds.height > 0 else { return }
        flexContentView.frame = contentView.bounds
        flexContentView.flex.layout(mode: .fitContainer)
    }

    override open func sizeThatFits(_ size: CGSize) -> CGSize {
        var limitSize = size
        switch flexibleMode {
        case .flexibleWidth:
            limitSize.width = .nan
        case .flexibleHeight:
            limitSize.height = .nan
        }
        return flexContentView.flex.sizeThatFits(size: limitSize)
    }
}
