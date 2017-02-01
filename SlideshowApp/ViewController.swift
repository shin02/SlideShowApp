//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 渡邉慎 on 2017/01/29.
//  Copyright © 2017年 shin02. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //順番を示す変数
    var number = 0
    
    //タイマー用
    var timer: Timer! = nil
    
    //segue用
    @IBAction func unwind(segue: UIStoryboardSegue) {
        
    }
    
    //表示する画像
    @IBOutlet weak var image: UIImageView!
    
    //進むボタン
    @IBOutlet weak var nextButton: UIButton!
    @IBAction func nextButton(_ sender: Any) {
        number += 1
        if number == 3 {
            number = 0
        }
        displayImage(number: number)
    }
    
    //戻るボタン
    @IBOutlet weak var returnButton: UIButton!
    @IBAction func returnButton(_ sender: Any) {
        number -= 1
        if number == -1 {
            number = 2
        }
        displayImage(number: number)
    }
    
    //自動でスライドさせる関数
    func slideImage(timer: Timer){
        number += 1
        if number == 3 {
            number = 0
        }
        displayImage(number: number)
    }
    
    //再生・停止ボタン
    @IBOutlet weak var startstopButton: UIButton!
    @IBAction func startstopButton(_ sender: Any) {
        
        //スライドが動いていなければタイマー動かす
        if timer == nil {
            
            //進むボタン無効化
            nextButton.isEnabled = false
            //戻るボタン無効化
            returnButton.isEnabled = false
            //停止ボタンに変更
            startstopButton.setTitle("停止", for: UIControlState.normal)
            
            //タイマーを動かす
            timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(slideImage), userInfo: nil, repeats: true)

        }
        //スライドが動いていればタイマーを止める
        else {
            //再生ボタンに変更
            startstopButton.setTitle("再生", for: UIControlState.normal)
            //進むボタン有効化
            nextButton.isEnabled = true
            //戻るボタン有効化
            returnButton.isEnabled = true
            
            timer.invalidate()
            timer = nil
        }
    }
    
    //画像を表示
    func displayImage(number: Int){
        if number == 0 {
            image.image = UIImage(named: "dog")
        }
        if number == 1 {
            image.image = UIImage(named: "cat")
        }
        if number == 2 {
            image.image = UIImage(named: "pig")
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        displayImage(number: number)
        }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //遷移時の値の受け渡し
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //タイマーが動いていればタイマーを止める
        if timer != nil {
            timer.invalidate()
            timer = nil
            
            //再生ボタンに変更
            startstopButton.setTitle("再生", for: UIControlState.normal)
            //進むボタン有効化
            nextButton.isEnabled = true
            //戻るボタン有効化
            returnButton.isEnabled = true
        }

        // segueから遷移先を取得する
        let zoomViewController:zoomViewController = segue.destination as! zoomViewController
        // 遷移先で宣言しているtapimageに代入して渡す
        zoomViewController.tapimage = image.image
    }


}

