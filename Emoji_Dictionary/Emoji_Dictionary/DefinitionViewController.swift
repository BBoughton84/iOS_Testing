//
//  DefinitionViewController.swift
//  Emoji_Dictionary
//
//  Created by Bill Boughton on 6/5/17.
//  Copyright © 2017 Bill Boughton. All rights reserved.
//

import UIKit

class DefinitionViewController: UIViewController {
    
    var emoji = "NO EMOJI"

    @IBOutlet weak var emojiLabel: UILabel!
    
    @IBOutlet weak var definitionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        emojiLabel.text = emoji
        

        
        if emoji == "💩" {
            definitionLabel.text = "This is poo"
        }
        if emoji == "😎" {
            definitionLabel.text = "These are sunglasses"
        }
        if emoji == "😡" {
            definitionLabel.text = "ANGRY"
        }
        if emoji == "🙏" {
            definitionLabel.text = "Pray for me"
        }
        if emoji == "✌️" {
            definitionLabel.text = "Peace"
        }
        if emoji == "👀" {
            definitionLabel.text = "Look at me"
        }
        if emoji == "🦂" {
            definitionLabel.text = "Pincher"
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
