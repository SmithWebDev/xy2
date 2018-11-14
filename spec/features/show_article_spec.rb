require "rails_helper" 

RSpec.feature "Showing Articles" do
  before do
    john = User.create(email: "john@example.com", password: "password")
    login_as(john, scope: :user)
    @article = Article.create(title: "The First Article", body: "Lorem ipsum dolor sit amet, consectetur.", user: john)
  end

  scenario "A user shows an article" do
    visit "/"
    click_link @article.title 
    
    expect(page).to have_content(@article.title)
    expect(page).to have_content(@article.body)  
    expect(current_path).to eq(article_path(@article)) 

  end
  
end