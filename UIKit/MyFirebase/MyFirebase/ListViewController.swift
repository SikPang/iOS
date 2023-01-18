//
//  ListViewController.swift
//  MyFirebase
//
//  Created by kwsong on 2023/01/18.
//

import UIKit
import Firebase
import FirebaseFirestore

class ListViewController: UIViewController
{
    @IBOutlet weak var textView: UITextView!
    
    struct IdolData
    {
        var name: String = ""
        var imageString: String = ""
        // Firebase DB에 들어가는 데이터 구조
        // 클래스와 구조체는 들어갈 수 없음
        // Number, String, Array, Dictionary
        
        func getDic() -> [String:String]
        {
            let dict = ["name": self.name, "imageString": self.imageString]
            return dict
        }
    }
    
    var idolArray: Array<IdolData> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func onBtnAdd(_ sender: Any)
    {
        addListData()
    }
    
    @IBAction func onBtnRead(_ sender: Any)
    {
        readListData()
    }
    
    func addListData()
    {
        var idol = IdolData()
        
        // 넣을 데이터 (임시)
        idol.name = "taeyeon"
        idol.imageString = "image3.png"
        
        // DB에 접근하면서 Dictionary로 변환
        let idolDic = idol.getDic()
        
        // DB연동
        let db = Firestore.firestore()
        
        var ref: DocumentReference? = nil
        
        ref = db.collection("idols").addDocument(data: idolDic)
        {
            // 후행 클로저
            err in
            
            if let error = err
            {
                print("write error ", error)
                self.textView.text.append("\nwrite error\n")
            }
            else
            {
                print("write success ", ref!.documentID)
                self.textView.text.append("\nwrite success\n")
            }
        }
    }
    
    func readListData()
    {
        let db = Firestore.firestore()
        
        db.collection("idols").whereField("name", isEqualTo: "suji").getDocuments { (QuerySnapshot, err) in
            if let error = err
            {
                print("read error ", error.localizedDescription)
                self.textView.text.append("\nread error\n")
            }
            else
            {
                for document in QuerySnapshot!.documents
                {
                    print("\(document.documentID) => \(document.data())")
                    
                    let dataDic = document.data() as NSDictionary
                    let name = dataDic["name"] as? String ?? "no_name"
                    let imageString = dataDic["imageString"] as? String ?? "no_image"
                    
                    var idol = IdolData()
                    idol.name = name
                    idol.imageString = imageString
                    self.idolArray.append(idol)
                }
            }
            
            for idol in self.idolArray
            {
                self.textView.text.append("\n\(idol.name)")
                self.textView.text.append("\n\(idol.imageString)")
            }
        }
    }
}
