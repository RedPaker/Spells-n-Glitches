function d_create_dialog(_messages, _alvo = noone){
    if (instance_exists(obj_dialogo)) return;

    var _inst = instance_create_depth(0,0,0, obj_dialogo);
    _inst.messages = _messages;
    _inst.current_message = 0;

    if (_alvo != noone) {
        _inst.alvo_x = _alvo.x;
        _inst.alvo_y = _alvo.y - 16;
        _inst.tem_alvo = true;
    }
}

function d_select_dialog(_is){
    return_value = -1;
    switch (_is) {
        case "welcome_dialog":
            return_value = [
                {
                    name: "U+003A",
                    msg: "Ufa... finalmente acordou,"
                },
                {
                    name: "U+003A",
                    msg: "Você está bem?"
                },
                {
                    name: "U+003A",
                    msg: "Eu te vi desmaiado lá fora perto de uma arvore e te trouxe para dentro."
                },
                {
                    name: "0x43",
                    msg: "O-obrigado."
                },
                {
                    name: "U+003A",
                    msg: "Aquela explosão expalhou uma infecção viral por todo o mundo, mas parece que ela afeta apenas computatores mais recentes..."
                },
                {
                    name: "U+003A",
                    msg: "Está tudo um caos. Vamos para a Vila Byte atras de sobreviventes."
                },
                {
                    name: "0x43",
                    msg: "O-okay"
                }
            ];
            break;

        case "Porteiro_dialog":
            return_value = [
                {
                    name: "Porteiro",
                    msg: "Você é muito corajoso, sabia?"
                },
                {
                    name: "Porteiro",
                    msg: "Mas não acho que seja forte o suficiente para enfrentar oque esta atras deste portão..."
                },
                {
                    name: "Porteiro",
                    msg: "Eu tranquei os portões da vila para impedir oque seja aquilo de invadir a vila"
                },
                {
                    name: "Porteiro",
                    msg: "Não posso permitir ninguem passar daqui."
                },
                {
                    name: "Porteiro",
                    msg: "O problema que eu perdi o papel que incluia a senha para a abertura dos portões para enviar na torre de sinal:"
                },
                {
                    name: "0x43",
                    msg: "Hmmm..."
                },
                {
                    name: "Porteiro",
                    msg: "Vá embora e se proteja dessa infecção."
                },
                {
                    name: "0x43",
                    msg: "..."
                }
            ];
            break;
        case "tutorial_binario_dialog":
            return_value = [
                {
                    name: "0x43",
                    msg: "???"
                },
                {
                    name: "U+003A",
                    msg: "Você terá que digitar a senha  em binário."
                },
                {
                    name: "U+003A",
                    msg: "ESCUTE COM BASTANTE ATENÇÃO!!!!!"
                },
                {
                    name: "U+003A",
                    msg: "Um número em binário é um número na base 2, ou seja, 0 e 1."
                },
                {
                    name: "U+003A",
                    msg: "Um número na base 10 é o número ao qual estamos acostumados."
                },
                {
                    name: "U+003A",
                    msg: "Por exemplo, 44."
                },
                {
                    name: "U+003A",
                    msg: "Para transformar em binário precisamos fazer a divisão de 44 por 2."
                },
                {
                    name: "U+003A",
                    msg: "O resultado é 22 e o resto é 0. LEMBRE DO RESTO!!!!!!"
                },
                {
                    name: "U+003A",
                    msg: "Faça o mesmo com 22. O resultado será 11 e o resto 0."
                },
                {
                    name: "U+003A",
                    msg: "Com o 11, faça o mesmo: o resultado será 5 e o resto 1."
                },
                {
                    name: "U+003A",
                    msg: "Repita a divisão até o resultado ser zero, anotando os restos."
                },
                {
                    name: "U+003A",
                    msg: "Por fim, pegue os restos e escreva o número em binário. COMECE A ESCREVER PELO RESTO DA ÚLTIMA DIVISÃO!"
                },
                {
                    name: "0x43",
                    msg: "Juntando os restos, 44 em binário é 101100."
                },
                {
                    name: "U+003A",
                    msg: "Faça isso com 183. Divida por dois, anote os restos, e monte o número começando pelo último resto."
                }
            ];
            break;

        case "Estranho_ram_dialog":
            return_value = [
                {
                    name: "Estranho",
                    msg: "QuE FoII?"
                },
                {
                    name: "0x43",
                    msg: "... Nada não."
                },
                {
                    name: "Estranho",
                    msg: "..."
                },
                {
                    name: "0x43",
                    msg: "..."
                },
                {
                    name: "Estranho",
                    msg: "..."
                },
                {
                    name: "0x43",
                    msg: "Tchau."
                },
                {
                    name: "Estranho",
                    msg: "VEm AqUI!!!."
                },
                {
                    name: "Estranho",
                    msg: "Tá VeNDo EsSas MemoRIaS? VaI Lá e CaLIBRA elAs PRa mIm"
                },
                {
                    name: "0x43",
                    msg: "Por quê?"
                },
                {
                    name: "Estranho",
                    msg: "..."
                },
                {
                    name: "0x43",
                    msg: "..."
                },
                {
                    name: "Estranho",
                    msg: "..."
                },
                {
                    name: "0x43",
                    msg: "..."
                },
                {
                    name: "Estranho",
                    msg: "VAAAAAAIII LOGOOOOOoooooooOOOOOOOOOOO!!!!!!!!!!!!!!!!"
                },
                {
                    name: "0x43",
                    msg: "TÁ BOOOM!!!!!"
                }
            ];
            break;

        case "binario_certo":
            return_value = [
                {
                    name: "U+003A",
                    msg: "Boa! Isso deve ter aberto o portão. Vamos lá embaixo ver se deu certo."
                }
            ];
            break;

        case "anciao_dialog":
            return_value = [
                {
                    name: "Ancião",
                    msg: "Oi, meu filho, o que te traz à casa dessa velha lataria?"
                },
                {
                    name: "0x43",
                    msg: "Esta acontecendo um apocalipse no exterior e estou tentando impedi-lo."
                },
                {
                    name: "Ancião",
                    msg: "Eu tenho algo que pode te ajudar. É um artefato que invoca poderes inacreditáveis."
                },
                {
                    name: "0x43",
                    msg: "Serio..?"
                },
                {
                    name: "Ancião",
                    msg: "Ho ho ho... Claro que sim. Mas eu perdi as páginas deles quando moleque, o MSN ainda era famoso..."
                },
                {
                    name: "0x43",
                    msg: "Oque eu faço?"
                },
                {
                    name: "Ancião",
                    msg: "Ache as páginas, monte os programas e faça churrasquinho desses vírus."
                },
                {
                    name: "0x43",
                    msg: "Obrigado!"
                }
            ];
            break;
        case "Enter55":
            return_value = [
                {
                    name: "0x43",
                    msg: "!!!!!!!!!!!"
                },
                {
                    name: "U+003A",
                    msg: "!!!!!!!!!!!!!!!"
                },
                {
                    name: "U+003A",
                    msg: "RAPIDO ALI UM MOUSE!"
                },
                {
                    name: "0x43",
                    msg: "O que aconteceu aqui?.."
                }
            ];
            break
        case "VentanaMedo":
            return_value = [
                {
                    name: "Ventana",
                    msg: "OQUE ESTA ACONTENCENDO??????"
                }
            ];
            break;
        case "VentanaSob":
            return_value = [
                {
                    name: "Ventana",
                    msg: ":sob:"
                }
            ];
            break;
        case "FlowerTalk":
            return_value = [
                {
                    name: "Flower",
                    msg: "Aparentemente estas criaturas infectam apenas computadores mais modernos."
                },
                {
                    name: "Flower",
                    msg: "Pegue isto e vá no meu lugar, com certeza eles não podem te infectar"
                },
                {
                    name: "0x43",
                    msg: "Ouch :("
                },
            ];
            break;
        case "FlowerGo":
            return_value = [
                {
                    name: "Flower",
                    msg: "Vá logo!"
                },
                {
                    name: "0x43",
                    msg: ">:("
                },
            ];
            break;
        case "VentanaShake":
            return_value = [
                {
                    name: "0x43",
                    msg: "Você ta bem?"
                },
                {
                    name: "0x43",
                    msg: "*tremendo*"
                },
            ];
            break;
        default:
            return_value = [
                {
                    name: "0x43",
                    msg: "..."
                }
            ]
            break
    }

    return return_value;
}

