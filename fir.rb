require 'colorize'
#GENERO UN TABLERO
def init_board()
	board=[
		["-","-","-","-","-","-"],
		["-","-","-","-","-","-"],
		["-","-","-","-","-","-"],
		["-","-","-","-","-","-"],
		["-","-","-","-","-","-"],
		["-","-","-","-","-","-"]]
	return board
end
#LE DOY DOY FORMA E IMPRIMO EL TABLERO
def paint_board(board)
	puts "Soy un ".yellow + "tablero h4ck ".blue + "6x6 =D".red
	puts "1 2 3 4 5 6 --> Columnas".green
	for i in 0..board.length-1
		for j in 0..board.length-1
			print board[board.length-1 - i][j].to_s.blue + " "
		end
		puts " "
	end
end
#FUNCION QUE PERMITE AL USUARIO JUGAR
def play(board,token)
	valid = false
	while(!valid)
		if(token == "X")
			puts "Es el turno del jugador 1".yellow
		elsif(token == "O")
			puts "Es el turno del jugador 2".yellow
		else
			puts "Nunca debi entrar aca!"
		end

		puts "Indica la columna en la que quieres jugar: "
		c = gets.chomp.to_i
		c = c - 1
			for i in 0..board.length-1
				if (board[i][c] == "-")
					board[i][c] = token
					valid = true
					break #Para el for que rodea el if y mete en el espacio vacio que encontro
				else
					paint_board(board)
				end
			end
	end
end
#VERIFICA GANADOR HORIZONTAL
def check_h(board,token)
	for j in 0..board.length-1
		w = 0
    	for i in 0..board.length-1
        	if( board[j][i] == token )
            	w = w+1
        	else
            	w = 0
        	end
        		if(w == 4)
            		return true
        		end
    end
end
return false
end
#VERIFICA GANADOR VERTICAL
def check_v(board,token)
	for j in 0..board.length-1
		w = 0
    	for i in 0..board.length-1
        	if( board[i][j] == token )
            	w = w+1
        	else
            	w = 0
        	end
        		if(w == 4)
            		return true
        		end
    end
end
return false
end
#VERIFICA DIAGONAL DE IZQUIERDA A DERECHA HASTA ABAJO
def check_diagonal_down(board,token)
	for i in 0..board.length-1
		aux=i #3 am Creimos que el mundo se habia perdido, pero encontramos la ayuda del aux
        for j in 0..board.length-1
            c=0
			win = false
            while (i<board.length && j<board.length && i>=0 && j>=0 && !win)
                if (board[i][j]==token)
                    c=c+1
                    j=j+1
                    i=i+1
                else
                    j=j+1
                    i=i+1
                    c=0
                end
                if(c==4)
                    win = true
                    return true
                end
            end
			i=aux
        end
    end
    return false
end
#VERIFICA DIAGONAL DE IZQUIERDA A DERECHA HASTA ARRIBA
def check_diagonal_up(board,token)
	for i in 0..board.length-1
		aux = i #3 am Creimos que el mundo se habia perdido, pero encontramos la ayuda del aux
        for j in 0..board.length-1
            c=0
			win = false
            while (i<board.length && j<board.length && i>=0 && j>=0 && !win)
                if (board[i][j]==token)
                    c=c+1
                    j=j+1
                    i=i-1
                else
                    j=j+1
                    i=i+1
                    c=0
                end
                if(c==4)
                    win = true
                    return true
                end
            end
			i=aux
        end
    end
    return false
end
#VERIFICA EMPATE
def check_tie(board)
	for i in 0..board.length-1
		for j in 0..board.length-1
			if(board[i][j] == "-")
				return true
			end
		end
	end
	return false
end
#INICIA EL JUEGO!
def main()
	token1 = "X"
	token2 = "O"
	board = init_board()
	stop = false
	paint_board(board)
	while(!stop)
		#CICLO JUEGO DEL JUGADOR 1
		play(board,token1)
		paint_board(board)
		if (check_h(board,token1) || check_v(board,token1) || check_diagonal_down(board,token1) || check_diagonal_up(board,token1) )
			puts "GANASTE JUGADOR 1".red
			stop = true
			break #termina el juego si gano :D
		end
		if check_tie(board) == false
			puts "FUE UN EMPATE, PONGAN A TRABAJAR EL CEREBRITO!".red
			break #*Paro el juego si hay empate
		end
		#CICLO JUEGO DEL JUGADOR 2
		play(board,token2)
		paint_board(board)
		if (check_h(board,token2) || check_v(board,token2) || check_diagonal_down(board,token2) || check_diagonal_up(board,token2))
			puts "GANASTE JUGADOR 2".red
			stop = true
			break #termina el juego si gano :D
		end
		if check_tie(board) == false
			puts "FUE UN EMPATE, PONGAN A TRABAJAR EL CEREBRITO!".red
			break
		end
	end
end
main()
