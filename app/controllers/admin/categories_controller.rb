class Admin::CategoriesController < ApplicationController

  def index#一覧と検索結果を一体化してあります。
    @category = Category.new
    @search = Category.ransack(params[:q])#キー(:q)を使ってテーブルから情報を取得
    @results = @search.result.page(params[:page]).order(created_at: :desc)#orderで順番入れかえ
    #検索結果を取得
  end

  def create
    @category = Category.new(category_params)
    @category.save
    redirect_to admin_categories_path
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    @category.update(category_params)
    redirect_to admin_categories_path
  end

  def destroy
    Category.find(params[:id]).destroy
    redirect_to admin_categories_path
  end

  private
  def category_params
    params.require(:category).permit(:name)
  end

end
