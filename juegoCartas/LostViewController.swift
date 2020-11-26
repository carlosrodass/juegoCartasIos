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
    @IBOutlet weak var lostMessage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lostMessage.text = "Try it again swipping down!"
        setUpAnimation()
        
    }
    
    func setUpAnimation(){
        MyanimationView.animation = Animation.named("18090-a-boy-named-dino")
        MyanimationView.frame = CGRect(x: 0, y: 30, width: 400, height: 400)
        MyanimationView.backgroundColor = .white
        MyanimationView.contentMode = .scaleAspectFit
        MyanimationView.loopMode = .loop
        MyanimationView.play()
        
        view.addSubview(MyanimationView)
    }

}
