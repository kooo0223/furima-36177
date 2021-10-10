require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '出品商品の保存' do
    context '商品情報が保存できる場合' do
      it '画像・商品名・説明・カテゴリー・状態・配送料の情報・発送元の地域・発送までの日数・価格があれば保存できる' do
        expect(@item).to be_valid
      end
    end

    context '商品情報が保存でない場合' do
      it '画像が空では保存できない' do
        
      end

      it '商品名が空では保存できない' do
        
      end

      it '説明が空では保存できない' do
        
      end
      
      it 'カテゴリーが未選択(--)では保存できない' do
        
      end

      it '商品の状態が未選択(--)では保存できない' do
        
      end

      it '配送料の負担情報が未選択(--)では保存できない' do
        
      end

      it '配送元の地域が未選択(--)では保存できない' do
        
      end

      it '発送までの日数が未選択(--)では保存できない' do
        
      end

      it '価格が空では保存できない' do
        
      end

      it '価格が300円未満では保存できない' do
        
      end

      it '価格が10,000,000円以上では保存できない' do
        
      end

      it 'ユーザーが紐付いていなければ保存できない' do
        
      end
    end
  end
end
