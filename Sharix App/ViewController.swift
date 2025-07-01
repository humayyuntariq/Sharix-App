//
//  ViewController.swift
//  SLogin
//
//  Created by Humayun Tariq on 29/05/2025.
//

import UIKit

class LoinPage: UIViewController {
    
    @IBOutlet weak var EmailTextField: UITextField!
    
    @IBOutlet weak var PasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("old login info")
        reteriveLoginInfo()

    }

    @IBAction func LoginAction(_ sender: Any) {
        UserDefaults.standard.set(EmailTextField.text, forKey: "Email")
        UserDefaults.standard.set(PasswordTextField.text, forKey: "Password")
        
        print("new login info")
        reteriveLoginInfo()

    }
    
    func reteriveLoginInfo(){
        let email = UserDefaults.standard.string(forKey: "Email")
        let password = UserDefaults.standard.string(forKey: "Password")
        
        if let email = email, let password = password {
            print("Your email is \(email) and password is \(password)")
        } else {
            print("No saved login info found")
        }
    }
    
}

class TablePage: UIViewController,  UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var Table: UITableView!
    
    struct mountains {
        let title: String
        let imageName: String
        
    }
    
    let data: [mountains] = [
        mountains(title: "Lakes and Mountain", imageName: "m1"),
        mountains(title: "Lakes, Trees and Mountains", imageName: "m2"),
        mountains(title: "Mountains at sunset", imageName: "m3"),
        mountains(title: "Mountains at sunrise", imageName: "m4"),
        mountains(title: "Mountains and Road", imageName: "m5"),
        mountains(title: "Mountains and clouds", imageName: "m6"),
        mountains(title: "Forest and Mountains", imageName: "m7"),
        
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Table.dataSource = self
        Table.delegate = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let sunset = data[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        cell.label.text = sunset.title
        cell.iconImageView.image = UIImage(named: sunset.imageName)
        

        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    

}

class CollectionPage: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    

    @IBOutlet weak var collectionView: UICollectionView!
    
    
    struct ImageItem {
        let title: String
        let imageName: String
    }
    
    let items: [ImageItem] = [
        ImageItem(title: "Snowy Peak", imageName: "m1"),
        ImageItem(title: "Valley View", imageName: "m2"),
        ImageItem(title: "Sunset Hills", imageName: "m3"),
        ImageItem(title: "Golden Mountains", imageName: "m4"),
        ImageItem(title: "Foggy Forest", imageName: "m5"),
        ImageItem(title: "Glacier View", imageName: "m6"),
        ImageItem(title: "Snowy Peak", imageName: "m1"),
        ImageItem(title: "Valley View", imageName: "m2"),
        ImageItem(title: "Sunset Hills", imageName: "m3"),
        ImageItem(title: "Golden Mountains", imageName: "m4"),
        ImageItem(title: "Foggy Forest", imageName: "m5"),
        ImageItem(title: "Glacier View", imageName: "m6")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = items[indexPath.item]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! customCollectionPage
        cell.layer.borderWidth = 1.5
        cell.layer.cornerRadius = 23
        cell.titleLabel.text = item.title
        cell.imageView.image = UIImage(named: item.imageName)
        return cell
    }

    // Optional: Size of each cell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = collectionView.frame.size.width
        let safeWidth = width > 10 ? width : 320 // or any default fallback
        let size = (safeWidth - 10) / 2
        return CGSize(width: size, height: size)

    }
}




