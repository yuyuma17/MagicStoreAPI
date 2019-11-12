//
//  MyOwnViewController.swift
//  MagicStoreMix
//
//  Created by 黃士軒 on 2019/11/6.
//  Copyright © 2019 Jes Yang. All rights reserved.
//

import UIKit

class MyOwnViewController: UIViewController {
    
    let magicBookList = MagicBookList()
    let userPersist = UserPersist.shared
    
    let magicAPI = "http://vegelephant.club/api/shop/1?password=lacie&name=lacie"
    var magics = [Magic]()
    lazy var level1 = [Magic]()
    lazy var level2 = [Magic]()
    lazy var level3 = [Magic]()
    
    let activityIndicatorView = UIActivityIndicatorView(style: .medium)
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        reviseBackButtonNameAndColor()
        
        if let urlString = magicAPI.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
            let url = URL(string: urlString) {
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let data = data {
                    let decoder = JSONDecoder()
                    
                    if let magicResults = try? decoder.decode([Magic].self, from: data) {
                        self.magics = magicResults
                        
                        DispatchQueue.main.async {
                            self.level1 = self.magics.filter {($0.level == 1)}
                            self.level2 = self.magics.filter {($0.level == 2)}
                            self.level3 = self.magics.filter {($0.level == 3)}
                            self.collectionView.reloadData()
                        }
                        
                    } else {
                        print("error")
                    }
                } else {
                    print("data not found")
                }
            }
            task.resume()
        } else {
            print("URL trans fail")
        }
    }
    
    
    func reviseBackButtonNameAndColor() {
        
        let backButton = UIBarButtonItem()
        backButton.title = "返回"
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        
        self.navigationController?.view.tintColor = UIColor.white
    }
}


extension MyOwnViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if indexPath.section == 0 {
            if userPersist.user.getPurchased(book: magicBookList.level1[indexPath.item]) {
                
                if let sellVC = storyboard?.instantiateViewController(withIdentifier: "sellVC") as? SellViewController {
                    sellVC.image = UIImage(named: magicBookList.level1[indexPath.item].name)
                    sellVC.price = magicBookList.level1[indexPath.item].price
                    sellVC.magicBook = magicBookList.level1[indexPath.item]
                    sellVC.vc = self
                    present(sellVC, animated: false)
                }
            }
        }
        else if indexPath.section == 1 {
            if userPersist.user.getPurchased(book: magicBookList.level2[indexPath.item]) {
                
                if let sellVC = storyboard?.instantiateViewController(withIdentifier: "sellVC") as? SellViewController {
                    sellVC.image = UIImage(named: magicBookList.level2[indexPath.item].name)
                    sellVC.price = magicBookList.level2[indexPath.item].price
                    sellVC.magicBook = magicBookList.level2[indexPath.item]
                    sellVC.vc = self
                    present(sellVC, animated: false)
                }
            }
        }
        else if indexPath.section == 2 {
            if userPersist.user.getPurchased(book: magicBookList.level3[indexPath.item]) {
                
                if let sellVC = storyboard?.instantiateViewController(withIdentifier: "sellVC") as? SellViewController {
                    sellVC.image = UIImage(named: magicBookList.level3[indexPath.item].name)
                    sellVC.price = magicBookList.level3[indexPath.item].price
                    sellVC.magicBook = magicBookList.level3[indexPath.item]
                    sellVC.vc = self
                    present(sellVC, animated: false)
                }
            }
        }
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
            numberOfItems = level1.count

        } else if section == 1 {
            numberOfItems = level2.count

        } else if section == 2 {
            numberOfItems = level3.count
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
            cell.magicIcon.image = UIImage(named: level1[indexPath.item].name)
//            cell.magicIcon.image = UIImage(named: magicBookList.level1[indexPath.item].name)
//            cell.hideShadowView(magicBookList.level1[indexPath.item].id)

        } else if indexPath.section == 1 {
                cell.magicIcon.image = UIImage(named: level2[indexPath.item].name)
//            cell.magicIcon.image = UIImage(named: magicBookList.level2[indexPath.item].name)
//            cell.hideShadowView(magicBookList.level2[indexPath.item].id)

        } else if indexPath.section == 2 {

                cell.magicIcon.image = UIImage(named: level3[indexPath.item].name)
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
