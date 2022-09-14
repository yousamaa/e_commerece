# frozen_string_literal: true

class CommentPolicy < ApplicationPolicy
  def update?
    user.id != record.user.id
  end

  def edit?
    update?
  end

  def destroy?
    update?
  end
end
