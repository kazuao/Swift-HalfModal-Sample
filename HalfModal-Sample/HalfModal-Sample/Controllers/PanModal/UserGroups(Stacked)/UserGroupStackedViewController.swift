//
//  UserGroupStackedViewController.swift
//  HalfModal-Sample
//
//  Created by Kazunori Aoki on 2021/10/01.
//

import UIKit
import PanModal

class UserGroupStackedViewController: UserGroupViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let presentable = members[indexPath.row]
        let viewController = StackedProfileViewController(presentable: presentable)
        
        presentPanModal(viewController)
    }
    
    override var shortFormHeight: PanModalHeight {
        return longFormHeight
    }
}
