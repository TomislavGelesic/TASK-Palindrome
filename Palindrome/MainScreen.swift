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
    /*
    struct message {
        var normal:String? = ""
        var edited:String? = ""
        
        func toString() -> String {
            if let s = self.normal, let e = self.edited {
                var attributed = NSMutableAttributedString.init(string: e)
                var ns = e as NSString
                attributed.addAttribute(NSMutableAttributedString.Key.foregroundColor, value: UIColor.green, range: ns.range(of: e))
                return s + "\n" + e
            } else if let s = self.normal{
                return s
            } else if let e = self.edited{
                return e
            } else {
                return ""
            }
        }
    }*/
    
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
                let alert = UIAlertController(title: "Incorrect!", message: "Entry was not valid word. Try to add a word which is a palindrome", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Try again", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            } else {
                if isPalindrome(string: palindrom) {
                    
                    let alert = UIAlertController(title: "Correct!", message: "The entered word is a palindrome!", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Enter new palindrome", style: .default, handler: {action in self.palindromeTextField.text = ""}))
                    
                    self.present(alert, animated: true, completion: nil)
                } else {
                    let alert = UIAlertController(title: "Incorrect!", message: "The entered word is not a palindrome!", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Try again", style: .default, handler: {action in self.palindromeTextField.text = ""}))
                    self.present(alert, animated: true, completion: nil)
                }
            }
        }
        palindromeTextField.text = ""
    }
    
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
