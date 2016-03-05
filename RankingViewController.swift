//
//  RankingViewController.swift
//  Barabaragame
//
//  Created by Honami on 2016/02/11.
//  Copyright © 2016年 Honami. All rights reserved.
//

import UIKit

class RankingViewController: UIViewController {
    @IBOutlet var rankingLavel1: UILabel!
    @IBOutlet var rankingLavel2: UILabel!
    @IBOutlet var rankingLavel3: UILabel!
    
    let defaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()//スコア保存するための変数
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rankingLavel1.text = String(defaults.integerForKey("score1"))
        rankingLavel2.text = String(defaults.integerForKey("score2"))
        rankingLavel3.text = String(defaults.integerForKey("score3"))
        
        // Do any additional setup after loading the view.
    }
    @IBAction func toTop(){
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
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
