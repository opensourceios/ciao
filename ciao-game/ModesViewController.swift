//
//  AchievementsViewController.swift
//  ciao-game
//
//  Created by Clinton D'Annolfo on 8/12/2014.
//  Copyright (c) 2014 Clinton D'Annolfo. All rights reserved.
//

import Foundation
import UIKit

class ModesViewController: UITableViewController {
    
    // MARK: - Outlets
    
    @IBOutlet var modeTableViewCells: [ModeTableViewCell]!
    
    // MARK: - Properties
    
    var game: LanguageGame!
    var coreDataDelegate: CoreDataDelegate!
    
    // MARK: - View Controller methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCheckedCell()
        navigationItem.title = Localization.Title.Modes
        //tableView.insertRowsAtIndexPaths(path, withRowAnimation: UITableViewRowAnimation.Right)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table View Delegate
    
    //Dictation Mode: Learn to Speak and Pronounce
    //Verb Mode: Learn the most common verbs
    //Grammar Mode: Learn the intricacies of Grammar
    //Counting Mode: Learn to count
    //Ultimate Mode: All the words are in it
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! ModeTableViewCell
        switch cell.gameModeIndex {
        case GameMode.introMode.rawValue:
            game.gameMode = .introMode
        case GameMode.grammarMode.rawValue:
            game.gameMode = .grammarMode
        case GameMode.alphabetMode.rawValue:
            game.gameMode = .alphabetMode
        case GameMode.phraseMode.rawValue:
            game.gameMode = .phraseMode
        case GameMode.verbMode.rawValue:
            game.gameMode = .verbMode
        case GameMode.dictationMode.rawValue:
            game.gameMode = .dictationMode
        default:
            game.gameMode = .introMode
        }
//        setGameMode(cell?.textLabel?.text as String!)
        setCheckedCell()
        self.navigationController?.popViewController(animated: true)
    }
    
    //MARK: - Mode methods
//    func setGameMode(mode: String) {
//        switch (mode) {
//        case GameMode.IntroMode.toString():
//            game.gameMode = .IntroMode
//        case GameMode.GrammarMode.toString():
//            game.gameMode = .GrammarMode
//        case GameMode.AlphabetMode.toString():
//            game.gameMode = .AlphabetMode
//        case GameMode.PhraseMode.toString():
//            game.gameMode = .PhraseMode
//        case GameMode.VerbMode.toString():
//            game.gameMode = .VerbMode
//        case GameMode.DictationMode.toString():
//            game.gameMode = .DictationMode
//        default:
//            print("Error: game mode not found")
//            game.gameMode = .IntroMode
//        }
////        userDefaults.setValue(mode, forKey: UserDefaults.GameMode)
////        print("Set game mode to \(mode)")
//    }
    
    func setCheckedCell () {
        for cell in modeTableViewCells {
            if game.gameMode.rawValue == cell.gameModeIndex {
                cell.accessoryType = UITableViewCellAccessoryType.checkmark
            } else {
                cell.accessoryType = UITableViewCellAccessoryType.none
            }
        }
    }
}
