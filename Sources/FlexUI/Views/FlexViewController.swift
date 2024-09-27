//
//  FlexViewController.swift
//  FlexUI
//
//  Created by arcangelw on 2024/10/9.
//

import UIKit

open class FlexViewController: UIViewController {
    private let safeAreaFlexView = _FlexSafeAreaView()

    public var flexView: UIView {
        return safeAreaFlexView.contentView
    }

    public var automaticallyRelayoutOnSafeAreaChanges: Bool {
        get {
            safeAreaFlexView.automaticallyRelayoutOnSafeAreaChanges
        }
        set {
            safeAreaFlexView.automaticallyRelayoutOnSafeAreaChanges = newValue
        }
    }

    override open func loadView() {
        view = safeAreaFlexView
    }

    override open func viewDidLoad() {
        super.viewDidLoad()
        setUpFlex()
    }

    open func setUpFlex() {}
}
