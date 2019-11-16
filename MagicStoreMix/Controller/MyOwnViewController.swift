//
//  MyOwnViewController.swift
//  MagicStoreMix
//
//  Created by 黃士軒 on 2019/11/6.
//  Copyright © 2019 Jes Yang. All rights reserved.
//

import UIKit

class MyOwnViewController: UIViewController {
    
    let magicBook = AllMagicBooks.shared
    
    let magicBookList = MagicBookList()
    let userPersist = UserPersist.shared
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        reviseBackButtonNameAndColor()
    }
    
    
    func reviseBackButtonNameAndColor() {
        
        let backButton = UIBarButtonItem()
        backButton.title = "返回"
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        
        self.navigationController?.view.tintColor = UIColor.white
    }
}


extension MyOwnViewController: UICollectionViewDataSource {
    //
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        var numberOfItems: Int!

        if section == 0 {
            numberOfItems = magicBook.level1.count

        } else if section == 1 {
            numberOfItems = magicBook.level2.count

        } else if section == 2 {
            numberOfItems = magicBook.level3.count
        }

        return numberOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let sectionHeader = ["Level One", "Level Two", "Level Three"]
        let reusableView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "sectionHeader", for: indexPath) as! MyOwnCollectionReusableView
        
        reusableView.headerTitle.text = sectionHeader[indexPath.section]
        return reusableView
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyOwnMagicCell", for: indexPath) as! MyOwnCollectionViewCell

        if indexPath.section == 0 {
            cell.magicIcon.image = UIImage(named: magicBook.level1[indexPath.item].name)
//            cell.magicIcon.image = UIImage(named: magicBookList.level1[indexPath.item].name)
//            cell.hideShadowView(magicBookList.level1[indexPath.item].id)

        } else if indexPath.section == 1 {
                cell.magicIcon.image = UIImage(named: magicBook.level2[indexPath.item].name)
//            cell.magicIcon.image = UIImage(named: magicBookList.level2[indexPath.item].name)
//            cell.hideShadowView(magicBookList.level2[indexPath.item].id)

        } else if indexPath.section == 2 {

                cell.magicIcon.image = UIImage(named: magicBook.level3[indexPath.item].name)
//            cell.magicIcon.image = UIImage(named: magicBookList.level3[indexPath.item].name)
//            cell.hideShadowView(magicBookList.level3[indexPath.item].id)
        }
        
        return cell
    }
}


extension MyOwnViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width / 4, height: view.frame.width / 4)
    }
}
