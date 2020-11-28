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
        
        //LIBRERIA AÑADIDA LOTTIE
        MyanimationView.animation = Animation.named("lost")
        MyanimationView.contentMode = .top
        MyanimationView.loopMode = .loop
        MyanimationView.play()
        MyanimationView.translatesAutoresizingMaskIntoConstraints = false
        justMyView.addSubview(MyanimationView)
        
        view.addSubview(justMyView)
        
        //Creando texto de perder
        let lostText = UITextView()
        lostText.text = .some("Try it again swipping down!")
        lostText.font = .boldSystemFont(ofSize: 30)
        lostText.isEditable = false
        lostText.textAlignment = .center
        lostText.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(lostText)
        
        //Creando stackview que almacena las vistas
        let lostStack = UIStackView(arrangedSubviews: [justMyView, lostText])
        lostStack.axis = .vertical
        lostStack.distribution = .fillEqually
        lostStack.alignment = .fill
        lostStack.spacing = 30
        lostStack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(lostStack)
        
        
        //Añadiendo constraints
        var const = [NSLayoutConstraint]()
        
        //Stackview vertical
        const.append(lostStack.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor))
        
        const.append(lostStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10))
        const.append(lostStack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0))
        const.append(lostStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10))
        const.append(lostStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10))
        
        //Animacion
        const.append(MyanimationView.centerXAnchor.constraint(equalTo: lostStack.centerXAnchor))
        const.append(MyanimationView.topAnchor.constraint(equalTo: lostStack.topAnchor, constant: 50))

        

        NSLayoutConstraint.activate(const)
    }
    
    

}
