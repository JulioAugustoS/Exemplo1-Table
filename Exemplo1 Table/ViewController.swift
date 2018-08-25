//
//  ViewController.swift
//  Exemplo1 Table
//
//  Created by Usuário Convidado on 25/08/2018.
//  Copyright © 2018 Julio Augusto. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var meuTableView: UITableView!
    
    
    var animais = ["Urso", "Girafa", "Elefante", "Rinoceronte", "Leão"]
    // Não é obrigatorio informar a extenção da imagem
    var fotos = ["urso.png", "girafa.png", "ele.png", "rino.png", "leao.png"]
    // é possivel ter um array de imagens
    var fotos2 = [#imageLiteral(resourceName: "urso"), #imageLiteral(resourceName: "girafa"), #imageLiteral(resourceName: "ele"), #imageLiteral(resourceName: "rino"), #imageLiteral(resourceName: "leao")]
    var pais = ["Canadá", "Africa do Sul", "Zambia", "Índia", "Tanzania", "Sudão"]
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UIImageView(image: UIImage(named: "cabecalho"))
        
        return header
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footer = UIImageView(image: UIImage(named: "rodape"))
        
        return footer
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Você selecionou o \(animais[indexPath.row])")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animais.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        celula.textLabel?.text = animais[indexPath.row]
        celula.detailTextLabel?.text = pais[indexPath.row]
        celula.imageView?.image = UIImage(named: fotos[indexPath.row])
        // Para um array de imagens nao precisa usar o UIImage(Named: para convertelo
        celula.imageView?.image = fotos2[indexPath.row]
        
        return celula
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        meuTableView.dataSource = self
        meuTableView.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

