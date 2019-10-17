//
//  ViewController.swift
//  Jumia
//
//  Created by Mustafa on 10/16/19.
//  Copyright © 2019 Mostafa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var randomdiscountIndex1 : Int = 0

    
    var images = ["model1" , "model2","model3" , "model4" , "model5"]
    var imagesTopRate = ["rat1","rat2","rat3","rat4","rat5","rat6"]
    var itemDesribation = ["Plain Lapel ","Down Parka - Men's","Mens trench coat","Fashion Gothic Jacket","Carhartt Men's 10","Face Mask"]
    var priceAfter = ["134 $" , "60 $" , "100.2 $" , "170 &" , "72 $" , "120.5 $"]
    var  priceBefore = ["140 $" , "80 $" , "110 $" , "190.5 $" , "80 $" , "150 $"]
    
    var discount  = ["-5 %","-10 %", "-15 %","-20 %","-25 %"]
    var rating = ["4.6" , "4.8" , "4.5" , "4.7" , "4.2"]

    @IBOutlet weak var shirtsImage: UIImageView!
    
    @IBOutlet weak var pantsImage: UIImageView!
    
    @IBOutlet weak var coatsImage: UIImageView!
    @IBOutlet weak var jacketsImage: UIImageView!
    @IBOutlet weak var contentScroll: UIScrollView!
    
    @IBOutlet weak var sliderCollectionView: UICollectionView!
    
    
    @IBOutlet weak var topRateCollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        readius()
        raduiesImage(img: shirtsImage)
        raduiesImage(img: pantsImage)
        raduiesImage(img: jacketsImage)
        raduiesImage(img: coatsImage)
        sliderCollectionView.delegate = self
        sliderCollectionView.dataSource = self
        topRateCollectionView.delegate = self
        topRateCollectionView.dataSource = self
        
        
        
        
        


       
    }
    



    //Mark :- fun Radius view
    func readius() {
        contentScroll.layer.cornerRadius = 30
        contentScroll.clipsToBounds = true
    }
    
    func raduiesImage  (img : UIImageView){
        img.layer.cornerRadius = img.frame.height / 2
        img.layer.borderWidth = 1
        img.clipsToBounds = true
        
    }
    
}

extension ViewController : UICollectionViewDelegate {
    
}
extension ViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 1 {
            return images.count

        }else{
        return imagesTopRate.count
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView.tag == 1 {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageSliderCollectionViewCell", for: indexPath) as? imageSliderCollectionViewCell {
                cell.sliderImageView.image = UIImage(named: images[indexPath.item])
                return cell
                
            } else {
                return UICollectionViewCell()
                
            }
            
        } else {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopRatedCollectionViewCell", for: indexPath) as? TopRatedCollectionViewCell {
                randomdiscountIndex1 = Int.random(in: 0 ... 4)
                cell.discountLbl.text = discount[randomdiscountIndex1]
                cell.itemImage.image = UIImage(named: imagesTopRate[indexPath.item])
                cell.itemDitelsLbl.text = itemDesribation[indexPath.item]
                cell.priceAfterLbl.text = priceAfter[indexPath.item]
                cell.priceBeforDiscountLbl.text = priceBefore[indexPath.item]
                cell.rateScoreLbl.text = rating[randomdiscountIndex1]
                return cell
                
            } else {
                return UICollectionViewCell()
                
            }
        }
        
        
        
    }
    
    
}

//extension ViewController : UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        if collectionView.tag == 2 {
//            let cellSize = CGSize(width: (view.frame.width / 2) - 15 , height: 20)
//            return cellSize
//        } else {
//            return CGSize(width: view.frame.width, height: 320)
//            
//        }
//}
//}


