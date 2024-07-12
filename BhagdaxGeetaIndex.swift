//
//  BhagdaxGeetaIndex.swift
//  ShreemadBhagvadGeeta
//
//  Created by Frontlink Tech on 26/12/23.
//

import UIKit
import Alamofire

struct Api: Codable{
    var id : Int
    var name : String
    var slug : String
    var name_transliterated : String
    var name_translated : String
    var verses_count : Int
    var chapter_number : Int
    var name_meaning : String
    var chapter_summary : String
}

class BhagdaxGeetaIndex: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var indexCollectionView: UICollectionView!
    
    var array : [Api] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        getapi()
    }
    
    func getapi()
    {
        AF.request("https://bhagavad-gita3.p.rapidapi.com/v2/chapters/",method:.get,headers: ["X-RapidAPI-Key":"900a4b9fb6msh671592eb10fc713p13d190jsnc83462218df3"]).responseData { respo in
            
            switch respo.result {
            case . success(let data):
                do{
                    
                    self.array = try JSONDecoder().decode([Api].self, from: data)
                    print(self.array)
                    print(respo.result)
                    DispatchQueue.main.async {
                        self.indexCollectionView.reloadData()
//                        print(self.array)
                    }
                    
                }
                catch {
                    print(error.localizedDescription)
                }
            case.failure(let err ):
                print(err.localizedDescription)
            }
        }
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = indexCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! IndexCell
        cell.indexNoLabel.text = "\(array[indexPath.row].id)"
        cell.indexNameLabel.text = array[indexPath.row].name
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 10
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 361, height: 88)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        navigation(id: array[indexPath.row].id, name: array[indexPath.row].name, slug: array[indexPath.row].slug, name_transliterated: array[indexPath.row].name_transliterated, name_translated: array[indexPath.row].name_translated, versesCount: array[indexPath.row].verses_count, chapter: array[indexPath.row].chapter_number,summary: array[indexPath.row].chapter_summary)
    }
    
    func navigation(id:Int,name:String,slug:String,name_transliterated:String,name_translated:String,versesCount:Int,chapter:Int,summary:String)
    {
        let navigation = storyboard?.instantiateViewController(identifier: "BhagvadGeetaShlok") as! BhagvadGeetaShlok
        navigation.id = id
        navigation.name = name
        navigation.slug = slug
        navigation.name_transliterated = name_transliterated
        navigation.name_translated = name_translated
        navigation.versesCount = versesCount
        navigation.chapterNumber = chapter
        navigation.chapterSummary = summary
        navigationController?.pushViewController(navigation, animated: true)
    }
    
}
