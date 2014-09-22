class CommentPolicy < ApplicationPolicy
	
	def destroy?
		can_moderate?
	end

	def update?
		can_moderate?
	end

end