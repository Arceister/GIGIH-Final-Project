require 'rails_helper'

RSpec.describe OrdersController do
  describe 'POST #create' do
    it "saves new order in the database" do
      cust = Customer.create(attributes_for(:customer))
      order = Order.create(attributes_for(:order, customer: cust))

      expect{post :create, params: {order: attributes_for(:order, customer: cust)}}.to change(Order, :count).by(1)
    end
  end

  describe 'PATCH #update' do
    before :each do
      @cust = Customer.create(attributes_for(:customer))
      @order = create(:order, customer: @cust)
    end

    it "locates the requested @order" do
      patch :update, params: {id: @order, order: attributes_for(:order, customer: @cust)}
      expect(assigns(:order)). to eq @order
    end
  end
end