global.char_colors = {
    "U+003A": c_red,
    "0x43": c_blue,
    "Morador": c_lime,
    "Ancião": c_yellow,
    "Porteiro": c_orange,
    "Ventana": c_black,
    "Flower": c_black,
    "???": c_gray,
};

global.sprites = {
    "U+003A": spr_speak_asterisco,
    "0x43": spr_speak_C,
    "Porteiro":spr_green,
    "Ancião": spr_speak_1,
    "Morador": spr_magenta,
    "Ventana": spr_speak_ventana,
    "Flower": spr_speak_flower,
    "???": spr_narrador
};

function d_explicar_bloco(_obj) {
    switch (object_get_name(_obj)) {
        case "obj_bloco_print":
            return [
                { name: "U+003A", msg: "Esse é o bloco PRINT!" },
                { name: "U+003A", msg: "Ele mostra uma mensagem no terminal. Use para saber o que o programa esta fazendo." }
            ];

        case "obj_bloco_while":
            if (obj_spellbook.pagina_atual != 5) {
                return [
                    { name: "U+003A", msg: "Esse é o WHILE, o bloco de repetição." },
                    { name: "U+003A", msg: "Tudo que ficar dentro dele se repete enquanto a condição for verdadeira." }
                ];
            } else {
                return [
                    { name: "U+003A", msg: "Esse é o FOR, o bloco de repetição." },
                    { name: "U+003A", msg: "Repete o que está dentro certa quantidade de vezes (range)." }
                ];
            }

        case "obj_bloco_if":
            return [
                { name: "U+003A", msg: "Esse é o IF." },
                { name: "U+003A", msg: "Ele só executa o que está dentro se a condição for verdadeira." }
            ];

        case "obj_bloco_import_time":
            return [
                { name: "U+003A", msg: "IMPORT TIME traz as funções de tempo para o programa." }
            ];

        case "obj_bloco_timesleep":
            return [
                { name: "U+003A", msg: "SLEEP faz o programa esperar um pouco antes de continuar." }
            ];
    }

    return undefined;
}

