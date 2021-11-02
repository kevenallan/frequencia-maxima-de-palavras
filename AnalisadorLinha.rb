class AnalisadorLinha
    
    attr_accessor :numero_linha,:conteudo_linha,:palvaras_maiores_frequencias,:total_repeticoes
    
    def initialize (numero_linha,conteudo_linha)
        @total_repeticoes = 0
        @numero_linha = numero_linha
        @conteudo_linha = conteudo_linha
        @palvaras_maiores_frequencias = []
    end

    def gerarAnalize
        if @conteudo_linha[-1] == "\n"
            @conteudo_linha[-1]=""
        end
        repeticoes_por_linha = []
        l = @conteudo_linha.split
        array = []
        for palavra in l do
            hash = Hash.new
            hash[:linha] = @numero_linha
            hash[:palavra] = palavra
            hash[:repeticao] = l.count(palavra)
            array.push(hash)
        end
        repeticoes_por_linha.push(array)

        maior = 0
        for linha in repeticoes_por_linha do
            for palavra in linha do
                if palavra[:repeticao] > maior
                    maior = palavra[:repeticao]  
                end
            end
        end

        repeticoes = []
        for linha in repeticoes_por_linha do
            for palavra in linha do
                if palavra[:repeticao] == maior
                    if !repeticoes.include?(palavra)
                    repeticoes.push(palavra)
                    end
                end
            end
        end
        for repeticao in repeticoes do
            @palvaras_maiores_frequencias.push(repeticao[:palavra]) 
        end
        @total_repeticoes = repeticoes[0][:repeticao]
    end

    def to_str
        return "Numero da linha: #{@numero_linha}\nConteudo da linha: #{@conteudo_linha}\nPalavras com maior frequencia: #{@palvaras_maiores_frequencias}\nNumero de repeticoes: #{@total_repeticoes}"
    end

end