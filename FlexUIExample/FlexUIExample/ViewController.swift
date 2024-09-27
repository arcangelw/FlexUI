//
//  ViewController.swift
//  FlexUIExample
//
//  Created by arcangelw on 2024/10/9.
//

import FlexUI
import UIKit

class ViewController: BasicViewController {
    override func setUpFlex() {
        title = "FlexUI"
        FlexRoot(flexView, direction: .column, justifyContent: .start, alignItems: .stretch) {
            FlexScrollStack()
                .layoutDirection(.vertical)
                .alwaysBounces(true)
                .showsScrollIndicator(true)
                .contentStack { stack in
                    stack
                        .padding(10)
                        .backgroundColor(.lightRandomColor)
                        .content {
                            FlexVStack {
                                FlexJoin {
                                    createButton(text: "FlexScrollStack").addTarget(self, action: #selector(tappedToScroll(_:)), for: .touchUpInside)
                                    createButton(text: "FlexVGridStack").addTarget(self, action: #selector(tappedToFlexGridStack(_:)), for: .touchUpInside)
                                    createButton(text: "FlexVStack").addTarget(self, action: #selector(tappedToFlexVStack(_:)), for: .touchUpInside)
                                    createButton(text: "FlexHStack").addTarget(self, action: #selector(tappedToFlexHStack(_:)), for: .touchUpInside)
                                    createButton(text: "FlexZStack").addTarget(self, action: #selector(tappedToFlexZStack(_:)), for: .touchUpInside)
                                    createButton(text: "Texture ZStackLayout").addTarget(self, action: #selector(tappedToTextureZStack(_:)), for: .touchUpInside)
                                    createButton(text: "FlexContainerCell").addTarget(self, action: #selector(tappedToList(_:)), for: .touchUpInside)
                                } separator: {
                                    FlexItem().backgroundColor(.separator).height(5)
                                }
                            }
                            .padding(10)
                            .backgroundColor(.darkRandomColor)
                        }
                }
        }.commit()
    }

    @objc
    private func tappedToList(_: UIControl) {
        let list = FlexContainerCellViewController()
        navigationController?.pushViewController(list, animated: true)
    }

    @objc
    private func tappedToFlexGridStack(_: UIControl) {
        let stack = FlexVGridStackViewController()
        navigationController?.pushViewController(stack, animated: true)
    }

    @objc
    private func tappedToFlexVStack(_: UIControl) {
        let stack = FlexVStackViewController()
        navigationController?.pushViewController(stack, animated: true)
    }

    @objc
    private func tappedToFlexHStack(_: UIControl) {
        let stack = FlexHStackViewController()
        navigationController?.pushViewController(stack, animated: true)
    }

    @objc
    private func tappedToFlexZStack(_: UIControl) {
        let stack = FlexZStackViewController()
        navigationController?.pushViewController(stack, animated: true)
    }

    @objc
    private func tappedToTextureZStack(_: UIControl) {
        let texture = TextureZStackViewController()
        navigationController?.pushViewController(texture, animated: true)
    }

    @objc
    private func tappedToScroll(_: UIControl) {
        let scroll = FlexScrollItemViewController()
        navigationController?.pushViewController(scroll, animated: true)
    }
}
