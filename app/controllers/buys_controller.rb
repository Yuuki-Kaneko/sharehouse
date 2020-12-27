class BuysController < ApplicationController

    def create
        #top.idを配列で補填
        @contents = create_buy
        @content = @contents.values.last(1).flatten
        @con = @content.map{ |num| num.to_i }
        
        #Buyにuser_nicknameとbought(grocery)を保存 [top.id を元に]
        @co = @con.map{ |id| Top.find(id) }
        @do = @co.pluck(:grocery)
        Buy.create(user_id: create_buy[:user_id], bought: @do)
        
        #選択したhashに対応するtop.idを削除
        @co = @con.map{ |id| Top.find(id) }
        @co.each{ |i| 
        @c = i
        @c.destroy
        }
        
        redirect_to :root and return
    end
    
    private
    def create_buy
        params.require(:buy).permit(:user_id,bought: [])
    end
end
