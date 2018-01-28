//
//  ViewController.swift
//  Moji Moji
//
//  Created by James on 28/1/18.
//  Copyright © 2018 Front end iOS Developer. All rights reserved.
//

import UIKit

class StatusController: UICollectionViewController {
    
    var emojis: [String: Int] = [:]
    var name = [String]()
    var count = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = .background
        collectionView?.contentInset = UIEdgeInsets(top: 15, left: 15, bottom: 0, right: 15)
        
        for e in emojis {
            name.append(e.key)
            count.append(e.value)
        }
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return emojis.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! EmojiCell
        cell.emojiButton.setTitle(name[indexPath.row], for: .normal)
        cell.countLabel.text = "x\(count[indexPath.row])"
        return cell
    }

}

extension StatusController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewWidth = collectionView.bounds.width
        var cellWidth: CGFloat = 0.0
        if Int(collectionViewWidth) % 3 == 0 {
            cellWidth = (collectionViewWidth - 60)/3
        } else if Int(collectionViewWidth - 1) % 3 == 0 {
            cellWidth = (collectionViewWidth - 61)/3
        } else {
            cellWidth = (collectionViewWidth - 62)/3
        }
        return CGSize(width: cellWidth, height: cellWidth*1.5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

