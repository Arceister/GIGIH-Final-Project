require 'rails_helper'

RSpec.describe MenusController do
  describe MenusController do
    describe 'GET #show' do
      
    end
    
    describe 'PATCH #update' do
      before :each do
        @menu = create(:menu)
      end

      context "with valid attributes" do
        it "locates the requested @menu" do
          patch :update, params: {id: @menu, menu: attributes_for(:menu)}
          expect(assigns(:menu)).to eq @menu
        end

        it "changes @menu's attributes" do
          patch :update, params: {id: @menu, menu: attributes_for(:menu, name: 'Nasi Pecel')}
          @menu.reload
          expect(@menu.name).to eq('Nasi Pecel')
        end

        it "redirects to the menu" do
          patch :update, params: {id: @menu, menu: attributes_for(:menu)}
          expect(response).to redirect_to menus_path(@menu)
        end
      end

      context "with invalid attributes" do
        it "does not save the updated menu in the database" do
          patch :update, params: {id: @menu, menu: attributes_for(:menu, name: 'Nasi Jagung', price: 'Test')}
          expect(@menu.name).not_to eq('Nasi Jagung')
        end

        it "re-renders edit template" do
          patch :update, params: {id: @menu, menu: attributes_for(:menu, name: 'Nasi Jagung', price: 'Test')}
          expect(assigns(:menu)).to eq @menu
          expect(response).to have_http_status(302)
        end
      end
    end
  end
end