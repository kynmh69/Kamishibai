//
//  ViewController.swift
//  Kamishibai
//
//  Created by Hiroki Kayanuma on 2019/05/12.
//  Copyright © 2019 Hiroki Kayanuma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //ここにイメージを設定
    @IBOutlet weak var images: UIImageView!
    var nowPageNum:Int = 1
    override func viewDidLoad() {
        super.viewDidLoad()
        let imageA: UIImage! = UIImage(named: "Image1-A")
        let imageB: UIImage! = UIImage(named: "Image1-B")
        
        images.animationImages = [imageA, imageB]
        
        images.animationDuration = 1
        
        images.startAnimating()
    }

    @IBAction func tapPrevButton() {
        
        if nowPageNum > 1 {
            nowPageNum-=1
        }
        self.changePage(pageNum: nowPageNum)
    }
    
    @IBAction func tapNextButton() {
        if nowPageNum < 5 {
            nowPageNum+=1
        }
        if self.nowPageNum == 5 {
            self.nowPageNum = 1
        }
        self.changePage(pageNum: nowPageNum)
    }
    
    func changePage(pageNum: Int) {
        self.images.stopAnimating()
        switch pageNum {
        case 1:
            self.images.animationImages = [UIImage(named: "Image1-A")!, UIImage(named: "Image1-B")!]
        case 2:
            self.images.animationImages = [UIImage(named: "Image2-A")!, UIImage(named: "Image2-B")!]
        case 3:
            self.images.animationImages = [UIImage(named: "Image3-A")!, UIImage(named: "Image3-B")!]
        case 4:
            self.images.animationImages = [UIImage(named: "Image4-A")!, UIImage(named: "Image4-B")!]
            self.showAlert()
        default:
            break
        }
        self.images.startAnimating()
    }
    
    func showAlert(){
        let title = "お疲れ様でした。"
        let message = "紙芝居はこれで終了です。\n戻るボタンを押してください。"
        let OK = "OK"
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: OK, style: UIAlertAction.Style.cancel, handler: nil)
        alert.addAction(okButton)
        
        present(alert, animated: true, completion: nil)
    }
}

