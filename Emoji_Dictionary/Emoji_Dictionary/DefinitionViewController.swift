//
//  DefinitionViewController.swift
//  Emoji_Dictionary
//
//  Created by Bill Boughton on 6/5/17.
//  Copyright © 2017 Bill Boughton. All rights reserved.
//

import UIKit

class DefinitionViewController: UIViewController {
    
    var emoji = Emoji()

    @IBOutlet weak var categoryLabel: UILabel!
    
    @IBOutlet weak var birthYearLabel: UILabel!
    
    @IBOutlet weak var emojiLabel: UILabel!
    
    @IBOutlet weak var definitionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        emojiLabel.text = emoji.stringEmoji
        birthYearLabel.text = "BirthYear: \(emoji.birthYear)"
        birthYearLabel.text = String(emoji.birthYear)
        definitionLabel.text = emoji.defintion
        categoryLabel.text = "Category: \(emoji.category)"
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
