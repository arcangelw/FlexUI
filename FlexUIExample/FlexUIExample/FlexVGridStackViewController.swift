//
//  FlexVGridStackViewController.swift
//  FlexUIExample
//
//  Created by arcangelw on 2024/10/9.
//

import FlexUI
import UIKit

final class FlexVGridStackViewController: BasicViewController {
    override func setUpFlex() {
        title = "FlexVGridStack"
        LayoutFlex {
            FlexVStack(flexView) {
                FlexScrollStack()
                    .layoutDirection(.vertical)
                    .alwaysBounces(true)
                    .showsScrollIndicator(true)
                    .grow(1).shrink(1)
                    .contentStack { stack in
                        stack
                            .padding(10)
                            .content {
                                FlexVStack(spacing: 20) {
                                    for index in 1 ... 27 {
                                        FlexVGridStack(columnCount: 3, lineSpacing: 10, interitemSpacing: 5, rowHeight: 50) {
                                            for label in createLabels(maxCount: index, title: "Item \(index)-") {
                                                FlexHStack(justifyContent: .center, alignItems: .center) {
                                                    FlexItem(label).backgroundColor(.clear)
                                                }.backgroundColor(.lightRandomColor)
                                            }
                                        }.backgroundColor(.darkRandomColor).padding(10)
                                    }
                                }
                                .padding(10)
                                .backgroundColor(.lightRandomColor)
                            }
                    }
            }
        }
    }
}
