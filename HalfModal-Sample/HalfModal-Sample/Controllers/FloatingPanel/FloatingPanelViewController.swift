//
//  FloatingPanelViewController.swift
//  HalfModal-Sample
//
//  Created by Kazunori Aoki on 2021/10/01.
//

import UIKit
import FloatingPanel // 1. Import

// https://github.com/SCENEE/FloatingPanel
final class FloatingPanelViewController: UIViewController {
    
    // MARK: Variables
    lazy var fpc = FloatingPanelController()
    
    
    // MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
        
//        setupChildVC()
        setupFloatingPanel()
        
        print(traitCollection.userInterfaceIdiom == .phone)
    }
}


// MARK: - Setup
private extension FloatingPanelViewController {
    
    func setupChildVC() {
        fpc.contentMode = .fitToBounds
        fpc.delegate = self
        
        let contentVC = ContentViewController()
        fpc.set(contentViewController: contentVC)  // ContentViewをFloatingにset
        fpc.track(scrollView: contentVC.tableView) // ScrollViewの追跡
        fpc.addPanel(toParent: self)               // 追加
    }
    
    func setupFloatingPanel() {
        fpc.delegate = self
        
        let contentVC = ContentViewController()
        fpc.set(contentViewController: contentVC)
        
        // 下にスワイプで削除
        fpc.isRemovalInteractionEnabled = true
        
        present(fpc, animated: true)
    }
}


// MARK: - FloatingPanelControllerDelegate
extension FloatingPanelViewController: FloatingPanelControllerDelegate {
    
}
