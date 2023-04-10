//
//  ViewController.swift
//  UserDefalutEx
//
//  Created by mayank ranka on 10/04/23.
//

import UIKit

class ViewController: UIViewController {
    
    var backView    : UIView!
    var topLabel    : UILabel!
    var nameLabel   : UILabel!
    var nameText    : UITextField!
    var saveButton  : UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        loadBackView()
        loadTopLabel()
        loadNameLabel()
        loadNameText()
        loadSaveButton()
        self.view.backgroundColor = .init(red: (46.0 / 255.0), green: (163.0 / 255.0), blue: (77.0 / 255.0), alpha: 1)
        let value = UserDefaults.standard.string(forKey: "username")
        
        if value != nil{
            topLabel.text = "Hello, \(value!)"
        }
        print(UserDefaults.standard.string(forKey: "username")!)
    }
    
    func loadBackView(){
        backView = UIView()
        backView.translatesAutoresizingMaskIntoConstraints = false
        backView.backgroundColor = .white
        self.view.addSubview(backView)
        backView.layer.cornerRadius = 30
        backView.clipsToBounds = true
        NSLayoutConstraint.activate([
            backView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 40),
            backView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -40),
            backView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100),
            backView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -150)
        ])
        
    }
    
    func loadTopLabel(){
        topLabel = UILabel()
        topLabel.translatesAutoresizingMaskIntoConstraints = false
        backView.addSubview(topLabel)
        topLabel.text = "Hello, Guest"
        topLabel.textAlignment = .center
        NSLayoutConstraint.activate([
            topLabel.topAnchor.constraint(equalTo: backView.topAnchor, constant: 100),
            topLabel.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 20),
            topLabel.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -20),
            topLabel.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    func loadNameLabel(){
        nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        backView.addSubview(nameLabel)
        nameLabel.text = "Your name"
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 10),
            nameLabel.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: 40),
            nameLabel.widthAnchor.constraint(equalToConstant: 90),
        ])
        
    }
    
    func loadNameText(){
        nameText = UITextField()
        nameText.translatesAutoresizingMaskIntoConstraints = false
        backView.addSubview(nameText)
        nameText.placeholder = "Enter your name"
        NSLayoutConstraint.activate([
            nameText.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 10),
            nameText.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: 40),
            nameText.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -10)
        ])
    }
    
    func loadSaveButton(){
        saveButton = UIButton()
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        backView.addSubview(saveButton)
        saveButton.setTitle("Save", for: .normal)
        saveButton.layer.cornerRadius = 30
        saveButton.backgroundColor = .init(red: (46.0 / 255.0), green: (163.0 / 255.0), blue: (77.0 / 255.0), alpha: 1)
        saveButton.setTitleColor(.white, for: .normal)
        NSLayoutConstraint.activate([
            saveButton.topAnchor.constraint(equalTo: nameText.bottomAnchor, constant: 40),
            saveButton.centerXAnchor.constraint(equalTo: backView.centerXAnchor),
            saveButton.widthAnchor.constraint(equalToConstant: 100),
            saveButton.heightAnchor.constraint(equalToConstant: 40)
        ])
        
            saveButton.addTarget(self, action: #selector(onClickSave), for: .touchUpInside)
        
        }

  @objc  func onClickSave(sender : UIButton){
      
          UserDefaults.standard.set(nameText.text, forKey: "username")
          let alert = UIAlertController(title: "Data Saved", message: "Your name has been stored in User Default", preferredStyle: .alert)
          let okButton = UIAlertAction(title: "Okay", style: .default)
          
          alert.addAction(okButton)
          present(alert, animated: true, completion: nil)
          nameText.text = " "
      
    }
    
    

}

