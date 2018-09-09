//
//  InfoViewController.swift
//  HistoryRocks
//
//  Created by Peter Reichl on 8/31/18.
//  Copyright © 2018 Peter Reichl. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {
    
    @IBAction func backToFirstVCButton(_ sender: Any) {
        self.performSegue(withIdentifier: "backToFirstView", sender: nil)
    }
    
    @IBAction func goToStartGameVC(_ sender: Any) {
        self.performSegue(withIdentifier: "startGameVC", sender: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
