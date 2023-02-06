# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
project1 = Project.create(title: "First Project", description: "O projeto EcoModZHC consiste numa de Prova de Conceito, em que se pretende implementar um protótipo de Zona Húmida Construída para demonstrar a efetividade de recuperação de águas residuais urbanas e industriais através de sistemas modulares, fomentar a economia circular da água e de resíduos e subprodutos sólidos industriais, e proceder à divulgação desta tecnologia mais verde e sustentável de tratamento de águas residuais no tecido industrial da Região. O protótipo a construir, instalar e operar, irá incluir duas vertentes inovadoras neste tipo de instalação de tratamento de águas residuais: (i) A monitorização remota, constante e em tempo real, do funcionamento da instalação e dos parâmetros de desempenho e de qualidade da água tratada; (ii) A autonomia energética da instalação, através de sistemas de energia renovável.", start_date: "14/01/2023", end_date: "", project_role: "Ongoing", url_project: "www.ipt.pt")
project2 = Project.create(title: "Second Project", description: "For testing Second project rails", start_date: "14/01/2023", end_date: "", project_role: "Ongoing", url_project: "www.ipt.pt")
project3 = Project.create(title: "Third Project", description: "For testing Third project rails", start_date: "14/01/2023", end_date: "", project_role: "Ongoing", url_project: "www.ipt.pt")
project4 = Project.create(title: "Fourth Project", description: "For testing Fourth project rails", start_date: "14/01/2023", end_date: "", project_role: "Ongoing", url_project: "www.ipt.pt")
researchers = Researcher.create(name: "Rui Paiva", birthday: "23/08/1988", resume: "teste", email: "rui.paiva88@gmail.com", website: "www.rpx.pt", degree: "Licence")
User.create([
    { user_type: "admin", name: "Admin", email: "admin@app.com", password: "password" },
    { user_type: "user", name: "User", email: "user@app.com", password: "password" },
    { user_type: "user", name: "Blocked User", email: "blocked@app.com", password: "password", blocked_at: DateTime.now()},
    { user_type: "superadmin", name: "Shoaib Feda", email: "almarghulani@gmail.com", password: "password" }
]);

book1 = Article.create(
                       title: "Cozer batatas: scientific review",
                       abstract: "Uma análise científica sobre o contexto físico da cosedura de batatas",
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