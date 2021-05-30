require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  context '内容に問題ない場合' do
    it "問題ナシパターン" do
      expect(@item).to be_valid
    end
  end


  context '内容に問題がある場合' do


    describe "新規出品" do
      it "商品名必須" do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it "商品説明必須" do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it "カテゴリー必須" do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category is not a number")
      end

      it "カテゴリー「1」NG" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end

      it "商品状態必須" do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition is not a number")
      end

      it "商品状態「1」NG" do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 1")
      end

      it "配送料負担必須" do
        @item.postage_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage is not a number")
      end

      it "配送料負担「1」NG" do
        @item.postage_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage must be other than 1")
      end

      it "配送元地域必須" do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture is not a number")
      end

      it "配送元地域「1」NG" do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
      end

      it "発送までの日数必須" do
        @item.period_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Period is not a number")
      end

      it "発送までの日数「1」NG" do
        @item.period_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Period must be other than 1")
      end

      it "販売価格必須" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it "販売価格 300円円以下NG" do
        @item.price = '100'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end

      it "販売価格 10,000,000円以上NG" do
        @item.price = '10000001'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end

      it "販売価格 全角数字NG" do
        @item.price = '２２２２'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it "販売価格 半角英数字混合NG" do
        @item.price = '23a21'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it "販売価格 半角英字NG" do
        @item.price = 'esaewa'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it "販売価格 全角カナNG" do
        @item.price = 'あああああ'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it "販売価格 半角カナNG" do
        @item.price = 'ｱｱｱｱｱ'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

    end

  end
end