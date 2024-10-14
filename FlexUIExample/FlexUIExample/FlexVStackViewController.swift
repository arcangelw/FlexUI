//
//  FlexVStackViewController.swift
//  FlexUIExample
//
//  Created by arcangelw on 2024/10/9.
//

import FlexUI
import UIKit

final class FlexVStackViewController: BasicViewController {
    override func setUpFlex() {
        title = "FlexVStack"
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
                            .spacing(vertical: 10)
                            .content {
                                for index in 0 ... 2 {
                                    FlexVStack {
                                        FlexVStack(spacing: 10) {
                                            createLabels(maxCount: 10, title: "Section \(index) - 1 - VStack Item")
                                        }
                                        .backgroundColor(.lightRandomColor)
                                        .border(1, .darkRandomColor)
                                        .padding(10)
                                        FlexVStack {
                                            FlexJoin {
                                                createLabels(maxCount: 10, title: "Section \(index) - 2 - VStack Item")
                                            } separator: {
                                                FlexItem().backgroundColor(.red).height(5)
                                            }
                                        }
                                        .backgroundColor(.lightRandomColor)
                                        .border(1, .darkRandomColor)
                                        .padding(10)
                                        .margin(20)
                                        .alignSelf(.start)
                                        FlexVStack(spacing: 10) {
                                            createLabels(maxCount: 10, title: "Section \(index) - 3 - VStack Item")
                                        }
                                        .backgroundColor(.lightRandomColor)
                                        .border(1, .darkRandomColor)
                                        .padding(10)
                                        .alignSelf(.center)
                                        FlexVStack {
                                            FlexJoin {
                                                createLabels(maxCount: 10, title: "Section \(index) - 4 - VStack Item")
                                            } separator: {
                                                FlexItem().backgroundColor(.red).height(5)
                                            }
                                        }
                                        .backgroundColor(.lightRandomColor)
                                        .border(1, .darkRandomColor)
                                        .padding(10)
                                        .margin(20)
                                        .alignSelf(.end)
                                    }
                                    .backgroundColor(.darkRandomColor)
                                }
                            }
                    }
            }
        }
    }
}
