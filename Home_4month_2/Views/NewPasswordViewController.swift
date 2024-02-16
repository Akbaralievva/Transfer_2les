//
//  NewPasswordViewController.swift
//  Home_4month_2
//
//  Created by A LINA on 14/2/24.
//

import UIKit

class NewPasswordViewController: UIViewController {
    
    
    
    private lazy var backgroundImageView: UIImageView = {
        
        let imageView = UIImageView(image: UIImage(named: "block"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    private lazy var messageTF = MakerView().makeTextField(placeholder: " ", size: 18,textColor: UIColor(named: "textColor") ?? .systemGray, backgroundColor: .systemGray, cornerRadius: 20)
    
    private  lazy var bannerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 40
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    private lazy var newpasswordLbl = MakerView().makerLabel(text: "Password", size: 14 )
    
    private lazy var newpasswordTF: UITextField = {
        let textField = MakerView().makeTextField(placeholder: "Password")
        
        let showHideButton = UIButton(type: .custom)
        showHideButton.setImage(UIImage(systemName: "eye.fill"), for: .normal)
        showHideButton.tintColor = .lightGray
        showHideButton.addTarget(self, action: #selector(togglePasswordVisibility), for: .touchUpInside)
        textField.rightView = showHideButton
        textField.rightViewMode = .always
        
        
        let bottomLine = CALayer()
        bottomLine.backgroundColor = UIColor.lightGray.cgColor
        bottomLine.frame = CGRect(x: 0, y: textField.frame.height - 2, width: textField.frame.width, height: 2)
        textField.layer.addSublayer(bottomLine)
        
        return textField
    }()
    
    
    private lazy var confirmPasswordLbl = MakerView().makerLabel(text: "Confirm Password",size: 14)
    
    
    private lazy var confirmPasswordTF: UITextField = {
        let textField = MakerView().makeTextField(placeholder: "Password")
        
        let showHideButton = UIButton(type: .custom)
        showHideButton.setImage(UIImage(systemName: "eye.fill"), for: .normal)
        showHideButton.tintColor = .lightGray
        showHideButton.addTarget(self, action: #selector(togglePasswordVisibility), for: .touchUpInside)
        textField.rightView = showHideButton
        textField.rightViewMode = .always
        
        
        let bottomLine = CALayer()
        bottomLine.backgroundColor = UIColor.lightGray.cgColor
        bottomLine.frame = CGRect(x: 0, y: textField.frame.height - 2, width: textField.frame.width, height: 2)
        textField.layer.addSublayer(bottomLine)
        
        return textField
    }()
    
    private lazy var submitBtn: UIButton = {
        let button = MakerView().makerButton(
            title: "Submit",
            titleFont: UIFont.systemFont(ofSize: 20, weight: .semibold), backgroundColor: UIColor(named: "submitgreen") ?? .systemGreen, cornerRadius: 18)
        
        button.addTarget(self, action: #selector(submitBtnTapped), for: .touchUpInside)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "backColor")
        setupView()
        
    }
    
    
    private func setupView() {
        view.addSubview(backgroundImageView)
        NSLayoutConstraint.activate(
            [backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor,constant: 80),
             backgroundImageView.leadingAnchor.constraint(equalTo:view.leadingAnchor, constant: 110),
             backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -110),
             backgroundImageView.heightAnchor.constraint(equalToConstant: 140)
            ])
        
        view.addSubview(messageTF)
        NSLayoutConstraint.activate(
            [messageTF.topAnchor.constraint(equalTo: backgroundImageView.topAnchor,constant: 180),
             messageTF.leadingAnchor.constraint(equalTo:view.leadingAnchor, constant: 50),
             messageTF.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -50),
             messageTF.heightAnchor.constraint(equalToConstant: 50)
            ])
        
        
        view.addSubview(bannerView)
        NSLayoutConstraint.activate([
            bannerView.topAnchor.constraint(equalTo: view.bottomAnchor),
            bannerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            bannerView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: 0),
            bannerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 6/11),
            bannerView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            
        ])
        
        bannerView.addSubview(newpasswordLbl)
        NSLayoutConstraint.activate(
            [newpasswordLbl.topAnchor.constraint(equalTo: bannerView.topAnchor,constant: 80),
             newpasswordLbl.leadingAnchor.constraint(equalTo:view.leadingAnchor, constant: 40),
             newpasswordLbl.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -40),
             newpasswordLbl.heightAnchor.constraint(equalToConstant: 25)
            ])
        
        
        bannerView.addSubview(newpasswordTF)
        NSLayoutConstraint.activate(
            [newpasswordTF.topAnchor.constraint(equalTo: newpasswordLbl.topAnchor,constant: 25),
             newpasswordTF.leadingAnchor.constraint(equalTo:view.leadingAnchor, constant: 40),
             newpasswordTF.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -40),
             newpasswordTF.heightAnchor.constraint(equalToConstant: 50)
            ])
        
        bannerView.addSubview(confirmPasswordLbl)
        NSLayoutConstraint.activate(
            [confirmPasswordLbl.topAnchor.constraint(equalTo: newpasswordTF.topAnchor,constant: 80),
             confirmPasswordLbl.leadingAnchor.constraint(equalTo:view.leadingAnchor, constant: 40),
             confirmPasswordLbl.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -40),
             confirmPasswordLbl.heightAnchor.constraint(equalToConstant: 25)
            ])
        
        
        bannerView.addSubview(confirmPasswordTF)
        NSLayoutConstraint.activate(
            [confirmPasswordTF.topAnchor.constraint(equalTo: confirmPasswordLbl.topAnchor,constant: 25),
             confirmPasswordTF.leadingAnchor.constraint(equalTo:view.leadingAnchor, constant: 40),
             confirmPasswordTF.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -40),
             confirmPasswordTF.heightAnchor.constraint(equalToConstant: 50)
            ])
        
        bannerView.addSubview(submitBtn)
        NSLayoutConstraint.activate(
            [submitBtn.topAnchor.constraint(equalTo: confirmPasswordTF.topAnchor,constant: 100),
             submitBtn.leadingAnchor.constraint(equalTo:view.leadingAnchor, constant: 95),
             submitBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -95),
             submitBtn.heightAnchor.constraint(equalToConstant: 50)
            ])
        
        
    }
    
    
    
    
    @objc func togglePasswordVisibility() {
        newpasswordTF.isSecureTextEntry.toggle()
    }
    
    
    @objc private func submitBtnTapped() {
        check()
        checkEqual()
    }
    
    
    private func check() {
        guard let newpassword = newpasswordTF.text, !newpassword.isEmpty,
              let confirmPassword = confirmPasswordTF.text, !confirmPassword.isEmpty
        else {
            setIncorrectStyle()
            return
        }
        
        let vc = SuccessViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    private func checkEqual() {
        guard let newpassword = newpasswordTF.text,
              let confirmPassword = confirmPasswordTF.text,
              newpassword != confirmPassword
        else {
            
            return
        }
        newpasswordLbl.text = "Пароли не совпадают!"
        newpasswordLbl.textColor = .red
    }
    
    
    
    private func setIncorrectStyle() {
        newpasswordLbl.text = "Ошибка! Некоторые поля не заполнены"
        newpasswordLbl.textColor = .red
        
        newpasswordTF.layer.borderWidth = 1
        newpasswordTF.layer.borderColor = UIColor.red.cgColor
        
        confirmPasswordTF.layer.borderWidth = 1
        confirmPasswordTF.layer.borderColor = UIColor.red.cgColor
    }
    
}
