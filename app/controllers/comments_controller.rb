class CommentsController < ApplicationController
  before_action :require_login, only: [:create, :destroy]

  # Ação para exibir um comentário específico
  def show
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
  end  

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to @article, notice: 'Comentário adicionado com sucesso.'
    else
      render 'articles/show', alert: 'Erro ao adicionar comentário.'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @article = @comment.article

    if @comment.user == current_user || @article.user == current_user
      @comment.destroy
      redirect_to article_path(@article), notice: 'Comentário removido com sucesso.'
    else
      redirect_to article_path(@article), alert: 'Você não tem permissão para excluir este comentário.'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end