function d_intro_livro(_passo) {
    switch (_passo) {
        case 0: return [
            { name: "U+003A", msg: "Oi! Que bom que você abriu o livro de feitiços!" },
            { name: "U+003A", msg: "Aqui os feitiços são escritos em PYTHON, uma linguagem de programação de verdade." },
            { name: "U+003A", msg: "Em vez de digitar, você monta o código encaixando blocos." }
        ];

        case 1: return [
            { name: "U+003A", msg: "Essa área é o seu código. Cada linha recebe um bloco." },
            { name: "U+003A", msg: "O programa é lido de cima para baixo, uma linha de cada vez." }
        ];

        case 2: return [
            { name: "U+003A", msg: "Os blocos MAIORES são as FUNÇÕES." },
            { name: "U+003A", msg: "Eles dizem ao programa O QUE fazer." }
        ];

        case 3: return [
            { name: "U+003A", msg: "Os blocos MENORES são as VARIÁVEIS e os NÚMEROS." },
            { name: "U+003A", msg: "Eles dizem COM O QUE a função vai trabalhar." }
        ];

        case 4: return [
            { name: "U+003A", msg: "Quando terminar, aperte ENTER para testar o programa." },
            { name: "U+003A", msg: "O LOG te mostra em qual linha está o erro." }
        ];

        case 5: return [
            { name: "U+003A", msg: "Se ficar com dificuldade, é só abrir a aba AJUDA." },
            { name: "U+003A", msg: "Boa sorte!" }
        ];
    }

    return undefined;
}

global.cutscene_ativa = false;