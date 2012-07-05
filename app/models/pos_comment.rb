class PosComment < ActiveRecord::Base
	belongs_to :pos_boards
	belongs_to :pos_firms
	default_scope order("updated_at DESC")

end
