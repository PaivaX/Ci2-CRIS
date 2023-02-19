# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
project1 = Project.create(title: "Economia Circular de Água e Materiais através de Zonas Húmidas Construídas Modulares", description: "O projeto EcoModZHC consiste numa de Prova de Conceito, em que se pretende implementar um protótipo de Zona Húmida Construída para demonstrar a efetividade de recuperação de águas residuais urbanas e industriais através de sistemas modulares, fomentar a economia circular da água e de resíduos e subprodutos sólidos industriais, e proceder à divulgação desta tecnologia mais verde e sustentável de tratamento de águas residuais no tecido industrial da Região. O protótipo a construir, instalar e operar, irá incluir duas vertentes inovadoras neste tipo de instalação de tratamento de águas residuais: (i) A monitorização remota, constante e em tempo real, do funcionamento da instalação e dos parâmetros de desempenho e de qualidade da água tratada; (ii) A autonomia energética da instalação, através de sistemas de energia renovável.", start_date: "01/07/2022", end_date: "30/07/2022", project_role: "Ongoing", url_project: "http://www.ecomodzhc.ipt.pt/")
image1 = File.open(Rails.root.join('app', 'assets', 'images', 'EcoModZHC.png'))
project1.image.attach(io: image1, filename: 'EcoModZHC.png')
project2 = Project.create(title: "Previsão e deteção da entrada de luz solar através de superfícies transparentes de edifícios", description: "Solar é um projeto que visa desenvolver um software que receba os dados necessários e produza os resultados desejados em termos de disponibilidade de luz solar no interior de edifícios. A partir de variáveis como latitude e longitude, configuração de janelas, varandas e outras superfícies de entrada de luz solar, e de um levantamento dos obstáculos circundantes, é possível prever a presença de luz solar ao longo do tempo. Pretende-se desenvolver um algoritmo de processamento de imagem que permita obter as áreas bloqueadas e desbloqueadas para cada combinação de coordenadas de azimute e elevação e produzir os dados de exposição solar desejados para novas construções ou para a análise da exposição solar de edifícios existentes. Numa fase posterior, espera-se acrescentar procedimentos de avaliação da qualidade térmica dos edifícios, com o objetivo de um uso mais eficiente de energia.", start_date: "29/05/2022", end_date: "30/07/2023", project_role: "Ongoing", url_project: "www.ipt.pt")
project3 = Project.create(title: "Modelação da síndrome de burnout multifatorial em estudantes universitários", description: "For testing Third project rails", start_date: "14/01/2023", end_date: "", project_role: "Ongoing", url_project: "www.ipt.pt")
project4 = Project.create(title: "Driver’s Behavior Cognition Based on Mobile Phone Sensors", description: "For testing Fourth project rails", start_date: "14/01/2023", end_date: "", project_role: "Ongoing", url_project: "www.ipt.pt")
researchers = Researcher.create(name: "Rui Paiva", birthday: "23/08/1988", resume: "teste", email: "rui.paiva88@gmail.com", website: "www.rpx.pt", degree: "Licence")
User.create([
    { user_type: "admin", name: "Admin", email: "admin@app.com", password: "password" },
    { user_type: "user", name: "User", email: "user@app.com", password: "password" },
    { user_type: "user", name: "Blocked User", email: "blocked@app.com", password: "password", blocked_at: DateTime.now()},
    { user_type: "superadmin", name: "Shoaib Feda", email: "almarghulani@gmail.com", password: "password" }
]);

institution = Institution.create(name: "IPT")
institution = Institution.create(name: "IPL")
institution = Institution.create(name: "IP da vida")

book1 = Article.create(
                       title: "Cozer batatas: scientific review",
                       abstract: "Uma análise científica sobre o contexto físico da cozedura de batatas",
                       edition: "First edition",
                       publisher: "Porto editora",
                       type:"Book"
                    )

book2 = Article.create(
                         title: "Teoria da humidade",
                         abstract: "O que é de facto a humidade???",
                         edition: "thirtieth edition",
                         publisher: "Vairão editora",
                         type: "Book"
                       )

journal1 = Article.create(
                             title: "News urgentes",
                             abstract: "Acontecimentos jornalísticos",
                             journal_name: "Correio da tardinha",
                             type: "Journal"
                          )
journal2 = Article.create(
                            title: "Eletro geek",
                            abstract: "All about rails geeks and their techniques",
                            journal_name: "Correio da manhã",
                            type: "Journal"
                          )

report1 = Article.create(
                           title: "Report sobre uma coisa",
                           abstract: "Super interessanteeeeeeeee",
                           type: "Report"
                    )

report2 = Article.create(title: "Sapos: report",
                         abstract: "One frog, two frogs, three fr...",
                         type: "Report"
)
thesis1 = Article.create(
                           title: "O porquê do grupo ci2-cris tirar boa nota",
                           abstract: "Tese de mestrado para obtenção do nível académico mestrado",
                           thesis_type: "Masters",
                           university:"Da vida",
                           type: "Thesis"
)

researcher1 = Researcher.create(
  name: "Abílio Constâncio"
)

researcher2 = Researcher.create(
  name: "Jaquistinácio das Dores"
)

researcher3 = Researcher.create(
  name: "Albertino Constantino"
)

researcher4 = Researcher.create(
  name: "José Pinhal"
)

thesis2 = Article.create(
  title: "Fobias: Ar e VR",
  abstract: "Mais que apps, um trabalho de uma vida",
  thesis_type: "Bachelors",
  university:"IPT",
  type: "Thesis"
)
journal1.project_ids = [project3.id]
book1.project_ids = [project2.id, project4.id]
book2.project_ids = [project4.id]
journal2.project_ids = [project3.id, project1.id]
report1.project_ids = [project1.id, project3.id, project2.id]
report2.project_ids = [project1.id, project2.id]
thesis1.project_ids = [project4.id, project3.id, project2.id, project1.id]
thesis2.project_ids = [project4.id]

journal1.researcher_ids = [researcher1.id]
book1.researcher_ids = [researcher1.id, researcher2.id]
book2.researcher_ids = [researcher3.id, researcher2.id]
journal2.researcher_ids = [researcher4.id, researcher2.id, researcher3.id]
report1.researcher_ids = [researcher2.id]
report2.researcher_ids = [researcher4.id, researcher3.id]
thesis1.researcher_ids = [researcher4.id]
thesis2.researcher_ids = [researcher4.id, researcher2.id,researcher1.id, researcher3.id]