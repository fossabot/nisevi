class ServicePolicy < ApplicationPolicy

  class Scope < Scope
    def resolve
      user&.admin? ? scope.all : scope.where(active: true)
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
