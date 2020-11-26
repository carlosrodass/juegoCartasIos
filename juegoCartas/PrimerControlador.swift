

import UIKit

class PrimerControlador: UIViewController {


    @IBOutlet weak var total: UIButton!
    @IBOutlet weak var negativeTitle: UIButton!
    @IBOutlet weak var positiveTItle: UIButton!
    @IBOutlet weak var contador: UILabel!
    var contadorNum : Int = 0
    
    
    
    @IBAction func negative(_ sender: Any) {
        //Animacion carta
        animation(carta: false)
        contadorNum = contadorNum+1
        
        //Contador
        contadorCartas()
        
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
    
    @IBAction func positive(_ sender: Any) {
        
       //Animacion carta
        animation(carta: true)
        
       //Contador
        contadorCartas()
        
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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let initNumber = "0"
        
        total.setTitle(initNumber, for: .normal)
        positiveTItle.setTitle(initNumber, for: .normal)
        negativeTitle.setTitle(initNumber, for: .normal)
     
    }
    
    
    func positiveNegative(carta:Bool) -> Int{
        if(carta == true){
            //Cogiendo el numero de la carta positiva
            let numeroPositivo = positiveTItle.title(for: .normal)
            let numeroPositivoInt = Int(numeroPositivo!)
            return numeroPositivoInt!
        }else{
            let numeroNegativo = negativeTitle.title(for: .normal)
            let numeroNegativoInt = Int(numeroNegativo!)
            return numeroNegativoInt!
        }
    }
    
    func randomFromCard(carta:Bool){
        if(carta == true){
            let randomIntDr = Int.random(in: 0..<12)
            let randomStrDr = String(randomIntDr)
            positiveTItle.setTitle(randomStrDr, for: .normal)
            
        }else{
            let randomIntIz = Int.random(in: -12 ..< -1)
            let randomStrIz = String(randomIntIz)
            negativeTitle.setTitle(randomStrIz, for: .normal)
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
        positiveTItle.setTitle("0", for: .normal)
        negativeTitle.setTitle("0", for: .normal)
        contadorNum = 0
        let contadorStr = String(contadorNum)
        contador.text = "Tu puntuación es: " + contadorStr
        
        let vc = storyboard?.instantiateViewController(identifier: "lost_vc") as! LostViewController
        present(vc, animated: true)
    }
    
    
    func animation(carta:Bool){
        
        if(carta == true){
            UIView.animate(withDuration: 0.3,
              animations: {
                self.positiveTItle.transform = CGAffineTransform(scaleX: 0.3, y: 0.3)
            },completion: { _ in
            UIView.animate(withDuration: 0.3) {
                self.positiveTItle.transform = CGAffineTransform.identity
                }
            })
        }else{
            UIView.animate(withDuration: 0.3,
              animations: {
                self.negativeTitle.transform = CGAffineTransform(scaleX: 0.3, y: 0.3)
            },completion: { _ in
            UIView.animate(withDuration: 0.3) {
                self.negativeTitle.transform = CGAffineTransform.identity
                }
            })
        }

    }
    
    
    func contadorCartas(){
        contadorNum = contadorNum+1
              
        let contadorStr = String(contadorNum)
        contador.text = "Tu puntuación es: " + contadorStr
    }
    
}
