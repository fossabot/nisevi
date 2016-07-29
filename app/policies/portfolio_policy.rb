class PortfolioPolicy < ApplicationPolicy

  class Scope < Scope
    def resolve
      if user and user.admin?
        scope.all
      else
        scope.where(hidden: false)
      end
    end
  end

  def create?
    user.admin?
  end

  def update?
    user.admin
  end

  def destroy?
    user.admin
  end

end
