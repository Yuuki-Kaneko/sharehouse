class TopsController < ApplicationController
    def index
        # ①投稿機能
        @top = Top.new
        
        # ②食材選択リスト
        @year = Time.current.year
        @month = Time.current.month
        @day = Time.current.day
        
        @buy = Buy.new
        @tops = Top.order("created_at DESC")
        @users = User.all
        
        # ③購入リスト
        @bought = Buy.order('created_at DESC').limit(3)
        
        # ④ランキング機能
        search_date = '@year-@month-@date'  #現在の"年-月-日"を設定
        this_month = Buy.where(created_at: search_date.in_time_zone.all_month)  #今年の今月のデータを抽出
        purchase = this_month.group(:user_id).order('count_user_id DESC').limit(5).count(:user_id)
        @purchased_numbers = purchase.values
        @rankings = purchase.keys.map { |id| User.find(id) }
        
    end
    
    def create
        Top.create(create_top)
        redirect_to :root and return
    end
    
    def destroy
        delete = Top.find(params[:id])
        delete.destroy
        redirect_to :root and return
    end
    
    def edit
        @edit = Top.find(params[:id])
    end
    
    def update
        edited = Top.find(params[:id])
        edited.update(update_top)
        redirect_to :root
    end
    
    private
    def create_top
        params.require(:top).permit(:grocery, :number)
    end
    
    def update_top
        params.permit(:grocery, :number)
    end
end
