class PortfolioPolicy < ApplicationPolicy

  class Scope < Scope
    def resolve
      user&.admin? ? scope.all : scope.where(hidden: false)
    end
  end

  def create?
    user.admin?
  end

  def new?
    create?
  end

  def update?
    user.admin?
  end

  def edit?
    update?
  end

  def destroy?
    user.admin?
  end

end
