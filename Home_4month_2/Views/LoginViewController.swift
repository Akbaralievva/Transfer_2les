//
//  LoginViewController.swift
//  Home_4month_2
//
//  Created by A LINA on 14/2/24.
//

import UIKit


class LoginViewController: UIViewController, UITextFieldDelegate {
    
    private lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "block"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    var messageTF = MakerView().makeTextField(placeholder: " ", size: 18,textColor: UIColor(named: "textColor") ?? .systemGray, backgroundColor: .systemGray, cornerRadius: 20, isEnabled: false)
    
    private lazy var textLbl = MakerView().makerLabel(text: "Trouble Logging in?", size: 25, weight: .semibold, textColor: .white)
    
    private lazy var explaintextLbl = MakerView().makerLabel(text: "Enter your email or  mobile number and we'll send you a OTP to get back into your account.", size: 13, textColor: .white, numberOfLines: 0)
    
    private  lazy var bannerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 40
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var useridLbl = MakerView().makerLabel(text: "Employee Id",size: 14)
    
    var useridTF = MakerView().makeTextField(placeholder: "ID")
    
    
    private lazy var choiceLbl: UILabel = {
        let view = UILabel()
        view.text = "enter your mobile number or Email  id"
        view.font = .systemFont(ofSize: 16, weight: .regular)
        view.textColor = .darkGray
        view.textAlignment = .center
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 17
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    private lazy var getBtn: UIButton = {
        let button = MakerView().makerButton(
            title: "Get OTP",
            titleColor: .white, titleFont: UIFont.systemFont(ofSize: 16, weight: .semibold), backgroundColor: .systemYellow, cornerRadius: 18, isEnable: false)
        
        button.addTarget(self, action: #selector(getBtnTapped), for: .touchUpInside)
        return button
    }()
    
    
    
    private lazy var submitBtn: UIButton = {
        let button = MakerView().makerButton(
            title: "Submit",
            titleFont: UIFont.systemFont(ofSize: 20, weight: .semibold), backgroundColor: UIColor(named: "submitgreen") ?? .systemGreen, cornerRadius: 18, isEnable: false)
        
        button.addTarget(self, action: #selector(submitBtnTapped), for: .touchUpInside)
        return button
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "backColor")
        setupView()
        
        getBtn.isEnabled = false
        messageTF.isEnabled = false
        submitBtn.isEnabled = false
        
        
        useridTF.delegate = self
        messageTF.delegate = self
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
        
        view.addSubview(textLbl)
        NSLayoutConstraint.activate(
            [textLbl.topAnchor.constraint(equalTo: messageTF.topAnchor,constant: 70),
             textLbl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
             textLbl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 70),
             textLbl.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -60),
             textLbl.heightAnchor.constraint(equalToConstant: 45)
            ])
        view.addSubview(explaintextLbl)
        NSLayoutConstraint.activate(
            [explaintextLbl.topAnchor.constraint(equalTo: textLbl.topAnchor, constant: 30),
             explaintextLbl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
             explaintextLbl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
             explaintextLbl.heightAnchor.constraint(equalToConstant: 60)
            ])
        
        view.addSubview(bannerView)
        NSLayoutConstraint.activate([
            bannerView.topAnchor.constraint(equalTo: view.bottomAnchor),
            bannerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            bannerView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: 0),
            bannerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 7/15),
            bannerView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            
        ])
        
        bannerView.addSubview(useridLbl)
        NSLayoutConstraint.activate([
            useridLbl.topAnchor.constraint(equalTo: bannerView.topAnchor,constant: 42),
            useridLbl.leadingAnchor.constraint(equalTo:view.leadingAnchor, constant: 24),
            useridLbl.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -24),
            useridLbl.heightAnchor.constraint(equalToConstant: 18)
            
        ])
        
        bannerView.addSubview(useridTF)
        NSLayoutConstraint.activate([
            useridTF.topAnchor.constraint(equalTo: useridLbl.topAnchor,constant: 32),
            useridTF.leadingAnchor.constraint(equalTo:view.leadingAnchor, constant: 28),
            useridTF.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -28),
            useridTF.heightAnchor.constraint(equalToConstant: 18)
        ])
        
        
        bannerView.addSubview(choiceLbl)
        NSLayoutConstraint.activate([
            choiceLbl.topAnchor.constraint(equalTo: useridTF.topAnchor,constant: 55),
            choiceLbl.leadingAnchor.constraint(equalTo:view.leadingAnchor, constant: 28),
            choiceLbl.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -28),
            choiceLbl.heightAnchor.constraint(equalToConstant: 40)
            
        ])
        
        bannerView.addSubview(getBtn)
        NSLayoutConstraint.activate([
            getBtn.topAnchor.constraint(equalTo: choiceLbl.topAnchor,constant: 50),
            getBtn.leadingAnchor.constraint(equalTo:view.leadingAnchor, constant: 270),
            getBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -28),
            getBtn.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        
        
        bannerView.addSubview(submitBtn)
        NSLayoutConstraint.activate([
            submitBtn.topAnchor.constraint(equalTo: getBtn.topAnchor,constant: 100),
            submitBtn.leadingAnchor.constraint(equalTo:view.leadingAnchor, constant: 95),
            submitBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -95),
            submitBtn.heightAnchor.constraint(equalToConstant: 40)
            
        ])
    }
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == useridTF {
            getBtn.isEnabled = !(textField.text ?? "").isEmpty
        } else if textField == messageTF {
            submitBtn.isEnabled = !(textField.text ?? "").isEmpty
        }
        return true
    }
    
    @objc private func getBtnTapped() {
        messageTF.isEnabled = true
    }
    
    @objc private func submitBtnTapped() {
        guard let userid = useridTF.text, !userid.isEmpty,
              let message = messageTF.text, !message.isEmpty else {
            return
        }
        let vc = NewPasswordViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
}



