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

		const inteiro DIREITA = 1
		const inteiro DESCE = 2
		const inteiro ESQUERDA = 3
		const inteiro SOBE = 4
		
		const inteiro leste = 3
		const inteiro sul = 1
		const inteiro oeste = 2
		const inteiro norte = 0

		const inteiro COMANDO_DIREITA = 1
		const inteiro COMANDO_DESCE = 2
		const inteiro COMANDO_ESQUERDA = 3
		const inteiro COMANDO_SOBE = 4
		const inteiro BOTAO_PLAY = 5
		const inteiro BOTAO_RESET = 6
		const inteiro BOTAO_EXCLUIR =7
		
		const real quantoanda = 1.0

		const real tamtile[2]={31.0, 31.0}
		const real tam_mat_comandos[2]={87.5, 51.5}
		const real tam_comandos[2]={70.0, 41.0}
		const real tam_botoes[2]={32.0, 38.0}
		const real tam_quadro_programavel[2]={518.0, 164.0}
		const real tam_setas[2]={20.0, 15.0}
		const inteiro tam_matriz_quadro[2]={22, 7}

		const real posicao_mapa[2]={367.0, 0.0}
		const real posicao_mapa_cerca[2]={403.0, 48.0}
		const real posicao_mapa_char[2]={367.0, 0.0}
		const real posicao_quadro[2]={23.0, 387.0}
		const real posicao_comandos[2]={595.0, 436.0}
		const real posicao_botoes[3]={420.0, 484.0, 557.0}
		const real posicao_setas[3]={539.0, 390.0, 436.0}

	inteiro imagem_boyf = 0, imagem_boya = 0, imagem_girlf = 0, imagem_girla = 0, imagem_boy=0, imagem_exemplo=0
	inteiro img_mapa = 0, img_objects = 0, img_quadros =0, img_quadros_adjacentes=0,  img_comandos = 0,img_comandos_menor=0, img_botoes=0, img_setas=0, img_botao_excluir=0
	real posicao_objeto_x = 0.0, posicao_objeto_y= 0.0, posicao_isometrica_objeto_x = 0.0, posicao_isometrica_objeto_y= 0.0
	inteiro i =0, j=0
	inteiro char_posicao_original_x_matriz=0, char_posicao_original_y_matriz=0
	real char_x=0.0, char_y=0.0, char_isometrico_x=0.0, char_isometrico_y=0.0
	inteiro posicao_matx=0, posicao_maty=0
	inteiro indice_imagem=0, indice_imagem_exemplo=0
	real incrementovertical=0.0, incrementohorizontal=0.0
	real fator_mexer_quadro=0.0, fator_mexer_matriz_comandos=0.0
	inteiro caminhochar[] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
						0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
						0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
						0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
						0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
						0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
						0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
						0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
						0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
						0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
						0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
						0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
						0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
						0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
						0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
						0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
						0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
						0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
						0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
						0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
						0, 0}
	inteiro lado=0
	logico lado_ocupado=falso
	inteiro imagemporturnos=1, imagemporturnos_exemplo=1
	inteiro direcao=leste
	inteiro direcao_exemplo=leste
	logico pegou_comando=falso
	inteiro objeto_clicado=0
	logico pode_andar=falso
	logico comecou_a_rodar=falso
	logico chegou_no_fim=falso

	inteiro posicao_x_mouse=0, posicao_y_mouse=0

	inteiro sprite[4][10]={	{32,  80, 56,  80, 86,  80, 120,  80, 153,  80},
						{32, 160, 56, 160, 86, 160, 120, 160, 153, 160},
						{32, 236, 56, 236, 86, 236, 120, 236, 153, 236},
						{32, 317, 56, 317, 86, 317, 120, 317, 153, 317}}
							

	inteiro mapa[8][8]={{0, 0, 1, 1, 0, 0, 0, 1}, 
					{0, 0, 0, 0, 0, 0, 0, 0}, 
					{0, 2, 0, 0, 0, 0, 0, 0},
					{0, 1, 0, 0, 0, 1, 0, 0},
					{0, 1, 0, 2, 0, 0, 0, 0},
					{0, 1, 0, 0, 0, 0, 0, 0},
					{0, 3, 0, 0, 2, 0, 0, 0}, 
					{0, 0, 0, 0, 0, 0, 0, 1}} 

	inteiro mapa_char[8][8]={{0, 0, 0, 0, 0, 0, 0, 0}, 
					  	{0, 0, 0, 0, 0, 0, 0, 0}, 
					  	{0, 0, 0, 0, 0, 0, 0, 0},
					  	{0, 0, 0, 0, 0, 0, 0, 0},
					  	{0, 0, 0, 0, 0, 0, 0, 0},
					  	{0, 0, 0, 0, 0, 0, 0, 0},
					  	{0, 0, 0, 0, 0, 0, 0, 0}, 
					  	{1, 0, 0, 0, 0, 0, 0, 0}}

	inteiro mapa_cerca_horizontal[9][8] = { {0, 0, 0, 0, 0, 0, 0, 0}, 
					  	 			{0, 1, 0, 0, 1, 0, 0, 0}, 
					  	 			{0, 0, 0, 0, 0, 0, 0, 0},
					  	 			{0, 0, 0, 0, 0, 0, 0, 0},
					  	 			{0, 0, 0, 0, 0, 0, 0, 0},
					  	 			{0, 0, 0, 0, 0, 0, 0, 0},
					  	 			{0, 0, 0, 0, 0, 0, 0, 0},
					  	 			{0, 0, 3, 0, 0, 0, 0, 0}, 
					  	 			{0, 0, 0, 0, 0, 0, 0, 0}}

	inteiro mapa_cerca_vertical[8][9] = { 	{0, 0, 0, 0, 0, 0, 0, 0, 0}, 
						  	 		{0, 0, 0, 0, 0, 0, 6, 0, 0}, 
						  	 		{0, 0, 0, 0, 0, 0, 0, 0, 0},
						  	 		{0, 0, 0, 0, 0, 0, 0, 0, 0},
						  	 		{4, 0, 0, 0, 0, 0, 0, 0, 0},
						  	 		{0, 0, 0, 0, 0, 0, 0, 0, 0},
					  		 		{5, 0, 0, 0, 0, 0, 0, 0, 0}, 
						  	 		{0, 0, 0, 0, 0, 0, 0, 0, 0}}

	inteiro mat_pos_quadro_programavel[][]={{0, 0, 0, 0, 0, 0, 0},
									{0, 0, 0, 0, 0, 0, 0},
									{0, 0, 0, 0, 0, 0, 0},
									{0, 0, 0, 0, 0, 0, 0},
									{0, 0, 0, 0, 0, 0, 0},
									{0, 0, 0, 0, 0, 0, 0},
									{0, 0, 0, 0, 0, 0, 0},
									{0, 0, 0, 0, 0, 0, 0},
									{0, 0, 0, 0, 0, 0, 0},
									{0, 0, 0, 0, 0, 0, 0},
									{0, 0, 0, 0, 0, 0, 0},
									{0, 0, 0, 0, 0, 0, 0},
									{0, 0, 0, 0, 0, 0, 0},
									{0, 0, 0, 0, 0, 0, 0},
									{0, 0, 0, 0, 0, 0, 0},
									{0, 0, 0, 0, 0, 0, 0},
									{0, 0, 0, 0, 0, 0, 0},
									{0, 0, 0, 0, 0, 0, 0},
									{0, 0, 0, 0, 0, 0, 0},
									{0, 0, 0, 0, 0, 0, 0},
									{0, 0, 0, 0, 0, 0, 0},
									{0, 0, 0, 0, 0, 0, 0}}
										
	inteiro mat_pos_quadro_comandos[2][2]= {{oeste, norte},
									{sul, leste}}
	

	funcao telainicial()
	{
		iniciar_jogo()
	}
	
	funcao iniciar_jogo()
	{
		definir_posicao_original()
		posicao_inicial()
		faca
		{
		jogar()
		}enquanto(chegou_no_fim==falso)
		proxima_fase()
	}
	
	funcao jogar()
	{
		
		faca
		{
			pega_comando()
			desenhar()
			acha_mouse()
			se(deu_reset())
			{
				resetar()
			}
		}enquanto(deu_play()==falso)
		posicao_inicial()
		matriz_quadro_para_vetor_caminho()
		rodar_caminho()
	}

	funcao logico deu_play()
	{
		se(objeto_foi_clicado(mouse_esta_sobre_objeto(posicao_botoes[1], posicao_botoes[2], tam_botoes[0], tam_botoes[1])))
		{
			objeto_clicado=BOTAO_PLAY
			retorne falso
		}
		se((objeto_clicado==BOTAO_PLAY e mouse_esta_sobre_objeto(posicao_botoes[1], posicao_botoes[2], tam_botoes[0], tam_botoes[1])) e objeto_foi_clicado(mouse_esta_sobre_objeto(posicao_botoes[1], posicao_botoes[2], tam_botoes[0], tam_botoes[1]))==falso)
		{
			objeto_clicado=0
			retorne verdadeiro
		}
		retorne falso
	}

	funcao logico deu_reset()
	{
		se(objeto_foi_clicado(mouse_esta_sobre_objeto(posicao_botoes[0], posicao_botoes[2], tam_botoes[0], tam_botoes[1])))
		{
			objeto_clicado=BOTAO_RESET
			retorne falso
		}
		se((objeto_clicado==BOTAO_RESET e mouse_esta_sobre_objeto(posicao_botoes[0], posicao_botoes[2], tam_botoes[0], tam_botoes[1])) e objeto_foi_clicado(mouse_esta_sobre_objeto(posicao_botoes[0], posicao_botoes[2], tam_botoes[0], tam_botoes[1]))==falso)
		{
			objeto_clicado=0
			retorne verdadeiro
		}
		retorne falso
	}
	
	funcao pega_comando()
	{
		se(mouse_esta_sobre_comandos() e pegou_comando==falso)
		{
			objeto_clicado=comando_que_foi_clicado()
		}
		se(um_comando_esta_selecionado() e (objeto_foi_clicado(pegou_comando)==falso))
		{
			se(mouse_esta_sobre_objeto(posicao_quadro[0], posicao_quadro[1], tam_quadro_programavel[0], tam_quadro_programavel[1]))
			{
				coloca_comando_no_quadro()
			}
			pegou_comando=falso
			objeto_clicado=0
		}	
	}

	funcao logico um_comando_esta_selecionado()
	{
		se(objeto_clicado==COMANDO_SOBE)
		{
			retorne verdadeiro
		}
		
		se(objeto_clicado==COMANDO_DESCE)
		{
			retorne verdadeiro
		}
		
		se(objeto_clicado==COMANDO_DIREITA)
		{
			retorne verdadeiro
		}
		
		se(objeto_clicado==COMANDO_ESQUERDA)
		{
			retorne verdadeiro
		}

		retorne falso
	}

	funcao coloca_comando_no_quadro()
	{
		para(i=0; i<tam_matriz_quadro[0]; i++)
		{
			para(j=0; j<tam_matriz_quadro[1]; j++)
			{
				se(mat_pos_quadro_programavel[i][j]==0)
				{
					mat_pos_quadro_programavel[i][j]=objeto_clicado
					retorne
				}
			}
		}
	}

	funcao matriz_quadro_para_vetor_caminho()
	{
		inteiro aux=0
		para(i=0; i<tam_matriz_quadro[0]; i++)
		{
			para(j=0; j<tam_matriz_quadro[1]; j++)
			{
				caminhochar[aux]=mat_pos_quadro_programavel[i][j]
				aux++
			}
		}
		
	}
	
	funcao rodar_caminho()
	{
		posicao_inicial()
		comecou_a_rodar=verdadeiro
		acha_char()
		faca
		{		
			roda_char_()
			acha_char()
			se(verifica_tile())
			{
				proximo_tile()
				pode_andar=verdadeiro	
			}
			senao
			{
				pode_andar=falso
			}
			para(inteiro a=0; a<31; a++)
			{
				se(pode_andar)
				{
					mover()
				}
				se(a==16)//Essa Condição permite que o char não seja desenhado sobre um objeto antes de chegar no tile próximo
				{
					acha_char()
				}
				desenhar()
			}
			acha_mouse()				
			lado++
			
		}enquanto(caminhochar[lado] != 0)
		lado=0
		comecou_a_rodar=falso		
	}

	funcao acha_mouse()
	{
		posicao_x_mouse=mo.posicao_x()
		posicao_y_mouse=mo.posicao_y()
	}

	funcao roda_char_()
	{
			se(caminhochar[lado]==SOBE)
			{
				incrementohorizontal = 0.0
				incrementovertical = -quantoanda
				direcao=norte
			}
			se(caminhochar[lado]==DESCE)
			{
				incrementohorizontal = 0.0
				incrementovertical = quantoanda	
				direcao=sul
			}
			se(caminhochar[lado]==ESQUERDA)
			{
				incrementohorizontal = -quantoanda
				incrementovertical = 0.0	
				direcao=oeste
			}
			se(caminhochar[lado]==DIREITA)
			{
				incrementohorizontal = quantoanda
				incrementovertical =0.0
				direcao=leste
			}
			
	}

	funcao ajusta_matriz_cercas()
	{
		para(i=0; i<9; i++)
		{
			para(j=0; j<8; j++)
			{
				escolha(mapa_cerca_horizontal[i][j])
				{
					caso 1: 	mapa_cerca_horizontal[i][j+1]=11 pare
					
					caso 3:	mapa_cerca_horizontal[i][j+1]=13
							mapa_cerca_horizontal[i][j+2]=23
							mapa_cerca_vertical[i-1][j+3]=33
							mapa_cerca_vertical[i-2][j+3]=43 pare
				}
				escolha(mapa_cerca_vertical[j][i])
				{
					caso 4: 	mapa_cerca_vertical[j+1][i]=14 pare

					caso 6:	mapa_cerca_vertical[j+1][i]=16
							mapa_cerca_vertical[j+2][i]=26
							mapa_cerca_horizontal[j+3][i-1]=36
							mapa_cerca_horizontal[j+3][i-2]=46 pare			
				}
			}
		}	
	}
	
	funcao desenhar()
	{
			g.limpar()
			g.definir_cor(0x99FF66)
			ajusta_matriz_cercas()
			desenha_mapa()
			mexe_quadro()
			desenha_quadro()
			desenha_comandos()
			desenha_exemplo()
			desenha_botoes()
			desenha_comando_no_mouse()
			g.renderizar()
	}
	
	funcao desenha_mapa()
	{
		g.desenhar_imagem(154, 88, img_mapa)

		para(i=0; i<8;i++)
		{
			para(j=0;j<8;j++)
			{
				posicao_objeto(j, i)
		          desenha_cerca(mapa_cerca_horizontal[i][j])
		          desenha_cerca(mapa_cerca_vertical[i][j])
				desenha_tile(mapa[i][j])
//				debug(mapa_char[i][j])
//				g.renderizar()
//				u.aguarde(100)
				se(posicao_maty==i e posicao_matx==j)
				{
					desenha_char()		
				}
			}
		}

    		para(inteiro z=0; z<8;z++)
    		{
    			posicao_objeto(8, z)
    			desenha_cerca(mapa_cerca_vertical[z][8])
    			posicao_objeto(z, 8)
    			desenha_cerca(mapa_cerca_horizontal[8][z])
    		}
	}

	funcao desenha_tile(inteiro s)
	{
		escolha(s){
			caso  1 : g.desenhar_porcao_imagem(posicao_isometrica_objeto_x+posicao_mapa[0], posicao_isometrica_objeto_y+posicao_mapa[1],  142, 0, 71, 125, img_objects) pare 
			caso  2 : g.desenhar_porcao_imagem(posicao_isometrica_objeto_x+posicao_mapa[0], posicao_isometrica_objeto_y+posicao_mapa[1],    0, 0, 71, 117, img_objects) pare 
			caso  3 : g.desenhar_porcao_imagem(posicao_isometrica_objeto_x+posicao_mapa[0], posicao_isometrica_objeto_y+posicao_mapa[1],   71, 0, 71, 125, img_objects) pare 
			caso  4 : g.desenhar_porcao_imagem(posicao_isometrica_objeto_x+posicao_mapa[0], posicao_isometrica_objeto_y+posicao_mapa[1],  213, 0, 71, 125, img_objects) pare 
			caso  5 : g.desenhar_porcao_imagem(posicao_isometrica_objeto_x+posicao_mapa[0], posicao_isometrica_objeto_y+posicao_mapa[1],  284, 0, 71, 108, img_objects) pare 
			caso  6 : g.desenhar_porcao_imagem(posicao_isometrica_objeto_x+posicao_mapa[0], posicao_isometrica_objeto_y+posicao_mapa[1],  355, 0, 71, 108, img_objects) pare 
		}
	}

	funcao desenha_cerca(inteiro s)
	{
		escolha(s)
		{
			//Os números para saber o quanto cortar da cerca e quanto levantar ela, foram baseados em tentativa e erro
			
			caso  1 : g.desenhar_porcao_imagem(posicao_isometrica_objeto_x+posicao_mapa_cerca[0], posicao_isometrica_objeto_y+posicao_mapa_cerca[1]	,     6, 128,  32,  78, img_objects) pare
			caso 11 : g.desenhar_porcao_imagem(posicao_isometrica_objeto_x+posicao_mapa_cerca[0], posicao_isometrica_objeto_y+posicao_mapa_cerca[1]-17	,    35, 128,  32,  78, img_objects) pare
			caso  2 : g.desenhar_porcao_imagem(posicao_isometrica_objeto_x+posicao_mapa_cerca[0], posicao_isometrica_objeto_y+posicao_mapa_cerca[1]	,    75, 128,  44,  62, img_objects) pare 
			caso  3 : g.desenhar_porcao_imagem(posicao_isometrica_objeto_x+posicao_mapa_cerca[0], posicao_isometrica_objeto_y+posicao_mapa_cerca[1]	,   118, 128,  34,  95, img_objects) pare
			caso 13 : g.desenhar_porcao_imagem(posicao_isometrica_objeto_x+posicao_mapa_cerca[0], posicao_isometrica_objeto_y+posicao_mapa_cerca[1]-16	,   147, 128,  32,  95, img_objects) pare
			caso 23 : g.desenhar_porcao_imagem(posicao_isometrica_objeto_x+posicao_mapa_cerca[0], posicao_isometrica_objeto_y+posicao_mapa_cerca[1]-33	,   176, 128,  32,  95, img_objects) pare
			caso 33 : g.desenhar_porcao_imagem(posicao_isometrica_objeto_x+posicao_mapa_cerca[0], posicao_isometrica_objeto_y+posicao_mapa_cerca[1]-32	,   239, 128, -31,  95, img_objects) pare 
			caso 43 : g.desenhar_porcao_imagem(posicao_isometrica_objeto_x+posicao_mapa_cerca[0], posicao_isometrica_objeto_y+posicao_mapa_cerca[1]-18	,   268, 128, -31,  95, img_objects) pare 
			caso  4 : g.desenhar_porcao_imagem(posicao_isometrica_objeto_x+posicao_mapa_cerca[0], posicao_isometrica_objeto_y+posicao_mapa_cerca[1]	,   269, 223, -32,  78, img_objects) pare 
			caso 14 : g.desenhar_porcao_imagem(posicao_isometrica_objeto_x+posicao_mapa_cerca[0], posicao_isometrica_objeto_y+posicao_mapa_cerca[1]-17	,   237, 223, -32,  78, img_objects) pare 
			caso  5 : g.desenhar_porcao_imagem(posicao_isometrica_objeto_x+posicao_mapa_cerca[0], posicao_isometrica_objeto_y+posicao_mapa_cerca[1]	,   202, 223, -44,  62, img_objects) pare 
			caso  6 : g.desenhar_porcao_imagem(posicao_isometrica_objeto_x+posicao_mapa_cerca[0], posicao_isometrica_objeto_y+posicao_mapa_cerca[1]	,   156, 223, -34,  95, img_objects) pare 
			caso 16 : g.desenhar_porcao_imagem(posicao_isometrica_objeto_x+posicao_mapa_cerca[0], posicao_isometrica_objeto_y+posicao_mapa_cerca[1]-17	,   126, 223, -32,  95, img_objects) pare 
			caso 26 : g.desenhar_porcao_imagem(posicao_isometrica_objeto_x+posicao_mapa_cerca[0], posicao_isometrica_objeto_y+posicao_mapa_cerca[1]-34	,    96, 223, -32,  95, img_objects) pare 
			caso 36 : g.desenhar_porcao_imagem(posicao_isometrica_objeto_x+posicao_mapa_cerca[0], posicao_isometrica_objeto_y+posicao_mapa_cerca[1]-36	,   	34, 223,  31,  95, img_objects) pare 
			caso 46 : g.desenhar_porcao_imagem(posicao_isometrica_objeto_x+posicao_mapa_cerca[0], posicao_isometrica_objeto_y+posicao_mapa_cerca[1]-18	,     4, 223,  31,  95, img_objects) pare 
			
		}	
	}
	
	funcao posicao_objeto(inteiro x, inteiro y)
	{
		posicao_objeto_x=x*tamtile[0]
		posicao_objeto_y=y*tamtile[1]
		doisdparaiso_o()
	}

	funcao desenha_char()
	{
		g.desenhar_porcao_imagem(char_isometrico_x+posicao_mapa_char[0]+55, char_isometrico_y+posicao_mapa_char[1]+115, sprite[direcao][indice_imagem*2],sprite[direcao][indice_imagem*2+1] , -32, -80, imagem_boy)
		se(comecou_a_rodar)
		{	
			se(imagemporturnos%8==0)
			{
			indice_imagem = (indice_imagem + 1) % 5
			}
			imagemporturnos++  
		}
	}
	
	funcao desenha_quadro()
	{
		
		se(fator_mexer_quadro>tam_quadro_programavel[1]/2-1.5)
		{
			fator_mexer_quadro=0 //permite que quando chegar no fim da imagem do quadro, retorne ao começo dela
		}
		se(fator_mexer_quadro<0)
		{
			fator_mexer_quadro=tam_quadro_programavel[1]/2-1.5 //permite que quando voltar no começo da imagem do quadro, retorne ao fim dela
		}
		// 36 é a altura da placa "programa"
		g.desenhar_imagem(posicao_quadro[0], posicao_quadro[1]-36, img_quadros_adjacentes)//placa programa
		g.desenhar_porcao_imagem(posicao_quadro[0], posicao_quadro[1], 0, fator_mexer_quadro, tam_quadro_programavel[0], tam_quadro_programavel[1]/2, img_quadros)//metade do quadro parte de cima
		g.desenhar_porcao_imagem(posicao_quadro[0], posicao_quadro[1]+tam_quadro_programavel[1]/2, 0, fator_mexer_quadro, tam_quadro_programavel[0], tam_quadro_programavel[1]/2, img_quadros)//metade do quadro parte de baixo
		g.desenhar_imagem(posicao_setas[0], posicao_setas[1], img_setas)
		para(i=0; i<tam_matriz_quadro[0]; i++)
		{
			para(j=0; j<tam_matriz_quadro[1]; j++)
			{
				desenha_comando_no_quadro(mat_pos_quadro_programavel[i][j])
			}
		}
	}

	funcao desenha_comando_no_quadro(inteiro s)
	{
		real fator_saiu_do_quadro=0.0
		real fator_saiu_por_cima=0.0
		
		se((i*(tam_comandos[1])+fator_mexer_matriz_comandos)<0)
		{
			fator_saiu_do_quadro=(i*(tam_comandos[1])+fator_mexer_matriz_comandos)
			se(-fator_saiu_do_quadro>tam_comandos[1])
			{
				fator_saiu_do_quadro=-tam_comandos[1]
			}
			fator_saiu_por_cima=fator_saiu_do_quadro
		}
		se((i*(tam_comandos[1])+fator_mexer_matriz_comandos)>tam_quadro_programavel[1]-tam_comandos[1])
		{
			fator_saiu_do_quadro=(tam_quadro_programavel[1]-(i*(tam_comandos[1])+fator_mexer_matriz_comandos))-tam_comandos[1]
			se(fator_saiu_do_quadro<-tam_comandos[1])
			{
				fator_saiu_do_quadro=-tam_comandos[1]
			}
		}
		escolha(s)
		{
			caso  ESQUERDA : g.desenhar_porcao_imagem(posicao_quadro[0]+(j*tam_comandos[0]), posicao_quadro[1]+(i*(tam_comandos[1])+fator_mexer_matriz_comandos)-fator_saiu_por_cima, 0*tam_comandos[0], 0*tam_comandos[1]-fator_saiu_por_cima, tam_comandos[0], tam_comandos[1]+fator_saiu_do_quadro, img_comandos_menor) pare
			caso  DESCE 	: g.desenhar_porcao_imagem(posicao_quadro[0]+(j*tam_comandos[0]), posicao_quadro[1]+(i*(tam_comandos[1])+fator_mexer_matriz_comandos)-fator_saiu_por_cima, 0*tam_comandos[0], 1*tam_comandos[1]-fator_saiu_por_cima, tam_comandos[0], tam_comandos[1]+fator_saiu_do_quadro, img_comandos_menor) pare 
			caso  SOBE 	: g.desenhar_porcao_imagem(posicao_quadro[0]+(j*tam_comandos[0]), posicao_quadro[1]+(i*(tam_comandos[1])+fator_mexer_matriz_comandos)-fator_saiu_por_cima, 1*tam_comandos[0], 0*tam_comandos[1]-fator_saiu_por_cima, tam_comandos[0], tam_comandos[1]+fator_saiu_do_quadro, img_comandos_menor) pare 
			caso  DIREITA 	: g.desenhar_porcao_imagem(posicao_quadro[0]+(j*tam_comandos[0]), posicao_quadro[1]+(i*(tam_comandos[1])+fator_mexer_matriz_comandos)-fator_saiu_por_cima, 1*tam_comandos[0], 1*tam_comandos[1]-fator_saiu_por_cima, tam_comandos[0], tam_comandos[1]+fator_saiu_do_quadro, img_comandos_menor) pare
		}
		se(mouse_esta_sobre_objeto(posicao_quadro[0]+(j*tam_comandos[0]), posicao_quadro[1]+(i*(tam_comandos[1])+fator_mexer_matriz_comandos)-fator_saiu_por_cima, tam_comandos[0], tam_comandos[1]+fator_saiu_do_quadro) e mat_pos_quadro_programavel[i][j]!=0)
		{
			g.desenhar_imagem(posicao_quadro[0]+(j*tam_comandos[0])+tam_comandos[0]-17, posicao_quadro[1]+(i*(tam_comandos[1])+fator_mexer_matriz_comandos)-fator_saiu_por_cima, img_botao_excluir)
			se(objeto_foi_clicado(verdadeiro))
			{
				objeto_clicado=BOTAO_EXCLUIR
			}
			se(objeto_foi_clicado(verdadeiro)==falso e objeto_clicado==BOTAO_EXCLUIR)
			{
				objeto_clicado=0
				retirar_comando()
			}
		}
	}

	funcao desenha_comandos()
	{
		g.desenhar_porcao_imagem(posicao_comandos[0]+0*tam_mat_comandos[0], posicao_comandos[1]+0*tam_mat_comandos[1], 0*tam_mat_comandos[0], 0*tam_mat_comandos[1], tam_mat_comandos[0], tam_mat_comandos[1], img_comandos)
		g.desenhar_porcao_imagem(posicao_comandos[0]+0*tam_mat_comandos[0], posicao_comandos[1]+1*tam_mat_comandos[1], 0*tam_mat_comandos[0], 1*tam_mat_comandos[1], tam_mat_comandos[0], tam_mat_comandos[1], img_comandos)
		g.desenhar_porcao_imagem(posicao_comandos[0]+1*tam_mat_comandos[0], posicao_comandos[1]+0*tam_mat_comandos[1], 1*tam_mat_comandos[0], 0*tam_mat_comandos[1], tam_mat_comandos[0], tam_mat_comandos[1], img_comandos)
		g.desenhar_porcao_imagem(posicao_comandos[0]+1*tam_mat_comandos[0], posicao_comandos[1]+1*tam_mat_comandos[1], 1*tam_mat_comandos[0], 1*tam_mat_comandos[1], tam_mat_comandos[0], tam_mat_comandos[1], img_comandos)
	}

	funcao desenha_comando_no_mouse()
	{
		acha_mouse()
		se(objeto_clicado==ESQUERDA)
		{
			g.desenhar_porcao_imagem(posicao_x_mouse-(tam_mat_comandos[0]/2), posicao_y_mouse-(tam_mat_comandos[1]/2), 0*tam_mat_comandos[0], 0*tam_mat_comandos[1], tam_mat_comandos[0], tam_mat_comandos[1], img_comandos)
		}
		se(objeto_clicado==DESCE)
		{
			g.desenhar_porcao_imagem(posicao_x_mouse-(tam_mat_comandos[0]/2), posicao_y_mouse-(tam_mat_comandos[1]/2),  0*tam_mat_comandos[0], 1*tam_mat_comandos[1], tam_mat_comandos[0], tam_mat_comandos[1], img_comandos)
		}
		se(objeto_clicado==SOBE)
		{
			g.desenhar_porcao_imagem(posicao_x_mouse-(tam_mat_comandos[0]/2), posicao_y_mouse-(tam_mat_comandos[1]/2), 1*tam_mat_comandos[0], 0*tam_mat_comandos[1], tam_mat_comandos[0], tam_mat_comandos[1], img_comandos)
		}
		se(objeto_clicado==DIREITA)
		{
			g.desenhar_porcao_imagem(posicao_x_mouse-(tam_mat_comandos[0]/2), posicao_y_mouse-(tam_mat_comandos[1]/2), 1*tam_mat_comandos[0], 1*tam_mat_comandos[1], tam_mat_comandos[0], tam_mat_comandos[1], img_comandos)
		}
	}
	
	funcao desenha_exemplo()
	{
		g.desenhar_porcao_imagem(posicao_comandos[0]+tam_mat_comandos[0]+20, posicao_comandos[1]+tam_mat_comandos[1]+10, sprite[direcao_exemplo][indice_imagem_exemplo*2],sprite[direcao_exemplo][indice_imagem_exemplo*2+1] , -32, -80, imagem_exemplo)	
		se(mouse_esta_sobre_comandos())
		{
			se(imagemporturnos_exemplo%8==0)
			{
			indice_imagem_exemplo = (indice_imagem_exemplo + 1) % 5
			}
			imagemporturnos_exemplo++
		}	
	}

	funcao desenha_botoes()
	{
		g.desenhar_porcao_imagem(posicao_botoes[0], posicao_botoes[2], 34, 0, tam_botoes[0], tam_botoes[1], img_botoes)
		g.desenhar_porcao_imagem(posicao_botoes[1], posicao_botoes[2], 0, 0, tam_botoes[0], tam_botoes[1], img_botoes)
	}
	
	funcao mexe_quadro()
	{
		se(fator_mexer_matriz_comandos<0 )
		{
			se(esta_clicando_na_seta()==SOBE)
			{
			fator_mexer_quadro-=2
			fator_mexer_matriz_comandos+=2
			}
		}
		se((21*(tam_comandos[1])+fator_mexer_matriz_comandos)>tam_quadro_programavel[1]-tam_comandos[1])
		{
			se(esta_clicando_na_seta()==DESCE)
			{
			fator_mexer_quadro+=2
			fator_mexer_matriz_comandos-=2
			}
		}
	}
	
	funcao inteiro esta_clicando_na_seta()
	{
		se(objeto_foi_clicado(mouse_esta_sobre_objeto(posicao_setas[0], posicao_setas[1], tam_setas[0], tam_setas[1])))
		{
			retorne SOBE
		}
		se(objeto_foi_clicado(mouse_esta_sobre_objeto(posicao_setas[0], posicao_setas[2], tam_setas[0], tam_setas[1])))
		{
			retorne DESCE
		}
		retorne 0
	}
	
	funcao logico mouse_esta_sobre_comandos()
	{
		se(mouse_esta_sobre_objeto(posicao_comandos[0], posicao_comandos[1], tam_mat_comandos[0], tam_mat_comandos[1]))
		{
				direcao_exemplo=oeste
				retorne verdadeiro
		}
		se(mouse_esta_sobre_objeto(posicao_comandos[0]+tam_mat_comandos[0], posicao_comandos[1], tam_mat_comandos[0], tam_mat_comandos[1]))
		{
				direcao_exemplo=norte
				retorne verdadeiro
		}
		se(mouse_esta_sobre_objeto(posicao_comandos[0], posicao_comandos[1]+tam_mat_comandos[1], tam_mat_comandos[0], tam_mat_comandos[1]))
		{
				direcao_exemplo=sul
				retorne verdadeiro
		}
		se(mouse_esta_sobre_objeto(posicao_comandos[0]+tam_mat_comandos[0], posicao_comandos[1]+tam_mat_comandos[1], tam_mat_comandos[0], tam_mat_comandos[1]))
		{
				direcao_exemplo=leste
				retorne verdadeiro
		}
		indice_imagem_exemplo=0
		retorne falso
	}

	funcao inteiro comando_que_foi_clicado()
	{
		se(objeto_foi_clicado(mouse_esta_sobre_objeto(posicao_comandos[0], posicao_comandos[1], tam_mat_comandos[0], tam_mat_comandos[1])))
		{
				pegou_comando=verdadeiro
				retorne COMANDO_ESQUERDA
		}
		se(objeto_foi_clicado(mouse_esta_sobre_objeto(posicao_comandos[0]+tam_mat_comandos[0], posicao_comandos[1], tam_mat_comandos[0], tam_mat_comandos[1])))
		{
				pegou_comando=verdadeiro
				retorne COMANDO_SOBE
		}
		se(objeto_foi_clicado(mouse_esta_sobre_objeto(posicao_comandos[0], posicao_comandos[1]+tam_mat_comandos[1], tam_mat_comandos[0], tam_mat_comandos[1])))
		{
				pegou_comando=verdadeiro
				retorne COMANDO_DESCE
		}
		se(objeto_foi_clicado(mouse_esta_sobre_objeto(posicao_comandos[0]+tam_mat_comandos[0], posicao_comandos[1]+tam_mat_comandos[1], tam_mat_comandos[0], tam_mat_comandos[1])))
		{
				pegou_comando=verdadeiro
				retorne COMANDO_DIREITA
		}
		retorne 0
	}
	
	funcao logico mouse_esta_sobre_objeto(real posicao_x_objeto, real posicao_y_objeto, real tamanho_x_objeto, real tamanho_y_objeto)
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
	
	funcao logico verifica_tile()
	{
		acha_char()
		retorne verifica_proximo(posicao_maty, posicao_matx)
		
	}

	funcao logico verifica_proximo(inteiro y, inteiro x)
	{
			se(caminhochar[lado]==DIREITA)
			{
				se(x+1<8)
				{
					se(mapa[y][x+1]==0 e mapa_cerca_vertical[y][x+1]%10==0)
					{
						retorne verdadeiro
					}
				}
			}
			senao se(caminhochar[lado]==ESQUERDA)
			{
				se(x-1>-1)
				{
					se(mapa[y][x-1]==0 e mapa_cerca_vertical[y][x]%10==0)
					{
						retorne verdadeiro
					}
				}
			}
			senao se(caminhochar[lado]==SOBE)
			{
				se(y-1>-1)
				{
					se(mapa[y-1][x]==0 e mapa_cerca_horizontal[y][x]%10==0)
					{
						retorne verdadeiro
					}
				}
			}
			senao se(caminhochar[lado]==DESCE)
			{	
				se(y+1<8)
				{
					se(mapa[y+1][x]==0 e mapa_cerca_horizontal[y+1][x]%10==0)
					{
						retorne verdadeiro
					}
				}
			}
		
		retorne falso
		
		
	}
	
	funcao proximo_tile()
	{
		se(caminhochar[lado]==DIREITA)
		{
			mapa_char[posicao_maty][posicao_matx+1]=1
			mapa_char[posicao_maty][posicao_matx]=0
		}
		senao se(caminhochar[lado]==ESQUERDA)
		{
			mapa_char[posicao_maty][posicao_matx-1]=1
			mapa_char[posicao_maty][posicao_matx]=0
		}
		senao se(caminhochar[lado]==SOBE)
		{
			mapa_char[posicao_maty-1][posicao_matx]=1
			mapa_char[posicao_maty][posicao_matx]=0
		}
		senao se(caminhochar[lado]==DESCE)
		{
			mapa_char[posicao_maty+1][posicao_matx]=1
			mapa_char[posicao_maty][posicao_matx]=0
		}	
	}
	
	funcao isoparadoisd_o()
	{
  		posicao_objeto_x = (2 * posicao_isometrica_objeto_y + posicao_isometrica_objeto_x) / 2
 		posicao_objeto_y = (2 * posicao_isometrica_objeto_y - posicao_isometrica_objeto_x) / 2
	}

	funcao doisdparaiso_o()
	{
		posicao_isometrica_objeto_x = posicao_objeto_x - posicao_objeto_y
  		posicao_isometrica_objeto_y = (posicao_objeto_x + posicao_objeto_y) /1.75
	}
	
	funcao isoparadoisd()
	{
  		char_x = (2 * char_isometrico_y + char_isometrico_x) / 2
 		char_y = (2 * char_isometrico_y - char_isometrico_x) / 2
	}

	funcao doisdparaiso()
	{
		char_isometrico_x = char_x - char_y
  		char_isometrico_y = (char_x + char_y) / 1.75
	}

	funcao mover()
	{
		char_x+= incrementohorizontal
		char_y+= incrementovertical
		doisdparaiso()
	}

	funcao acha_char()
	{
		para(i=0; i<8; i++){
				para(j=0; j<8; j++){
					se(mapa_char[i][j]==1)
					{
						posicao_maty=i
						posicao_matx=j
					}
				}
			}		
	}

	funcao resetar()
	{
		posicao_inicial()
		limpar_caminho_matriz()
	}

	funcao retirar_comando()
	{
		mat_pos_quadro_programavel[i][j]==0
	}
	
	funcao limpar_caminho_matriz()
	{
		para(i=0; i<u.numero_elementos(caminhochar); i++)
		{
			caminhochar[i]=0
		}
		para(i=0; i<u.numero_linhas(mat_pos_quadro_programavel); i++)
		{
			para(j=0; j<u.numero_colunas(mat_pos_quadro_programavel); j++)
			{
					mat_pos_quadro_programavel[i][j]=0
			}
		}
	}

	funcao posicao_inicial()
	{
		acha_char()
		
		char_x=char_posicao_original_x_matriz*tamtile[0]
		char_y=char_posicao_original_y_matriz*tamtile[1]

		mapa_char[posicao_maty][posicao_matx]=0
		mapa_char[char_posicao_original_y_matriz][char_posicao_original_x_matriz]=1
		acha_char()
		
		doisdparaiso()
	}

	funcao definir_posicao_original()
	{
		acha_char()
		char_posicao_original_x_matriz=posicao_matx
		char_posicao_original_y_matriz=posicao_maty
	}

	funcao debug(inteiro s)
	{
			g.definir_cor(g.COR_PRETO)
			g.desenhar_texto(posicao_isometrica_objeto_x+posicao_mapa[0], posicao_isometrica_objeto_y+posicao_mapa[1], tp.inteiro_para_cadeia(s, 10))	
			g.definir_cor(0x99FF66)	
	}

	funcao proxima_fase()
	{
		
	}
	
	funcao carregar_imagens()
	{
		cadeia pasta_boy = "./boy/"
		cadeia pasta_girl = "./girl/"
		cadeia pasta_objetos = "./objetos/"
		imagem_boyf = g.carregar_imagem(pasta_boy + "chars_boy1.png")
		imagem_boya = g.carregar_imagem(pasta_boy + "chars_boy2.png")
		imagem_boy = g.carregar_imagem(pasta_boy + "chars.png")
		imagem_exemplo = g.carregar_imagem(pasta_boy + "chars.png")
		img_mapa = g.carregar_imagem("./mapa/mapa_vazio.png")
		img_objects = g.carregar_imagem(pasta_objetos + "objects.png")
		img_quadros = g.carregar_imagem(pasta_objetos + "quadro.png")
		img_quadros_adjacentes = g.carregar_imagem(pasta_objetos + "quadros_adjacentes.png")
		img_comandos = g.carregar_imagem(pasta_objetos + "comandos.png")
		img_comandos_menor = g.carregar_imagem(pasta_objetos +"comandos_menor.png")
		img_botoes = g.carregar_imagem(pasta_objetos + "botoes.png")
		img_botao_excluir = g.carregar_imagem(pasta_objetos + "botao_excluir.png")
		img_setas = g.carregar_imagem(pasta_objetos + "setas.png")
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
		telainicial()	
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 27970; 
 * @DOBRAMENTO-CODIGO = [58, 92, 135, 158, 162, 167, 178, 196, 211, 226, 243, 268, 283, 297, 335, 341, 370, 398, 413, 444, 456, 482, 489, 502, 527, 571, 579, 600, 613, 619, 639, 652, 678, 703, 715, 724, 731, 779, 803, 809, 815, 821, 827, 834, 847, 858, 873, 887, 894, 901, 906, 926, 933];
 */