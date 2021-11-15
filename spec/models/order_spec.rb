require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @order = FactoryBot.build(:order, user_id: @user.id, item_id: @item.id)
    sleep 0.1
  end

  describe '購入者の住所情報の登録' do
    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できる' do
        expect(@order).to be_valid
      end

      it '建物名は空でも保存できる' do
        @order.building = ''
        expect(@order).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postal_codeが空だと保存できない' do
        @order.postal_code = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codeがハイフンを含んだ形式でないと保存できない' do
        @order.postal_code = '1234567'
        @order.valid?
        expect(@order.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end

      it 'postal_codeが半角でないと保存できない' do
        @order.postal_code = '１２３−４５６７'
        @order.valid?
        expect(@order.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end

      it 'prefecture_idを選択していないと保存できない' do
        @order.prefecture_id = 1
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'cityが空だと保存できない' do
        @order.city = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("City can't be blank")
      end

      it 'address_lineが空だと保存できない' do
        @order.address_line = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Address line can't be blank")
      end

      it 'phone_numberが空だと保存できない' do
        @order.phone_number = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberは10桁以上でなければ保存できない' do
        @order.phone_number = '123456789'
        @order.valid?
        expect(@order.errors.full_messages).to include('Phone number is too short (minimum is 10 characters)')
      end

      it 'phone_numberは11桁以内でなければ保存できない' do
        @order.phone_number = '123456789000'
        @order.valid?
        expect(@order.errors.full_messages).to include('Phone number is too long (maximum is 11 characters)')
      end

      it 'phone_numberは半角数値でなければ保存できない' do
        @order.phone_number = '０１２３４５６７８９'
        @order.valid?
        expect(@order.errors.full_messages).to include('Phone number is invalid')
      end

      it 'user_idが空では登録できない' do
        @order.user_id = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが空では登録できない' do
        @order.item_id = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Item can't be blank")
      end

      it 'tokenが空では登録できない' do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
