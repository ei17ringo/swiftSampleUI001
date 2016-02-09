//
//  ViewController.swift
//  sampleUI001
//
//  Created by Eriko Ichinohe on 2016/02/09.
//  Copyright © 2016年 Eriko Ichinohe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // View動的追加用変数
    var aView = UIView(frame: CGRectMake(0, 0, 100, 100))
    let myBoundSize: CGSize = UIScreen.mainScreen().bounds.size
    var openFlag = false
    @IBOutlet weak var btnTap: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        self.aView = UIView(frame: CGRectMake(0,myBoundSize.height,myBoundSize.width,250))
        self.aView.backgroundColor = UIColor.greenColor()
        self.view.addSubview(aView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func tap(sender: UIButton) {
        UIView.animateWithDuration(1, animations: { () -> Void in
            
            if (self.openFlag){
                //Viewが現れているので、隠す
                self.aView.frame = CGRectMake(0,self.myBoundSize.height,self.myBoundSize.width,250)
                
                //ボタンを元の位置に戻す
                self.btnTap.frame = CGRectMake(self.btnTap.frame.origin.x,self.btnTap.frame.origin.y + 250, self.btnTap.frame.width , self.btnTap.frame.height)
                self.openFlag = false
            }else{
                //Viewが隠れているので、表示する
                self.aView.frame = CGRectMake(0,self.myBoundSize.height-250,self.myBoundSize.width,250)
                
                //ボタンがViewに隠れないように同じ分移動させる
                self.btnTap.frame = CGRectMake(self.btnTap.frame.origin.x,self.btnTap.frame.origin.y - 250, self.btnTap.frame.width , self.btnTap.frame.height)
                self.openFlag = true
            }
            
            
            }, completion: { finished in
                print("Viewを動かしました")
        })
    }

}

