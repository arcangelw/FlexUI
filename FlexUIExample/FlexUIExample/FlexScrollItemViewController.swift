//
//  FlexScrollItemViewController.swift
//  FlexUIExample
//
//  Created by arcangelw on 2024/10/9.
//

import FlexUI
import UIKit

final class FlexScrollItemViewController: BasicViewController {
    override func setUpFlex() {
        title = "FlexScrollStack"
        FlexRoot(flexView, direction: .column, justifyContent: .start, alignItems: .stretch) {
            FlexScrollStack()
                .layoutDirection(.vertical)
                .alwaysBounces(true)
                .showsScrollIndicator(true)
                .contentStack { stack in
                    stack
                        .padding(10)
                        .content {
                            // Custom
                            FlexItem(createLabel(text: "Custom", font: UIFont.boldSystemFont(ofSize: 20), textColor: .label, backgroundColor: .lightRandomColor))
                            FlexSpacer(minLength: 20)
                            FlexAnyStack()
                                .direction(.column)
                                .justifyContent(.start)
                                .alignItems(.stretch)
                                .backgroundColor(.lightRandomColor)
                                .padding(10)
                                .content {
                                    FlexHStack(spacing: 10, justifyContent: .start, alignItems: .end) {
                                        FlexItem(UIImageView()).size(40).backgroundColor(.darkRandomColor)
                                        FlexItem(createLabel(text: "name1"))
                                    }.alignSelf(.start)
                                    FlexSpacer(minLength: 10)
                                    FlexItem(createLabel(text: (1 ... 5).map { "This is Line\($0)" }.joined(separator: "\n")))
                                    FlexSpacer(minLength: 5)
                                    FlexItem(createLabel(text: Date().formatted())).alignSelf(.end)
                                }
                            FlexSpacer(minLength: 10)
                            FlexAnyStack()
                                .direction(.column)
                                .justifyContent(.start)
                                .alignItems(.stretch)
                                .backgroundColor(.lightRandomColor)
                                .padding(10)
                                .content {
                                    FlexHStack(spacing: 10, justifyContent: .start, alignItems: .end) {
                                        FlexItem(UIImageView()).size(40).backgroundColor(.darkRandomColor)
                                        FlexItem(createLabel(text: "name2"))
                                    }.alignSelf(.start)
                                    FlexSpacer(minLength: 10)
                                    FlexItem(createLabel(text: (1 ... 3).map { "This is Line\($0)" }.joined(separator: "\n")))
                                    FlexSpacer(minLength: 15)
                                    FlexHStack(spacing: 5, justifyContent: .spaceBetween, alignItems: .center) {
                                        FlexHStack(justifyContent: .start, alignItems: .center) {
                                            FlexItem(UIImageView()).backgroundColor(.lightRandomColor).size(18).cornerRadius(9)
                                            FlexSpacer(minLength: 5)
                                            FlexItem(createLabel(text: "Media"))
                                        }
                                        FlexItem(createLabel(text: Date().formatted()))
                                    }
                                }
                            FlexSpacer(minLength: 40)
                            // List
                            FlexItem(createLabel(text: "FlexVStack - FlexJoin", font: UIFont.boldSystemFont(ofSize: 20), textColor: .label, backgroundColor: .lightRandomColor))
                            FlexSpacer(minLength: 20)
                            FlexVStack(justifyContent: .start, alignItems: .stretch) {
                                FlexJoin {
                                    createLabels(maxCount: 20, title: "V-Item")
                                } separator: {
                                    FlexItem().backgroundColor(.systemGreen).height(5)
                                }
                            }.padding(10).backgroundColor(.lightRandomColor)
                            FlexSpacer(minLength: 40)
                            // Horizontal
                            FlexItem(createLabel(text: "Horizontal - FlexHStack", font: UIFont.boldSystemFont(ofSize: 20), textColor: .label, backgroundColor: .lightRandomColor))
                            FlexSpacer(minLength: 20)
                            FlexScrollStack()
                                .layoutDirection(.horizontal)
                                .alwaysBounces(true)
                                .showsScrollIndicator(true)
                                .contentInsetAdjustmentBehavior(.never)
                                .contentStack { item in
                                    item.padding(10)
                                        .backgroundColor(.lightRandomColor)
                                        .content {
                                            FlexHStack(spacing: 10, justifyContent: .start, alignItems: .stretch) {
                                                createLabels(maxCount: 20, title: "H-Item")
                                            }
                                        }
                                }
                            FlexSpacer(minLength: 40)
                            // FlexZStack
                            FlexItem(createLabel(text: "FlexZStack", font: UIFont.boldSystemFont(ofSize: 20), textColor: .label, backgroundColor: .lightRandomColor))
                            FlexSpacer(minLength: 20)
                            FlexHStack(spacing: 20) {
                                FlexZStack {
                                    FlexItem(createLabel(text: "Stack zIndex 1", textColor: .red))
                                        .backgroundColor(.clear).minHeight(200).border(0.5, .red)
                                    FlexItem(createLabel(text: "Stack zIndex 2", textColor: .green))
                                        .backgroundColor(.clear).minHeight(150).border(0.5, .green)
                                    FlexItem(createLabel(text: "Stack zIndex 3", textColor: .blue))
                                        .backgroundColor(.clear).minHeight(100).border(0.5, .blue)
                                    FlexItem(createLabel(text: "Stack zIndex 4 zIndex", textColor: .orange))
                                        .backgroundColor(.clear).minHeight(50).border(0.5, .orange)
                                }.backgroundColor(.white).border(0.5, .purple)
                                FlexZStack {
                                    FlexItem(UIImageView(image: .image(color: .systemBlue, size: .init(width: 60, height: 100))))
                                        .aspectRatio(2)
                                    FlexItem(createLabel(text: "Stack zIndex 1", textColor: .red))
                                        .backgroundColor(.clear).minHeight(200).border(0.5, .red)
                                    FlexItem(createLabel(text: "Stack zIndex 2", textColor: .green))
                                        .backgroundColor(.clear).minHeight(150).border(0.5, .green)
                                    FlexItem(createLabel(text: "Stack zIndex 3", textColor: .blue))
                                        .backgroundColor(.clear).minHeight(100).border(0.5, .blue)
                                    FlexItem(createLabel(text: "Stack zIndex 4 zIndex", textColor: .orange))
                                        .backgroundColor(.clear).minHeight(50).border(0.5, .orange)
                                }.backgroundColor(.white).border(0.5, .purple)
                            }.padding(10).backgroundColor(.lightRandomColor).border(0.5, .purple)
                            FlexSpacer(minLength: 20)
                            FlexVStack(spacing: 20) {
                                FlexZStack {
                                    FlexItem(createLabel(text: "Stack zIndex 1", textColor: .red))
                                        .backgroundColor(.clear).minHeight(200).border(1.0, .red)
                                    FlexItem(createLabel(text: "Stack zIndex 2", textColor: .green))
                                        .backgroundColor(.clear).minHeight(150).border(1.5, .green)
                                    FlexItem(createLabel(text: "Stack zIndex 3", textColor: .blue))
                                        .backgroundColor(.clear).minHeight(100).border(2.0, .blue)
                                    FlexItem(createLabel(text: "Stack zIndex 4 zIndex", textColor: .orange))
                                        .backgroundColor(.clear).minHeight(50).border(2.5, .orange)
                                }.backgroundColor(.white).border(0.5, .purple)
                                FlexZStack {
                                    FlexItem(UIImageView(image: .image(color: .systemBlue, size: .init(width: 60, height: 100))))
                                        .aspectRatio(2)
                                    FlexItem(createLabel(text: "Stack zIndex 1", textColor: .red))
                                        .backgroundColor(.clear).minHeight(200).border(1.0, .red)
                                    FlexItem(createLabel(text: "Stack zIndex 2", textColor: .green))
                                        .backgroundColor(.clear).minHeight(150).border(1.5, .green)
                                    FlexItem(createLabel(text: "Stack zIndex 3", textColor: .blue))
                                        .backgroundColor(.clear).minHeight(100).border(2.0, .blue)
                                    FlexItem(createLabel(text: "Stack zIndex 4 zIndex", textColor: .orange))
                                        .backgroundColor(.clear).minHeight(50).border(2.5, .orange)
                                }.backgroundColor(.white).border(0.5, .purple)
                            }.alignSelf(.center).padding(10).backgroundColor(.lightRandomColor).border(0.5, .purple)
                            FlexSpacer(minLength: 40)
                            // GridItem
                            FlexItem(createLabel(text: "FlexVGridStack - Grid", font: UIFont.boldSystemFont(ofSize: 20), textColor: .label, backgroundColor: .lightRandomColor))
                            FlexSpacer(minLength: 20)
                            FlexVGridStack(columnCount: 3, lineSpacing: 10, interitemSpacing: 5) {
                                createLabels(maxCount: 1, title: "GridItem")
                            }.backgroundColor(.lightRandomColor).padding(10)
                            FlexSpacer(minLength: 40)
                            FlexVGridStack(columnCount: 3, lineSpacing: 10, interitemSpacing: 5) {
                                createLabels(maxCount: 2, title: "GridItem")
                            }.backgroundColor(.lightRandomColor).padding(10)
                            FlexSpacer(minLength: 40)
                            FlexVGridStack(columnCount: 3, lineSpacing: 10, interitemSpacing: 5) {
                                createLabels(maxCount: 3, title: "GridItem")
                            }.backgroundColor(.lightRandomColor).padding(10)
                            FlexSpacer(minLength: 40)
                            FlexVGridStack(columnCount: 3, lineSpacing: 10, interitemSpacing: 5) {
                                createLabels(maxCount: 4, title: "GridItem")
                            }.backgroundColor(.lightRandomColor).padding(10)
                            FlexSpacer(minLength: 40)
                            FlexVGridStack(columnCount: 3, lineSpacing: 10, interitemSpacing: 5) {
                                createLabels(maxCount: 5, title: "GridItem")
                            }.backgroundColor(.lightRandomColor).padding(10)
                            FlexSpacer(minLength: 40)
                            FlexVGridStack(columnCount: 3, lineSpacing: 10, interitemSpacing: 5) {
                                createLabels(maxCount: 6, title: "GridItem")
                            }.backgroundColor(.lightRandomColor).padding(10)
                            FlexSpacer(minLength: 40)
                            FlexVGridStack(columnCount: 3, lineSpacing: 10, interitemSpacing: 5) {
                                createLabels(maxCount: 7, title: "GridItem")
                            }.backgroundColor(.lightRandomColor).padding(10)
                            FlexSpacer(minLength: 40)
                            FlexVGridStack(columnCount: 3, lineSpacing: 10, interitemSpacing: 5) {
                                createLabels(maxCount: 8, title: "GridItem")
                            }.backgroundColor(.lightRandomColor).padding(10)
                            FlexSpacer(minLength: 40)
                            FlexVGridStack(columnCount: 3, lineSpacing: 10, interitemSpacing: 5) {
                                createLabels(maxCount: 9, title: "GridItem")
                            }.backgroundColor(.lightRandomColor).padding(10)
                        }
                }
        }.commit()
    }
}
