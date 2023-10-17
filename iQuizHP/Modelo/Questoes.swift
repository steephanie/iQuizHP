//
//  Questoes.swift
//  iQuizHP
//
//  Created by Stephanie on 15/10/23.
//

import Foundation

struct Questao {
    var titulo: String
    var respostas: [String]
    var respostaCorreta: Int
}

let questoes: [Questao] = [
    Questao(
        titulo: "Qual feitiço para desarmar o seu oponente, em Harry Potter?",
        respostas: ["Expecto Patronum", "Avada Kedavra", "Expelliarmus"],
        respostaCorreta: 2),
    Questao(
        titulo: "Qual a data de nascimento de Harry Potter",
        respostas: ["31/07/1980", "28/07/1980", "31/07/1981"],
        respostaCorreta: 0),
    Questao(
        titulo: "Qual nome dos atores que fizeram Hermione, Harry Potter e Rony",
        respostas: ["Emma Watson, Rupert Grint, Daniel Radcliffe", "Daniel Radcliffe, Michael Gambom, Sara Dolly", "Richard Hary, Meleine Gambier, Eduard Figman"],
        respostaCorreta: 0),
    Questao(
        titulo: "Com quem Harry vai no baile de inverno? (Filme: Calice de fogo)",
        respostas: ["Luna Lovegood", "Gemeas Patil", "Gina Wesley"],
        respostaCorreta: 1),
]
