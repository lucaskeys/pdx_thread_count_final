class DesignerStore < ActiveRecord::Base
  belongs_to :store
  belongs_to :designer
end
