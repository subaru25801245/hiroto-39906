  require 'rails_helper'

  RSpec.describe BuyRecordForm, type: :model do
    before do
      user = FactoryBot.create(:user)  
      item = FactoryBot.create(:item) 
      @buy_record_form = FactoryBot.build(:buy_record_form, user_id: user.id, item_id: item.id)  
    end

    describe '購入情報の保存' do

      context '購入情報が保存できる場合' do
        it '全ての値が正しく入力されていれば保存できること' do
          expect(@buy_record_form).to be_valid
        end

        it '建物名は空でも保存できること' do
          @buy_record_form.build_name = ''
          expect(@buy_record_form).to be_valid
        end
      end

      context '購入情報が保存できない場合' do
        it '郵便番号が空だと保存できないこと' do
          @buy_record_form.post_code = ''
          @buy_record_form.valid?
          expect(@buy_record_form.errors.full_messages).to include("Post code can't be blank")
        end
        

        it '郵便番号が半角のハイフンを含んだ正しい形式でないと保存できないこと' do
          @buy_record_form.post_code = '1234567'
          @buy_record_form.valid?
          expect(@buy_record_form.errors.full_messages).to include('Post code is invalid. Enter it as follows (e.g. 123-4567)')
        end

        it '都道府県が選択されていないと保存できないこと' do
          @buy_record_form.prefecture_id = 0
          @buy_record_form.valid?
          expect(@buy_record_form.errors.full_messages).to include("Prefecture can't be blank")
        end

        it '市区町村が空だと保存できないこと' do
          @buy_record_form.area = ''
          @buy_record_form.valid?
          expect(@buy_record_form.errors.full_messages).to include("Area can't be blank")
        end

        it '番地が空だと保存できないこと' do
          @buy_record_form.address = ''
          @buy_record_form.valid?
          expect(@buy_record_form.errors.full_messages).to include("Address can't be blank")
        end

        it '電話番号が空だと保存できないこと' do
          @buy_record_form.tel = ''
          @buy_record_form.valid?
          expect(@buy_record_form.errors.full_messages).to include("Tel can't be blank")
        end

        it '電話番号が10桁未満だと保存できないこと' do
          @buy_record_form.tel = '090123456'
          @buy_record_form.valid?
          expect(@buy_record_form.errors.full_messages).to include('Tel is too short')
        end

        it '電話番号が12桁以上だと保存できないこと' do
          @buy_record_form.tel = '090123456789'
          @buy_record_form.valid?
          expect(@buy_record_form.errors.full_messages).to include('Tel is invalid. Input only number')
        end

        it '電話番号に半角数字以外が含まれている場合は保存できないこと' do
          @buy_record_form.tel = '090-1234-5678'
          @buy_record_form.valid?
          expect(@buy_record_form.errors.full_messages).to include('Tel is invalid. Input only number')
        end

        it 'tokenが空では購入できないこと' do
          @buy_record_form.token = ''
          @buy_record_form.valid?
          expect(@buy_record_form.errors.full_messages).to include("Token can't be blank")
        end
      
        it 'userが紐付いていなければ購入できないこと' do
          @buy_record_form.user_id = nil
          @buy_record_form.valid?
          expect(@buy_record_form.errors.full_messages).to include("User can't be blank")
        end
      
        it 'itemが紐付いていなければ購入できないこと' do
          @buy_record_form.item_id = nil
          @buy_record_form.valid?
          expect(@buy_record_form.errors.full_messages).to include("Item can't be blank")
        end
      end
    end
  end
