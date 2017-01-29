//
//  zoomViewController.swift
//  SlideshowApp
//
//  Created by 渡邉慎 on 2017/01/29.
//  Copyright © 2017年 shin02. All rights reserved.
//

import UIKit

class zoomViewController: UIViewController {

    @IBOutlet weak var bigImage: UIImageView!
    
    //画像情報を受け取る変数
    var tapimage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //画像を表示する
        bigImage.image = tapimage
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
