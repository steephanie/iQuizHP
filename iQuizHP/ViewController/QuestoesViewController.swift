//
//  QuestoesViewController.swift
//  iQuizHP
//
//  Created by Stephanie on 15/10/23.
//

import UIKit

class QuestionViewController: UIViewController {
    
    var pontuacao = 0
    var numeroQuestao = 0

    @IBOutlet weak var tituloQuestaoLabel: UILabel!
    @IBOutlet var botoesRespostas: [UIButton]!
    
    @IBAction func respostaBotaoPressionado(_ sender: UIButton) {
        // validacao usuario acertou ou nao a questao
        let usuarioAcertouResposta = questoes[numeroQuestao].respostaCorreta == sender.tag
        // validacao de cores acerto e erro
        if usuarioAcertouResposta {
            pontuacao += 1
            sender.backgroundColor = UIColor(red: 11/255, green: 151/255, blue: 53/255, alpha: 1.0)
            print("O usuario acertou!")
        } else {
            sender.backgroundColor = UIColor(red: 211/255, green: 17/255, blue: 17/255, alpha: 1.0)
            print("O usuario errou!")
        }
        // tempo de exibicao da resposta
        if numeroQuestao < questoes.count - 1 {
            numeroQuestao += 1
            Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(configurarQuestao), userInfo: nil, repeats: false)
        } else {
            navegaParaTelaDesempenho()
        }
        
    }
    // func de navegacao
    func navegaParaTelaDesempenho() {
        performSegue(withIdentifier: "irParaTelaDesempenho", sender: nil)
    }
    
    override func viewDidLoad() {
        //minha view principal da tela
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configurarLayout()
        configurarQuestao()
    }
    
    // onfiguracoes do meu layout do titulo ( titulo principal e borderRadius botao )
    func configurarLayout() {
        navigationItem.hidesBackButton = true
        tituloQuestaoLabel.numberOfLines = 0
        tituloQuestaoLabel.textAlignment = .center
        for botao in botoesRespostas {
            botao.layer.cornerRadius = 12.0
        }
    }
    
    // configuracoes do meu layout de resposta, comportamento do botao
    @objc func configurarQuestao() {
        tituloQuestaoLabel.text = questoes[numeroQuestao].titulo
        for botao in botoesRespostas {
            let tituloBotao = questoes[numeroQuestao].respostas[botao.tag]
            botao.setTitle(tituloBotao, for: .normal)
            botao.backgroundColor = UIColor(red: 116/255, green: 50/255, blue: 255/255, alpha: 1.0)
        }
    }
    // Override e um metodo que sobrescrever um metodo da class pai
    // Realizar parametro entre as telas, preparando a navegacao.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //Guard let -> desembrulha um opcional e faz com que haja a preparação da tela DesempenhoViewController antes de ser chamada, passando os parâmetros necessários.
        guard let desempenhoVC = segue.destination as? DesempenhoViewController else { return }
        desempenhoVC.pontuacao = pontuacao
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
