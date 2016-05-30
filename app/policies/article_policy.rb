class ArticlePolicy < ApplicationPolicy

  class Scope < Scope
    def resolve
      if user and user.admin?
        scope.all
      else
        scope.where(published: true)
      end
    end
  end

  def update?
    user.admin?
  end
end
