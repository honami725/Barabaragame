//
//  GameViewController.swift
//  Barabaragame
//
//  Created by Honami on 2016/02/11.
//  Copyright © 2016年 Honami. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet var imageView1: UIImageView!
    @IBOutlet var imageView2: UIImageView!
    @IBOutlet var imageView3: UIImageView!
    @IBOutlet var resultLabel: UILabel!
    
    
    var timer:NSTimer!
    var score:Int = 1000
    let defaults:NSUserDefaults = NSUserDefaults.standardUserDefaults()
    let width: CGFloat = UIScreen.mainScreen().bounds.size.width
    var positionX:[CGFloat] = [0.0, 0.0, 0.0]
    var dx:[CGFloat] = [3.0, 0.5, -1.0]
    
    
    func start(){
        
        resultLabel.hidden = true
        
        
        timer = NSTimer.scheduledTimerWithTimeInterval(0.005, target: self, selector: "up", userInfo: nil,repeats: true)
        timer.fire()
        
        
        
        
    }
    func up(){
        
        for i in 0..<3{
            
            if positionX[i] > width || positionX[i] < 0 {
                dx[i] = dx[i]*(-1)
            }
            positionX[i] += dx[i]
        }
        imageView1.center.x = positionX[0]
        imageView2.center.x = positionX[1]
        imageView3.center.x = positionX[2]
        
    }
    
    
    @IBAction func stop(){
        let highScore1: Int = defaults.integerForKey("score1")
        let highScore2: Int = defaults.integerForKey("score2")
        let highScore3: Int = defaults.integerForKey("score3")
        
        if timer.valid == true{
            timer.invalidate()
        }
        for i in 0..<3{
            score = score - abs(Int(width/2 - positionX[i]))*2
        }
        resultLabel.text = "Score: " + String(score)
        resultLabel.hidden = false
        
        if score > highScore1 {
            defaults.setInteger(score, forKey: "score1")
            defaults.setInteger(highScore1, forKey: "score2")
            defaults.setInteger(highScore2, forKey: "score3")
        }else if score > highScore2 {
            defaults.setInteger(score, forKey: "score2")
            defaults.setInteger(highScore2, forKey: "score3")
        }else if score > highScore3 {
            defaults.setInteger(score, forKey: "score3")
        }
        
    }
    
    @IBAction func toTop(){
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    @IBAction func retry(){
        
        score = 1000
        positionX = [width/2, width/2, width/2]
        self.start()
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        positionX = [width/2, width/2, width/2]
        self.start()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
