require 'rails_helper'

RSpec.describe "Books", type: :request do

  context "GET /index without books data" do
    it 'responds with a 200 status code' do
      get '/books.json'
      expect(response).to have_http_status(200)
      parse_response = JSON.parse(response.body)
      expect(parse_response["books"]).to eq([])
    end

    it 'has no records' do
      get '/books.json'
      expect(response).to have_http_status(200)
      parse_response = JSON.parse(response.body)
      expect(parse_response["books"]).to eq([])
    end
  end

  context "GET /index with books data" do
    let!(:library) { create(:library) }
    let!(:book) { create(:book, library: library) }

    let(:book2) { create(:book, library: library) }
    let(:user) { create(:user) }
    let(:books_user) { create(:books_user, user: user, book: book2) }

    it "returns books data" do
      response_data = {"books" => [
                                    {
                                      "id" => book.id, 
                                      "name" => book.name, 
                                      "description" => book.description,
                                      "library" => {
                                                     "id" => library.id, 
                                                     "name" => library.name
                                                   },
                                      "available" => true,
                                      "checked_out_at" => nil,
                                      "users" => []
                                    }
                                  ]
                      }
      get '/books.json'
      parse_response = JSON.parse(response.body)
      expect(parse_response).to eq(response_data)
    end

    it "returns books data with available and not available & who checked-out book" do
      books_user

      response_data = {"books" => [
                                    {
                                      "id" => book.id, 
                                      "name" => book.name, 
                                      "description" => book.description,
                                      "library" => {
                                                     "id" => library.id, 
                                                     "name" => library.name
                                                   },
                                      "available" => true,
                                      "checked_out_at" => nil,
                                      "users" => []
                                    },
                                    {
                                      "id" => book2.id, 
                                      "name" => book2.name, 
                                      "description" => book2.description,
                                      "library" => {
                                                     "id" => library.id, 
                                                     "name" => library.name
                                                   },
                                      "available" => false,
                                      "checked_out_at" => books_user.allocated_at.to_s,
                                      "users" => [
                                           {
                                             "id" => user.id,
                                             "first_name" => user.first_name,
                                             "last_name"  => user.last_name,
                                             "email" => user.email
                                           }
                                      ]
                                    }
                                  ]
                      }


      get '/books.json'
      parse_response = JSON.parse(response.body)
      expect(parse_response["books"].length).to eq(2)
      expect(parse_response).to eq(response_data)
    end
  end
end
