

import UIKit

class PrimerControlador: UIViewController {


 
    @IBOutlet weak var contador: UILabel!
    var contadorNum : Int = 0
  
    var positive = UIButton(frame: CGRect(x: 255, y: 200, width: 150, height: 450))
    var negative = UIButton(frame: CGRect(x: 15, y: 200, width: 150, height: 450))
    var total = UIButton(frame: CGRect(x: 125, y: 400, width: 150, height: 450))

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let initNumber = "0"
        
        //Boton positivo
        
        positive.backgroundColor = .green
        positive.setTitle(initNumber, for: .normal)
        
        positive.addTarget(self, action: #selector(buttonPositive) , for: .touchUpInside)
        positive.translatesAutoresizingMaskIntoConstraints = false
        
        //self.view.addSubview(positive)
        
        
        //Boton negativo
        negative.backgroundColor = .red
        negative.setTitle(initNumber, for: .normal)
        negative.addTarget(self, action: #selector(buttonNegative) , for: .touchUpInside)
        negative.translatesAutoresizingMaskIntoConstraints = false

        //self.view.addSubview(negative)
        
        
        //Boton total
        total.backgroundColor = .blue
        total.setTitle(initNumber, for: .normal)
        total.addTarget(self, action: #selector(buttonTotal) , for: .touchUpInside)
        total.translatesAutoresizingMaskIntoConstraints = false

        //self.view.addSubview(total)
        
       
      
        stackBotones()
        
      
        
        
    }
    
    func stackBotones(){
        var buttonArray = [UIButton]()
        
        for _ in 1...3{
            buttonArray.append(negative)
            buttonArray.append(total)
            buttonArray.append(positive)
        }
        
        let stackView = UIStackView(arrangedSubviews: buttonArray)
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        
        var const = [NSLayoutConstraint]()
            
            //Positivo
        const.append(stackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: 0))
        const.append(stackView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: 0))
        
        const.append(stackView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, constant: 20))
        const.append(stackView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, constant: -200))
        
        

        NSLayoutConstraint.activate(const)
        
    }
    
    @objc func buttonPositive(sender: UIButton!) {
        
       //Animacion carta
        animation(carta: true)
        
       //Contador
        //contadorCartas()
        
        //cogiendo el numero del total y operando
        let anteriorStrP = total.title(for: .normal)
        let anteriorIntP = Int(anteriorStrP ?? "0")
        
        //Cogiendo el numero de la carta positiva
       
        let numeroPositivo = positiveNegative(carta: true)
        
        //sumando numero total y numero carta positiva
        let totallyP = operating(anterior: anteriorIntP!, random: numeroPositivo)
        
        if(totallyP > 21 || totallyP < 0){
            LostMessage()
                 
        }else{
        //Generando otro numero aleatorio y poniendolo en la carta positiva
            randomFromCard(carta: true)
            
        }
        
    }
    
    @objc func buttonNegative(sender: UIButton!) {
        //Animacion carta
        animation(carta: false)
        contadorNum = contadorNum+1
        
        //Contador
       // contadorCartas()
        
        //cogiendo el numero del total
        let anteriorStr = total.title(for: .normal)
        let anteriorInt = Int(anteriorStr ?? "0")
        
        //cogiendo el numero de la carta negativa
        let numeroNegativo = positiveNegative(carta: false)
        
        //sumando numero total y numero carta negativa
        let tottalyN = operating(anterior: anteriorInt!, random: numeroNegativo)
        
        if(tottalyN > 21 || tottalyN < 0){
            LostMessage()
        //Generando numero aleatorio carta izquierda
        }else{
            
            randomFromCard(carta: false)
        }
    }
    
    @objc func buttonTotal(sender: UIButton!) {
        print("Presionado")
    }
     
    
    func positiveNegative(carta:Bool) -> Int{
        if(carta == true){
            //Cogiendo el numero de la carta positiva
            let numeroPositivo = positive.title(for: .normal)
            let numeroPositivoInt = Int(numeroPositivo!)
            return numeroPositivoInt!
        }else{
            let numeroNegativo = negative.title(for: .normal)
            let numeroNegativoInt = Int(numeroNegativo!)
            return numeroNegativoInt!
        }
    }
    
    func randomFromCard(carta:Bool){
        if(carta == true){
            let randomIntDr = Int.random(in: 0..<12)
            let randomStrDr = String(randomIntDr)
            positive.setTitle(randomStrDr, for: .normal)
            
        }else{
            let randomIntIz = Int.random(in: -12 ..< -1)
            let randomStrIz = String(randomIntIz)
            negative.setTitle(randomStrIz, for: .normal)
        }
    }
    
    
    func operating(anterior:Int, random:Int) -> Int{
        let totalIntP = anterior + random
        let totalStrP = String(totalIntP)
        
        //poniendo resultado de la operacion en el total
        total.setTitle(totalStrP, for: .normal)
        
        return totalIntP
     
    }
    
    
    func LostMessage()
    {
        total.setTitle("0", for: .normal)
        positive.setTitle("0", for: .normal)
        negative.setTitle("0", for: .normal)
        contadorNum = 0
        //let contadorStr = String(contadorNum)
       // contador.text = "Tu puntuación es: " + contadorStr
        
        let vc = storyboard?.instantiateViewController(identifier: "lost_vc") as! LostViewController
        present(vc, animated: true)
    }
    
    
    func animation(carta:Bool){
        
        if(carta == true){
            UIView.animate(withDuration: 0.3,
              animations: {
                self.positive.transform = CGAffineTransform(scaleX: 0.3, y: 0.3)
            },completion: { _ in
            UIView.animate(withDuration: 0.3) {
                self.positive.transform = CGAffineTransform.identity
                }
            })
        }else{
            UIView.animate(withDuration: 0.3,
              animations: {
                self.negative.transform = CGAffineTransform(scaleX: 0.3, y: 0.3)
            },completion: { _ in
            UIView.animate(withDuration: 0.3) {
                self.negative.transform = CGAffineTransform.identity
                }
            })
        }

    }
    
    /*
    func contadorCartas(){
        contadorNum = contadorNum+1
              
        let contadorStr = String(contadorNum)
        contador.text = "Tu puntuación es: " + contadorStr
    }
    */
}
