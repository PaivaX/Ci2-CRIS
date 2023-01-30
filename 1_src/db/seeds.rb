# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.create([
    { user_type: "admin", name: "Admin", email: "admin@app.com", password: "password" },
    { user_type: "user", name: "User", email: "user@app.com", password: "password" },
    { user_type: "user", name: "Blocked User", email: "blocked@app.com", password: "password", blocked_at: DateTime.now()},
    { user_type: "superadmin", name: "Shoaib Feda", email: "almarghulani@gmail.com", password: "password" }
]);

book = Book.create([
                     {
                       title: "Cozer batatas: scientific review",
                       abstract: "Uma análise científica sobre o contexto físico da cosedura de batatas",
                       edition: "First edition",
                       publisher: "Porto editora"
                     },
                     {
                       title: "Teoria da humidade",
                       abstract: "O que é de facto a humidade???",
                       edition: "thirtieth edition",
                       publisher: "Vairão editora"
                     }
                   ])

journal = Journal.create([
                           {
                             title: "News urgentes",
                             abstract: "Acontecimentos jornalísticos",
                             journal_name: "Correio da tardinha"
                           },
                           {
                             title: "Eletro geek",
                             abstract: "All about rails geeks and their techniques",
                             journal_name: "Correio da manhã"
                           }
                         ])

report = Report.create([
                         {
                           title: "Report sobre uma coisa",
                           abstract: "Super interessanteeeeeeeee",
                         },
                         {
                           title: "Sapos: report",
                           abstract: "One frog, two frogs, three fr...",
                         }
                       ])

thesis = Thesis.create([
                         {
                           title: "O porquê do grupo ci2-cris tirar boa nota",
                           abstract: "Tese de mestrado para obtenção do nível académico mestrado",
                           thesis_type: "Masters",
                           university:"Da vida"
                         },
                         {
                           title: "Fobias: Ar e VR",
                           abstract: "Mais que apps, um trabalho de uma vida",
                           thesis_type: "Bachelors",
                           university:"IPT"
                         }
                       ])


