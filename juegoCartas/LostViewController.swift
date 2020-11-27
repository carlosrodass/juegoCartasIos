//
//  LostViewController.swift
//  juegoCartas
//
//  Created by user177278 on 11/24/20.
//

import UIKit
import Lottie


class LostViewController: UIViewController {
    
    let MyanimationView = AnimationView()
    var justMyView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        
      
        stackViewSet()
        
    }
    
    
    func stackViewSet(){
        
        MyanimationView.animation = Animation.named("18090-a-boy-named-dino")
        MyanimationView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        MyanimationView.backgroundColor = .white
        MyanimationView.contentMode = .scaleToFill
        MyanimationView.loopMode = .loop
        MyanimationView.play()
               
        justMyView.addSubview(MyanimationView)
        justMyView.translatesAutoresizingMaskIntoConstraints = false
        
        let lostText = UITextView()
        lostText.text = .some("Try it again swipping down!")
        lostText.font = .boldSystemFont(ofSize: 30)
        lostText.translatesAutoresizingMaskIntoConstraints = false
        
        let lostStack = UIStackView(arrangedSubviews: [justMyView, lostText])
        lostStack.axis = .vertical
        lostStack.distribution = .fillProportionally
        lostStack.alignment = .fill
        lostStack.spacing = 0
        lostStack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(lostStack)
        
        
        var const = [NSLayoutConstraint]()
               
        //Stackview vertical
        const.append(lostStack.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: 0))
        const.append(lostStack.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: 0))
        
        const.append(lostStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 130))
        const.append(lostStack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0))
        const.append(lostStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 60))
        const.append(lostStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0))

        NSLayoutConstraint.activate(const)
    }
    
    

}
