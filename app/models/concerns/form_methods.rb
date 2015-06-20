module FormMethods
  extend ActiveSupport::Concern

  class_methods do
    def status(stat)
      return all unless stat
      where status: stat
    end
  end

end