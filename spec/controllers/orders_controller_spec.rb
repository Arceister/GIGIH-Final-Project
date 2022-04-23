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

    it "changes @order attributes" do
      patch :update, params: {id: @order, order: attributes_for(:order, customer: @cust, quantity: 5)}
      @order.reload
      expect(@order.quantity).to eq(5)
    end

    it "redirects to orders" do
      patch :update, params: {id: @order, order: attributes_for(:order, customer: @cust)}
      expect(response).to redirect_to orders_path
    end

    it "change status to PAID" do
      patch :update, params: {id: @order, order: attributes_for(:order, customer: @cust, status: 'PAID')}
      @order.reload
      expect(@order.status).to eq('PAID')
    end
  end

  describe 'GET #show' do
    it "assigns the requested order to @order" do
      cust = Customer.create(attributes_for(:customer))
      order = create(:order, customer: cust)
      get :show, params: {id: cust}
      expect(assigns(:order)).to eq order 
    end
  end

  describe 'GET #index' do
    it "populates array of all orders" do
      cust = Customer.create(attributes_for(:customer))

      order1 = create(:order, customer: cust, quantity: 2)
      order2 = create(:order, customer: cust, quantity: 4)
      get :index

      expect(assigns(:orders)).to match_array([order1, order2])
    end
  end

  describe 'GET #report' do
    
  end
end