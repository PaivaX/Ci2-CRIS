require "test_helper"

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  test "should not create article" do
    article = Article.new
    assert_not article.save
  end

  test "should create, edit and delete article" do
    article = Article.new(title: "titulo", abstract: "Tem mais de 15 chars long")
    assert article.save

    assert article.update(url: "http://localhost:3000")
    assert article.destroy
  end

  test "should not create a Book" do

    article = Article.new(title: "titulo", abstract: "Tem mais de 15 chars long", type:"Book")
    assert_not article.save
  end

end
