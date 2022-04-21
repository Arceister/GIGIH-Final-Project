require 'rails_helper'

RSpec.describe MenusController do
  describe MenusController do
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
      end
    end
  end
end