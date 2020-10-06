//
//  MainScreen.swift
//  Palindrome
//
//  Created by Tomislav Gelesic on 05/10/2020.
//

import UIKit


class MainScreen: UIViewController {
    //MARK: Properties
    var palindromeTextField = UITextField()
    let checkButton = UIButton()
    
    struct message {
        var normal:String? = ""
        var edited:String? = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupPalindormeTextField()
        setupCheckButton()
    }
    
    
    
    func setupCheckButton() {
        checkButton.backgroundColor = .blue
        checkButton.setTitle("CHECK", for: .normal)
        checkButton.setTitleColor(.white, for: .normal)
        checkButton.addTarget(self, action: #selector(checkButtonTapped), for: .touchUpInside)
        view.addSubview(checkButton)
        setupCheckButtonConstraints()
    }
    
    @objc func checkButtonTapped () {
        if let palindrom = palindromeTextField.text {
            
            
            if !isAlpha(txt: palindrom) || palindrom.isEmpty {
                showAlert(title: "Incorrect!", message: "Entry was not a valid word. Try to add\n", messagePartToEdit: "a word which is a palindrome.", color: .black, bold: true , alertButtonTitle: "Try again")
            } else {
                if isPalindrome(string: palindrom) {
                    showAlert(title: "Correct!", message: "The entered word is a palindrome!\n", messagePartToEdit: "Do you know some other palindrome?", color: .green, bold: false, alertButtonTitle: "Enter new palindrome")
                    
                } else {
                    showAlert(title: "Incorrect!", message: "The entered word is not a palindrome!\n", messagePartToEdit: "Try different word.", color: .red, bold: false, alertButtonTitle: "Try again")
                }
            }
        }
        palindromeTextField.text = ""
    }
    
    //MARK: Palindrome logic
    
    func isAlpha(txt: String) -> Bool {
        return CharacterSet.letters.isSuperset(of: CharacterSet(charactersIn: txt))
    }
    
    func isPalindrome (string: String) -> Bool {
        if string == String(string.reversed()) {
            return true
        } else {
            return false
        }
    }
    
    func showAlert(title: String, message: String, messagePartToEdit: String, color: UIColor, bold: Bool, alertButtonTitle: String) {
        
        let attributedMessagePartToEdit: NSMutableAttributedString
        let attributedMessage = NSMutableAttributedString(string: message)
        let finalMessage = NSMutableAttributedString()
        
        if(bold){
            attributedMessagePartToEdit = NSMutableAttributedString(string: messagePartToEdit, attributes: [NSAttributedString.Key.foregroundColor : color , NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18)])
        }
        else {
            attributedMessagePartToEdit = NSMutableAttributedString(string: messagePartToEdit, attributes: [NSAttributedString.Key.foregroundColor : color])
        }
        
        finalMessage.append(attributedMessage)
        finalMessage.append(attributedMessagePartToEdit)
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.setValue( finalMessage, forKey: "attributedMessage")
        alert.addAction(UIAlertAction(title: alertButtonTitle, style: .cancel, handler: {(action) in self.palindromeTextField.text = ""}))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    
    //MARK: Set ups
    func setupCheckButtonConstraints () {
        checkButton.translatesAutoresizingMaskIntoConstraints = false
        checkButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        checkButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        checkButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        checkButton.topAnchor.constraint(equalTo: palindromeTextField.bottomAnchor, constant: 50).isActive = true
    }
    
    func setupPalindormeTextField () {
        palindromeTextField.placeholder = "Insert palindrome"
        
        palindromeTextField.setBottomBorder()
        
        view.addSubview(palindromeTextField)
        setPalindromeTextFieldConstraints()
    }
    
    func setPalindromeTextFieldConstraints () {
        palindromeTextField.translatesAutoresizingMaskIntoConstraints = false
        palindromeTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5).isActive = true
        palindromeTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5).isActive = true
        palindromeTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        palindromeTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    
    
}

//MARK: Extensions
extension UITextField {
    func setBottomBorder() {
        self.borderStyle = .none
        self.layer.backgroundColor = UIColor.white.cgColor
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
    }
}
