//
//  ViewController.swift
//  Emoji_Dictionary
//
//  Created by Bill Boughton on 6/4/17.
//  Copyright © 2017 Bill Boughton. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var tableview: UITableView!
    
    
    var emojis : [Emoji] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableview.dataSource = self
        tableview.delegate = self
        
        emojis = makeEmojiArray()
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emojis.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(indexPath.row)
        let cell = UITableViewCell()
        let emoji = emojis[indexPath.row]
        cell.textLabel?.text = emoji.stringEmoji
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let emoji = emojis[indexPath.row]
        performSegue(withIdentifier: "moveSegue", sender: emoji)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let defVC = segue.destination as! DefinitionViewController
        defVC.emoji = sender as! Emoji
    }
    
    func makeEmojiArray() -> [Emoji]{
        let emoji1 = Emoji()
        emoji1.stringEmoji = "😎"
        emoji1.defintion = "This dude is wearing sunglasses"
        emoji1.category = "smiley"
        emoji1.birthYear = 2009
        
        let emoji2 = Emoji()
        emoji2.stringEmoji = "😡"
        emoji2.defintion = "This dude is ANGRY"
        emoji2.category = "smiley"
        emoji2.birthYear = 2010
        
        let emoji3 = Emoji()
        emoji3.stringEmoji = "💩"
        emoji3.defintion = "POOP"
        emoji3.category = "smiley"
        emoji3.birthYear = 2011
        
        let emoji4 = Emoji()
        emoji4.stringEmoji = "🙏"
        emoji4.defintion = "Pray"
        emoji4.category = "Action"
        emoji4.birthYear = 2012
        
        let emoji5 = Emoji()
        emoji5.stringEmoji = "✌️"
        emoji5.defintion = "Peace"
        emoji5.category = "Action"
        emoji5.birthYear = 2011
        
        let emoji6 = Emoji()
        emoji6.stringEmoji = "👀"
        emoji6.defintion = "Eyes"
        emoji6.category = "Action"
        emoji6.birthYear = 2013

        let emoji7 = Emoji()
        emoji7.stringEmoji = "🦂"
        emoji7.defintion = "Crawfish"
        emoji7.category = "Animal"
        emoji7.birthYear = 2015
        
        
        
        return [emoji1, emoji2, emoji3, emoji4, emoji5, emoji6, emoji7]
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

