# frozen_string_literal: true

class CommentPolicy < ApplicationPolicy
  class Scope < Scope
    # def resolve
    #   scope.all
    # end
  end

  def update?
    user.id != record.user.id
  end

  def edit?
    update?
  end

  def destroy?
    user.id != record.user.id
  end
end
