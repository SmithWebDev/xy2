require 'rails_helper'

RSpec.feature "Adding Comments" do
  before do
    @john = User.create(email: "john@example.com", password: "password")
    @fred = User.create(email: "fred@example.com", password: "password")
    @article = Article.create!(title: "Title One", body: "Body of the article", user: @john)
  end

  describe "Post /articles/:id/comments" do
    context 'with a non signed in user' do
      before do
        post "/articles/#{@article.id}/comments", params: { comment: {body: "Awesome blog"}}
      end
     
    

      it "redirect user to the signing page" do
        flash_message = "Please sign in or sign up first"
        expect(response).to redirect_to(new_user_session_path)
        expect(response.status).to eq 302
        expect(flash[:alert]).to eq flash_message
      end
    end

    context 'with a logged in user' do
      before do
        login_as(@fred, scope: :user)
        post "/articles/#{@article.id}/comments", params: { comment: {body: "Awesome blog"}}
      end

      it 'create the comment successfully' do
        flash_message = "Comment has been created"
        expect(response).to redirect_to(article_path(@article.id))
        expect(response.status).to eq 302
        expect(flash[:notice]).to eq flash_message
      end
    end
  end
  
end