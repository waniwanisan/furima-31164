require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context "商品が出品できる時" do
      it "全てのデータが存在すれば出品できる" do
        expect(@item).to be_valid
      end
    end
    context "商品が出品できない時" do
      it "商品名がないと出品できない" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end     
      it "商品説明がないと出品できない" do
        @item.description = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end     
      it "カテゴリーがないと出品できない" do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 0")
      end
      it "状態がないと出品できない" do
        @item.condition_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 0")
      end
      it "負担先がないと出品できない" do
        @item.postage_payer_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage payer must be other than 0")
      end
      it "都道府県がないと出品できない" do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 0")
      end
      it "配送日数がないと出品できない" do
        @item.handling_time_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Handling time must be other than 0")
      end
      it "値段がないと出品できない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "値段が全角数字だと出品できない" do
        @item.price = "１１１１"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Half-width number")
      end
      it "値段が299円以下だと出品できない" do
        @item.price = 200
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range") 
      end

      it "値段が10000000円以上だと出品できない" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range") 
      end

    end
  end
end
