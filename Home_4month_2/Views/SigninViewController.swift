//
//  SigninViewController.swift
//  Home_4month_2
//
//  Created by A LINA on 13/2/24.
//

import UIKit

class SigninViewController: UIViewController {
    
    private lazy var backgroundImageView: UIImageView = {
        
        let imageView = UIImageView(image: UIImage(named: "backGd_boy"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    private lazy var textLbl = MakerView().makerLabel(text: "Welcome Back", size: 34, weight: .bold, textColor: .white )
    
    private lazy var continueTextLbl = MakerView().makerLabel(text: "Sign in to continue", size: 20, textColor: UIColor(named: "textColor") ?? .lightGray, numberOfLines: 0 )
    
    
    
    private  lazy var bannerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 40
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var emailLbl = MakerView().makerLabel(text:  "Employee Id / Email")
    
    private lazy var emailTF = MakerView().makeTextField(placeholder: "Email" )
    
    private lazy var passwordLbl = MakerView().makerLabel(text:  "Password")
    
    private lazy var passwordTF: UITextField = {
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
    
    private lazy var fgtpasswordBtn: UIButton = {
        let view = MakerView().makerButton(title: "Forgot Password?", titleColor: .tintColor)
        view.addTarget(self, action: #selector(forgotPasswordButtonTapped), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    private lazy var checkBtn: UIButton = {
        let view = UIButton(type: .custom)
        let image = UIImage(systemName: "square")
        view.setImage(image, for: .normal)
        view.tintColor = .black
        view.setImage(UIImage(systemName: "checkmark.square.fill"), for: .selected)
        view.tintColor = .tintColor
        view.addTarget(self, action: #selector(checkBtnTapped), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    
    private lazy var checkLbl = MakerView().makerLabel(text: "Remeber Me", size: 20, weight: .semibold, textColor: .black)
    
    private lazy var signinBtn: UIButton = {
        let button = MakerView().makerButton(title: "Sign In",
                                             titleFont: .systemFont(ofSize: 20, weight: .semibold),backgroundColor: UIColor(named: "buttoncolor") ?? .blue, cornerRadius: 18)
        button.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        return button
    }()
    
    
    
    private lazy var signupLbl = MakerView().makerLabel(text: "Don’t have an Account?", size: 16, textColor: .black )
    
    
    private lazy var signupBtn: UIButton = {
        let button = MakerView().makerButton(title: "Sign Up", titleColor: .tintColor, titleFont: .systemFont(ofSize: 16, weight: .semibold) )
        button.addTarget(self, action: #selector(signupBtnTapped), for: .touchUpInside)
        return button
    }()
    
    
    private lazy var backgroundBottomImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "bottomBackground"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "backColor")
        checkBtn.isSelected = false
        setupView()
        
    }
    
    
    
    
    
    
    
    
    private func setupView() {
        
        view.addSubview(backgroundImageView)
        NSLayoutConstraint.activate(
            [backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor,constant: 45),
             backgroundImageView.leadingAnchor.constraint(equalTo:view.leadingAnchor, constant: 10),
             backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -10),
             backgroundImageView.heightAnchor.constraint(equalToConstant: 256 )
            ])
        
        
        view.addSubview(textLbl)
        NSLayoutConstraint.activate([
            textLbl.topAnchor.constraint(equalTo: backgroundImageView.topAnchor,constant: 240),
            textLbl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            textLbl.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -15),
            textLbl.heightAnchor.constraint(equalToConstant: 48 )
        ])
        view.addSubview(continueTextLbl)
        NSLayoutConstraint.activate([
            continueTextLbl.topAnchor.constraint(equalTo: textLbl.topAnchor, constant: 50),
            continueTextLbl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            continueTextLbl.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -15),
            continueTextLbl.heightAnchor.constraint(equalToConstant: 25 )
        ])
        
        view.addSubview(bannerView)
        NSLayoutConstraint.activate([
            bannerView.topAnchor.constraint(equalTo: view.bottomAnchor),
            bannerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            bannerView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: 0),
            bannerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 4/7),
            bannerView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            
        ])
        
        ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        
        bannerView.addSubview(emailLbl)
        NSLayoutConstraint.activate([
            emailLbl.topAnchor.constraint(equalTo: bannerView.topAnchor,constant: 50),
            emailLbl.leadingAnchor.constraint(equalTo: bannerView.leadingAnchor, constant: 23),
            emailLbl.trailingAnchor.constraint(equalTo: bannerView.trailingAnchor,constant: -23),
            emailLbl.heightAnchor.constraint(equalToConstant: 15 )
        ])
        
        bannerView.addSubview(emailTF)
        NSLayoutConstraint.activate([
            emailTF.topAnchor.constraint(equalTo: emailLbl.topAnchor,constant: 15),
            emailTF.leadingAnchor.constraint(equalTo: bannerView.leadingAnchor, constant: 23),
            emailTF.trailingAnchor.constraint(equalTo: bannerView.trailingAnchor,constant: -23),
            emailTF.heightAnchor.constraint(equalToConstant: 45 )
        ])
        
        
        bannerView.addSubview(passwordLbl)
        NSLayoutConstraint.activate([
            passwordLbl.topAnchor.constraint(equalTo: emailTF.topAnchor,constant: 50),
            passwordLbl.leadingAnchor.constraint(equalTo: bannerView.leadingAnchor, constant: 23),
            passwordLbl.trailingAnchor.constraint(equalTo: bannerView.trailingAnchor,constant: -23),
            passwordLbl.heightAnchor.constraint(equalToConstant: 15)
        ])
        
        bannerView.addSubview(passwordTF)
        NSLayoutConstraint.activate([
            passwordTF.topAnchor.constraint(equalTo: passwordLbl.topAnchor,constant: 15),
            passwordTF.leadingAnchor.constraint(equalTo: bannerView.leadingAnchor, constant: 23),
            passwordTF.trailingAnchor.constraint(equalTo: bannerView.trailingAnchor,constant: -23),
            passwordTF.heightAnchor.constraint(equalToConstant: 45 )
        ])
        
        bannerView.addSubview(fgtpasswordBtn)
        NSLayoutConstraint.activate([
            fgtpasswordBtn.topAnchor.constraint(equalTo: passwordTF.topAnchor,constant: 50),
            fgtpasswordBtn.trailingAnchor.constraint(equalTo: bannerView.trailingAnchor,constant: -23),
            fgtpasswordBtn.heightAnchor.constraint(equalToConstant: 20 )
        ])
        
        bannerView.addSubview(checkBtn)
        NSLayoutConstraint.activate([
            checkBtn.topAnchor.constraint(equalTo: fgtpasswordBtn.topAnchor,constant: 47),
            checkBtn.leadingAnchor.constraint(equalTo: bannerView.leadingAnchor, constant: 25),
            checkBtn.heightAnchor.constraint(equalToConstant: 30 )
        ])
        
        bannerView.addSubview(checkLbl)
        NSLayoutConstraint.activate([
            checkLbl.topAnchor.constraint(equalTo: fgtpasswordBtn.topAnchor,constant: 50),
            checkLbl.leadingAnchor.constraint(equalTo: checkBtn.leadingAnchor, constant: 32),
            checkLbl.trailingAnchor.constraint(equalTo: bannerView.trailingAnchor,constant: -23),
            checkLbl.heightAnchor.constraint(equalToConstant: 15 )
        ])
        
        bannerView.addSubview(signinBtn)
        NSLayoutConstraint.activate([
            signinBtn.topAnchor.constraint(equalTo: checkLbl.topAnchor,constant: 80),
            signinBtn.leadingAnchor.constraint(equalTo: bannerView.leadingAnchor, constant: 95),
            signinBtn.trailingAnchor.constraint(equalTo: bannerView.trailingAnchor,constant: -95),
            signinBtn.heightAnchor.constraint(equalToConstant: 45)
        ])
        
        bannerView.addSubview(signupLbl)
        NSLayoutConstraint.activate([
            signupLbl.topAnchor.constraint(equalTo: signinBtn.topAnchor,constant: 100),
            signupLbl.leadingAnchor.constraint(equalTo: bannerView.leadingAnchor, constant: 23),
            signupLbl.trailingAnchor.constraint(equalTo: bannerView.trailingAnchor, constant: -23),
            signupLbl.heightAnchor.constraint(equalToConstant: 15 )
        ])
        
        bannerView.addSubview(signupBtn)
        NSLayoutConstraint.activate([
            signupBtn.topAnchor.constraint(equalTo: signinBtn.topAnchor,constant: 100),
            // signupBtn.leadingAnchor.constraint(equalTo: signupLbl.leadingAnchor, constant: 80),
            signupBtn.trailingAnchor.constraint(equalTo: bannerView.trailingAnchor, constant: -120),
            signupBtn.heightAnchor.constraint(equalToConstant: 15 )
        ])
        
        
        
        view.addSubview(backgroundBottomImageView)
        NSLayoutConstraint.activate(
            [backgroundBottomImageView.topAnchor.constraint(equalTo: signinBtn.topAnchor,constant: 45),
             backgroundBottomImageView.leadingAnchor.constraint(equalTo: bannerView.leadingAnchor, constant: 0),
             backgroundBottomImageView.trailingAnchor.constraint(equalTo: bannerView.trailingAnchor,constant: 0),
             backgroundBottomImageView.heightAnchor.constraint(equalToConstant: 150),
             backgroundBottomImageView.bottomAnchor.constraint(equalTo: bottomLayoutGuide.bottomAnchor, constant: 0)
            ])
        
    }
    
    
    @objc private func signupBtnTapped() {
        
        //let email = emailTF.text
        let vc = SignupViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
    @objc private func chheckBtnTapped() {
        print("Button tapped")
        checkBtn.isSelected.toggle()
    }
    
    @objc func nextButtonTapped() {
        guard check() else {
            return
        }
    }
    
    
    @objc func togglePasswordVisibility() {
        passwordTF.isSecureTextEntry.toggle()
    }
    
    @objc private func checkBtnTapped() {
        checkBtn.isSelected.toggle()
    }
    
    
    private func check() -> Bool {
        guard let password = passwordTF.text, !password.isEmpty,
              let email = emailTF.text, !email.isEmpty else {
            setIncorrectStyle()
            continueTextLbl.text = "Ошибка! Некоторые поля не заполнены"
            return false
        }
        
        let vc = SuccessViewController()
        navigationController?.pushViewController(vc, animated: true)
        return true
    }
    
    private func setIncorrectStyle() {
        continueTextLbl.text = "Ошибка!"
        continueTextLbl.textColor = .red
        
        emailTF.layer.borderWidth = 1
        emailTF.layer.borderColor = UIColor.red.cgColor
        
        passwordTF.layer.borderWidth = 1
        passwordTF.layer.borderColor = UIColor.red.cgColor
        
    }
    
    
    @objc private func forgotPasswordButtonTapped() {
        
        let vc = LoginViewController()
        
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
    
}



