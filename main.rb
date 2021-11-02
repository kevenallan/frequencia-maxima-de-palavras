require('./AnalisadorLinha')

arq = File.new("Arquivo01.txt","r")
linhas = File.readlines(arq) 

linhas_analizadas = []

c = 1
for linha in linhas do
    analizadorLinha = AnalisadorLinha.new(c,linha)
    analizadorLinha.gerarAnalize
    linhas_analizadas.push(analizadorLinha)
    c+=1    
end

for linha_analizada in linhas_analizadas do
    puts linha_analizada.to_str
    puts ""
end
