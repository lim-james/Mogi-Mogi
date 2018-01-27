//
//  EmojiCell.swift
//  Moji Moji
//
//  Created by James on 28/1/18.
//  Copyright © 2018 Front end iOS Developer. All rights reserved.
//

import UIKit

class EmojiCell: UICollectionViewCell {
    
    @IBOutlet weak var emojiButton: CustomButton!
    @IBOutlet weak var countLabel: UILabel!
    
    override func awakeFromNib() {
        emojiButton.backgroundColor = .button
        emojiButton.layer.cornerRadius = 10
        
        emojiButton.addTarget(self, action: #selector(self.emojiAction(_:)), for: .touchUpInside)
        
        countLabel.textColor = .white
    }
    
    @objc func emojiAction(_ sender: AnyObject) {
        UIView.animate(withDuration: 0.25, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseIn, animations: {
            self.emojiButton.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        }, completion: { (Bool) in
            UIView.animate(withDuration: 0.25, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
                self.emojiButton.transform = CGAffineTransform(scaleX: 1, y: 1)
            })
        })
    }
    
}
