//
//  ViewController.swift
//  collectionViewCardAnimation
//
//  Created by Gerges on 10/26/20.
//

import UIKit
import AnimatedCollectionViewLayout

class ViewController: UIViewController {
    
    
    @IBOutlet weak var cardCV: UICollectionView!
    
    let imageArray = ["cat","rabbit","camera","sky"]
    lazy var direction: UICollectionView.ScrollDirection = .horizontal
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set up collectionview animation
        let layout = AnimatedCollectionViewLayout()
        layout.animator = LinearCardAttributesAnimator()
        layout.scrollDirection = direction
        cardCV.collectionViewLayout = layout
        
        cardCV.delegate = self
        cardCV.dataSource = self
        
    }


}


extension ViewController: UICollectionViewDelegate , UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : CardsCollectionViewCell = cardCV.dequeueReusableCell(withReuseIdentifier: "CardsCollectionViewCell", for: indexPath) as! CardsCollectionViewCell
        cell.cardImage.image = UIImage(named: imageArray[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = CGSize(width: self.view.frame.size.width, height: self.cardCV.frame.size.height)
        return size
    }
}
