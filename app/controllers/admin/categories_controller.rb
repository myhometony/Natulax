class Admin::CategoriesController < ApplicationController

  def index#一覧と検索結果を一体化してあります。
    @category = Category.new
    @search = Category.ransack(params[:q])#キー(:q)を使ってテーブルから情報を取得
    @results = @search.result.page(params[:page]).order(created_at: :desc)#orderで順番入れかえ
    #検索結果を取得
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "カテゴリが作成されました。"
    else
      flash[:alert] = "カテゴリ名を記入してください。"
    end
    redirect_to request.referer
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      redirect_to admin_categories_path
      flash[:notice] = "カテゴリ名が更新されました。"
    else
      flash[:alert] = "カテゴリ名を記入してください。"
      redirect_to request.referer
    end
  end

  private
  def category_params
    params.require(:category).permit(:name)
  end

end
