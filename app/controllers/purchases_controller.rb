class PurchasesController < ApplicationController
    
    def create
        Purchase.create(create_purchase)
        redirect_to :root and return
    end
    
    private
    def create_purchase
        params.permit(purchased: [])
        binding.pry
    end
end
