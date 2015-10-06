programa
{
	inclua biblioteca Graficos --> g
	inclua biblioteca Util --> u
	inclua biblioteca Teclado --> t
	inclua biblioteca Matematica --> m
	inclua biblioteca Mouse --> mo
	inclua biblioteca Arquivos --> a
	inclua biblioteca Texto --> tx
	inclua biblioteca Tipos --> tp
	inclua biblioteca Sons --> sm

	const inteiro ARVORE =20
	const inteiro BLOCO  =10
	const inteiro PIRIS  =30
	const inteiro SAIDA  =40

	const inteiro CHAR_LESTE = 1
	const inteiro CHAR_NORTE =11
	const inteiro CHAR_OESTE =31
	const inteiro CHAR_SUL = 21
	
	const inteiro CERCA_HORIZONTAL=2
	const inteiro CERCA_HORIZONTAL_2 = 1
	const inteiro CERCA_HORIZONTAL_L = 3
	const inteiro CERCA_VERTICAL=5
	const inteiro CERCA_VERTICAL_2 = 4
	const inteiro CERCA_VERTICAL_L = 3
	
	
	const inteiro posicao_mapa[2] = {250, 50}
	const inteiro posicao_quadro[2] = {130, 387}
	const inteiro posicao_objetos[2] = {182, 387}

	const inteiro tamanho_objetos[2] = {67, 44}
	
	inteiro img_mapa=0, img_objects=0, img_quadro =0
	inteiro posicao_x_mouse = 0, posicao_y_mouse=0
	inteiro objeto_clicado = 0

	logico pegou_objeto=falso
	
	inteiro mapa[][] = {{0, 0, 0, 0, 0, 0, 0, 0},
					{0, 0, 0, 0, 0, 0, 0, 0},
					{0, 0, 0, 0, 0, 0, 0, 0},
					{0, 0, 0, 0, 0, 0, 0, 0},
					{0, 0, 0, 0, 0, 0, 0, 0},
					{0, 0, 0, 0, 0, 0, 0, 0},
					{0, 0, 0, 0, 0, 0, 0, 0},
					{0, 0, 0, 0, 0, 0, 0, 0}}

	inteiro mapa_char[8][8]={{0, 0, 0, 0, 0, 0, 0, 0}, 
					  	{0, 0, 0, 0, 0, 0, 0, 0}, 
					  	{0, 0, 0, 0, 0, 0, 0, 0},
					  	{0, 0, 0, 0, 0, 0, 0, 0},
					  	{0, 0, 0, 0, 0, 0, 0, 0},
					  	{0, 0, 0, 0, 0, 0, 0, 0},
					  	{0, 0, 0, 0, 0, 0, 0, 0}, 
					  	{0, 0, 0, 0, 0, 0, 0, 0}}

	inteiro mapa_cerca_horizontal[9][8] = { {0, 0, 0, 0, 0, 0, 0, 0}, 
									{0, 0, 0, 0, 0, 0, 0, 0}, 
						 			{0, 0, 0, 0, 0, 0, 0, 0},
					  	 			{0, 0, 0, 0, 0, 0, 0, 0},
					  	 			{0, 0, 0, 0, 0, 0, 0, 0},
					  	 			{0, 0, 0, 0, 0, 0, 0, 0},
					  	 			{0, 0, 0, 0, 0, 0, 0, 0},
					  	 			{0, 0, 0, 0, 0, 0, 0, 0}, 
					  	 			{0, 0, 0, 0, 0, 0, 0, 0}}

	inteiro mapa_cerca_vertical[8][9]={{0, 0, 0, 0, 0, 0, 0, 0, 0}, 
						  	 	{0, 0, 0, 0, 0, 0, 0, 0, 0}, 
						  	 	{0, 0, 0, 0, 0, 0, 0, 0, 0},
						  	 	{0, 0, 0, 0, 0, 0, 0, 0, 0},
						  	 	{0, 0, 0, 0, 0, 0, 0, 0, 0},
						  	 	{0, 0, 0, 0, 0, 0, 0, 0, 0},
					  		 	{0, 0, 0, 0, 0, 0, 0, 0, 0}, 
						  	 	{0, 0, 0, 0, 0, 0, 0, 0, 0}}

	inteiro mapa_objetos[][] = {	{0, 20, 10, 30, 40,  1},
							{0,  3,  4,  5,  6, 11},
							{3,  3,  4,  2,  6, 21},
							{0,  1,  1,  6,  6, 31}}
	
	funcao criador()
	{
		faca
		{
			pega_objeto()
			desenhar()
		}enquanto(verdadeiro)
	}

	funcao desenhar()
	{
		g.limpar()
		g.definir_cor(0x99FF66)
		desenhar_mapa()
		desenhar_quadro()
		g.renderizar()
	}

	funcao desenhar_mapa()
	{
		g.desenhar_imagem(posicao_mapa[0], posicao_mapa[1], img_mapa)
	}
	
	funcao desenhar_quadro()
	{
		g.desenhar_imagem(posicao_quadro[0], posicao_quadro[1], img_quadro)
		g.desenhar_imagem(posicao_quadro[0], posicao_quadro[1], img_objects)
	}

	funcao desenha_objeto_no_mouse()
	{
		acha_mouse()
		se(objeto_clicado==ARVORE)
		{
			g.desenhar_porcao_imagem(posicao_x_mouse-(tamanho_objetos[0]/2), posicao_y_mouse-(tamanho_objetos[1]/2), 0*tamanho_objetos[0], 0*tamanho_objetos[1], tamanho_objetos[0], tamanho_objetos[1], img_objects)
		}
		se(objeto_clicado==BLOCO)
		{
			g.desenhar_porcao_imagem(posicao_x_mouse-(tamanho_objetos[0]/2), posicao_y_mouse-(tamanho_objetos[1]/2),  0*tamanho_objetos[0], 1*tamanho_objetos[1], tamanho_objetos[0], tamanho_objetos[1], img_objects)
		}
		se(objeto_clicado==PIRIS)
		{
			g.desenhar_porcao_imagem(posicao_x_mouse-(tamanho_objetos[0]/2), posicao_y_mouse-(tamanho_objetos[1]/2), 1*tamanho_objetos[0], 0*tamanho_objetos[1], tamanho_objetos[0], tamanho_objetos[1], img_objects)
		}
		se(objeto_clicado==SAIDA)
		{
			g.desenhar_porcao_imagem(posicao_x_mouse-(tamanho_objetos[0]/2), posicao_y_mouse-(tamanho_objetos[1]/2), 1*tamanho_objetos[0], 1*tamanho_objetos[1], tamanho_objetos[0], tamanho_objetos[1], img_objects)
		}
		se(objeto_clicado==CERCA_HORIZONTAL)
		{
			g.desenhar_porcao_imagem(posicao_x_mouse-(tamanho_objetos[0]/2), posicao_y_mouse-(tamanho_objetos[1]/2), 0*tamanho_objetos[0], 0*tamanho_objetos[1], tamanho_objetos[0], tamanho_objetos[1], img_objects)
		}
		se(objeto_clicado==CERCA_HORIZONTAL_2)
		{
			g.desenhar_porcao_imagem(posicao_x_mouse-(tamanho_objetos[0]/2), posicao_y_mouse-(tamanho_objetos[1]/2),  0*tamanho_objetos[0], 1*tamanho_objetos[1], tamanho_objetos[0], tamanho_objetos[1], img_objects)
		}
		se(objeto_clicado==CERCA_HORIZONTAL_L)
		{
			g.desenhar_porcao_imagem(posicao_x_mouse-(tamanho_objetos[0]/2), posicao_y_mouse-(tamanho_objetos[1]/2), 1*tamanho_objetos[0], 0*tamanho_objetos[1], tamanho_objetos[0], tamanho_objetos[1], img_objects)
		}
		se(objeto_clicado==CERCA_VERTICAL)
		{
			g.desenhar_porcao_imagem(posicao_x_mouse-(tamanho_objetos[0]/2), posicao_y_mouse-(tamanho_objetos[1]/2), 1*tamanho_objetos[0], 1*tamanho_objetos[1], tamanho_objetos[0], tamanho_objetos[1], img_objects)
		}
		se(objeto_clicado==CERCA_VERTICAL_2)
		{
			g.desenhar_porcao_imagem(posicao_x_mouse-(tamanho_objetos[0]/2), posicao_y_mouse-(tamanho_objetos[1]/2), 0*tamanho_objetos[0], 0*tamanho_objetos[1], tamanho_objetos[0], tamanho_objetos[1], img_objects)
		}
		se(objeto_clicado==CERCA_VERTICAL_L)
		{
			g.desenhar_porcao_imagem(posicao_x_mouse-(tamanho_objetos[0]/2), posicao_y_mouse-(tamanho_objetos[1]/2),  0*tamanho_objetos[0], 1*tamanho_objetos[1], tamanho_objetos[0], tamanho_objetos[1], img_objects)
		}
		se(objeto_clicado==CHAR_LESTE)
		{
			g.desenhar_porcao_imagem(posicao_x_mouse-(tamanho_objetos[0]/2), posicao_y_mouse-(tamanho_objetos[1]/2), 1*tamanho_objetos[0], 0*tamanho_objetos[1], tamanho_objetos[0], tamanho_objetos[1], img_objects)
		}
		se(objeto_clicado==CHAR_NORTE)
		{
			g.desenhar_porcao_imagem(posicao_x_mouse-(tamanho_objetos[0]/2), posicao_y_mouse-(tamanho_objetos[1]/2), 1*tamanho_objetos[0], 1*tamanho_objetos[1], tamanho_objetos[0], tamanho_objetos[1], img_objects)
		}
		se(objeto_clicado==CHAR_SUL)
		{
			g.desenhar_porcao_imagem(posicao_x_mouse-(tamanho_objetos[0]/2), posicao_y_mouse-(tamanho_objetos[1]/2), 0*tamanho_objetos[0], 0*tamanho_objetos[1], tamanho_objetos[0], tamanho_objetos[1], img_objects)
		}
		se(objeto_clicado==CHAR_OESTE)
		{
			g.desenhar_porcao_imagem(posicao_x_mouse-(tamanho_objetos[0]/2), posicao_y_mouse-(tamanho_objetos[1]/2),  0*tamanho_objetos[0], 1*tamanho_objetos[1], tamanho_objetos[0], tamanho_objetos[1], img_objects)
		}
	}

	funcao acha_mouse()
	{
		posicao_x_mouse=mo.posicao_x()
		posicao_y_mouse=mo.posicao_y()
	}

	funcao pega_objeto()
	{
		objeto_clicado=objeto_selecionado()
	}
	
	funcao inteiro objeto_selecionado()
	{
		para(inteiro i=0; i<6; i++)
		{
			para(inteiro j=0; j<4; j++)
			{
				se(objeto_foi_clicado(mouse_esta_sobre_objeto(posicao_objetos[0]+tamanho_objetos[0]*i, posicao_objetos[1]+tamanho_objetos[1]*j, tamanho_objetos[0], tamanho_objetos[1])))
				{
					retorne mapa_objetos[i][j]
				}
			}
		}
	}
	
	funcao logico mouse_esta_sobre_objeto(inteiro posicao_x_objeto, inteiro posicao_y_objeto, inteiro tamanho_x_objeto, inteiro tamanho_y_objeto)
	{
		se(posicao_x_mouse>posicao_x_objeto e posicao_x_mouse<posicao_x_objeto+tamanho_x_objeto)
		{
			se(posicao_y_mouse>posicao_y_objeto e posicao_y_mouse<posicao_y_objeto+tamanho_y_objeto)
			{
				retorne verdadeiro
			}
		}
		retorne falso	
	}

	funcao logico objeto_foi_clicado(logico esta_no_objeto)
	{
		se(esta_no_objeto e mo.botao_pressionado(mo.BOTAO_ESQUERDO))
		{
			retorne verdadeiro
		}
		retorne falso
	}

	funcao carregar_imagens()
	{
		cadeia pasta_objetos = "./objetos/"

		img_mapa = g.carregar_imagem(pasta_objetos + "mapa_2d.png")
		img_objects = g.carregar_imagem(pasta_objetos + "objects_2d.png")
		img_quadro = g.carregar_imagem(pasta_objetos + "quadro_objetos.png")
	}
	
	funcao inicializar()
	{
		g.iniciar_modo_grafico(verdadeiro)
		g.definir_dimensoes_janela(800, 600)
		g.definir_titulo_janela("JogoLite")
	}

	funcao inicio()
	{
		carregar_imagens()
		inicializar()
		criador()	
	}


}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 3148; 
 * @DOBRAMENTO-CODIGO = [93, 102, 107, 174, 180, 185, 199, 211, 220, 229, 236];
 */