//
//  ViewController.swift
//  Moji Moji
//
//  Created by James on 28/1/18.
//  Copyright © 2018 Front end iOS Developer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var mojimoji = [MojiMoji]()
    var emojis: [String: Int] = [:]
    
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var statusTitleLabel: UILabel!
    @IBOutlet weak var statusButton: CustomButton!
    
    @IBOutlet weak var chooseTitleLabel: UILabel!
    @IBOutlet weak var chooseButton: CustomButton!
    
    var currentView = 0
    
    @IBOutlet weak var statusContainer: UIView!
    @IBOutlet weak var chooseContainer: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for m in mojimoji {
            for k in m.emojis.keys {
                emojis[k] = m.emojis[k]
            }
        }
        
        view.backgroundColor = .background
        headerView.backgroundColor = .background
        
        statusTitleLabel.textColor = .white
        statusTitleLabel.text = getStatus()
        
        chooseTitleLabel.textColor = .white
        
        statusButton.backgroundColor = .white
        statusButton.setTitleColor(.background, for: .normal)
        statusButton.layer.cornerRadius = 10
        
        chooseButton.backgroundColor = .white
        chooseButton.setTitleColor(.background, for: .normal)
        chooseButton.layer.cornerRadius = 10
        chooseButton.isHidden = true
    }
    
    func getStatus() -> String {
        if emojis.isEmpty {
            return  "you seem lonely"
        } else {
            var count = 0
            for e in emojis { count += e.value }
            if count >= 10 && count < 100 {
                return "😐👌"
            } else if count == 100 {
                return "💯💯💯"
            } else {
                return "YOU'RE 🔥"
            }
        }
    }
    
    @IBAction func buttonAction(_ sender: Any) {
        switch currentView {
        case 0:
            currentView = 1
            chooseButton.isHidden = false
            UIView.animate(withDuration: 0.5, animations: {
                self.statusTitleLabel.frame.origin.x = -self.view.frame.width
                self.statusContainer.frame.origin.x = -self.view.frame.width
                self.chooseTitleLabel.frame.origin.x = 0
                self.chooseContainer.frame.origin.x = 0
            })
        default:
            currentView = 0
            chooseButton.isHidden = true
            UIView.animate(withDuration: 0.5, animations: {
                self.statusTitleLabel.frame.origin.x = 0
                self.statusContainer.frame.origin.x = 0
                self.chooseTitleLabel.frame.origin.x = self.view.frame.width
                self.chooseContainer.frame.origin.x = self.view.frame.width
            })
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showStatus" {
            let destination = segue.destination as! StatusController
            destination.emojis = emojis
            destination.collectionView?.reloadData()
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
