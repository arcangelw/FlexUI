//
//  FlexHStackViewController.swift
//  FlexUIExample
//
//  Created by arcangelw on 2024/10/9.
//

import FlexUI
import UIKit

final class FlexHStackViewController: BasicViewController {
    override func setUpFlex() {
        title = "FlexHStack"
        FlexRoot(flexView, direction: .column, justifyContent: .start, alignItems: .stretch) {
            FlexScrollStack()
                .layoutDirection(.vertical)
                .alwaysBounces(true)
                .showsScrollIndicator(true)
                .contentStack { stack in
                    stack
                        .padding(10)
                        .spacing(vertical: 10)
                        .content {
                            for index in 0 ... 2 {
                                FlexScrollStack()
                                    .layoutDirection(.horizontal)
                                    .alwaysBounces(true)
                                    .showsScrollIndicator(true)
                                    .contentStack { stack in
                                        stack
                                            .direction(.row)
                                            .spacing(vertical: 10)
                                            .content {
                                                FlexHStack(spacing: 20) {
                                                    FlexVStack(spacing: 10) {
                                                        createLabels(maxCount: 20, title: "Section \(index) - 1 - VStack Item")
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
                                                    .alignSelf(.end)
                                                }
                                                .backgroundColor(.lightRandomColor)
                                                .border(1.0, .darkRandomColor)
                                                .padding(20)
                                            }
                                    }
                            }
                        }
                }
        }.commit()
    }
}
