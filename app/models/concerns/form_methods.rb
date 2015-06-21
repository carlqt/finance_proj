module FormMethods
  extend ActiveSupport::Concern

  def date_created
    created_at.strftime "%b %d, %Y"
  end

  class_methods do
    def status(stat)
      return all unless stat
      where status: stat
    end
  end

end