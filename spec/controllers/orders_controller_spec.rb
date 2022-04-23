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
    
  end
end