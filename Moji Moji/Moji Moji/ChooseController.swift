//
//  ChooseController.swift
//  Moji Moji
//
//  Created by James on 28/1/18.
//  Copyright © 2018 Front end iOS Developer. All rights reserved.
//

import UIKit

class ChooseController: UICollectionViewController {

    var emojis = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = .background
        collectionView?.contentInset.top = 15
        
        emojis = content(of: "emoji")
    }
    
    func content(of file: String) -> [String] {
        let fileURLProject = Bundle.main.path(forResource: file, ofType: "txt")
        // Read from the file
        var readStringProject = ""
        do {
            readStringProject = try String(contentsOfFile: fileURLProject!, encoding: String.Encoding.utf8)
        } catch let error as NSError {
            print("Failed reading from URL:, Error: " + error.localizedDescription)
        }
        
        var contents = [String]()
        
        for s in readStringProject.split(separator: " ") {
            contents.append(String(s))
        }
        
        return contents
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return emojis.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! ChooseCell
        cell.emojiButton.text = emojis[indexPath.row]
        return cell
    }
    
}

extension ChooseController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewWidth = collectionView.bounds.width
        return CGSize(width: collectionViewWidth/5, height: collectionViewWidth/5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
