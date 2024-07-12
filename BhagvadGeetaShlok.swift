//
//  BhagvadGeetaShlok.swift
//  ShreemadBhagvadGeeta
//
//  Created by Frontlink Tech on 26/12/23.
//

import UIKit

class BhagvadGeetaShlok: UIViewController {
    //
    
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var slugLabel: UILabel!
    @IBOutlet weak var nameTransliteratedLabel: UILabel!
    @IBOutlet weak var nameTranslatedLabel: UILabel!
    @IBOutlet weak var verseeLabel: UILabel!
    @IBOutlet weak var chaperNumberLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    
    var id = Int()
    var name = String()
    var slug = String()
    var name_transliterated = String()
    var name_translated = String()
    var versesCount = Int()
    var chapterNumber = Int()
    var chapterSummary = String()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        idLabel.text = "Id: \(id)"
        nameLabel.text = "Name: \(name)"
        slugLabel.text = "Slug: \(slug)"
        nameTransliteratedLabel.text = "NameTransliterated: \(name_transliterated)"
        nameTranslatedLabel.text = "NameTranslated: \(name_translated)"
        verseeLabel.text = "VerseCount: \(versesCount)"
        chaperNumberLabel.text = "ChapterNumber: \(chapterNumber)"
        summaryLabel.text = "Summary:  \(chapterSummary)"
    }
}
