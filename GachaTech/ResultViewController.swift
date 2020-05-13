//
//  ResultViewController.swift
//  GachaTech
//
//  Created by maya on 2020/05/13.
//  Copyright © 2020 maya. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    // 一番後ろの背景画像
    @IBOutlet var haikeiImageView: UIImageView!
    
    // モンスターを表示する画像
    @IBOutlet var monsterImageView: UIImageView!
    
    // モンスターの名前を表示
    @IBOutlet var monsterNameLabel: UILabel!
    
    // モンスター画像を保存しておく配列
    var monsterArray: [UIImage]!
    var monsterName: [String]!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // 0~9の間でランダムに数字を発生させる
        let number = Int.random(in: 0..<10)
        
        // モンスターの画像を10枚追加する
        monsterArray = [UIImage(named:"monster001.png")!,
                        UIImage(named:"monster002.png")!,
                        UIImage(named:"monster003.png")!,
                        UIImage(named:"monster004.png")!,
                        UIImage(named:"monster005.png")!,
                        UIImage(named:"monster006.png")!,
                        UIImage(named:"monster007.png")!,
                        UIImage(named:"monster008.png")!,
                        UIImage(named:"monster009.png")!,
                        UIImage(named:"monster010.png")!]
        
        monsterName = ["A", "B", "C", "D", "E",
                       "F", "G", "H", "I", "J"]
        
        // ランダムに選んだモンスターを表示させる
        monsterImageView.image = monsterArray[number]
        monsterNameLabel.text = monsterName[number]
        
        if number == 9 {
            haikeiImageView.image = UIImage(named: "bg_gold.png")
        } else if number > 6 {
            haikeiImageView.image = UIImage(named: "bg_red.png")
        } else {
            haikeiImageView.image = UIImage(named: "bg_blue.png")
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        // アニメーションの中でもtransformさせるキーパスを設定
        let animation = CABasicAnimation(keyPath: "transform")
        
        // アニメーションの開始時の数値
        animation.fromValue = NSNumber(value: 0)
        
        // アニメーション終了時の数値(M_PIとは角度の180度)
        animation.toValue = NSNumber(value: 2 * Double.pi)
        
        // Z軸を中心としたアニメーションにする
        animation.valueFunction = CAValueFunction(name: CAValueFunctionName.rotateZ)
        
        // アニメーションの速さ
        animation.duration = 5
        
        // アニメーションを何回繰り返すか決める(今回は無限)
        animation.repeatCount = Float.infinity
        
        // どのレイヤーをアニメーションさせるか指定
        haikeiImageView.layer.add(animation, forKey: nil)
        
    }
    
    @IBAction func modoru() {
        self.dismiss(animated: true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
