class MessagePolicy < ApplicationPolicy
  def index?
    !!@record.conversation_user
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
