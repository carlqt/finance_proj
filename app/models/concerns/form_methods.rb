module FormMethods
  extend ActiveSupport::Concern

  def date_created
    created_at.strftime "%b %d, %Y"
  end

  def next_transition
    case
    when can_submit?
      "Submit"
    when can_approve?
      "Approve"
    else
      ""
    end
  end

  class_methods do
    def status(stat)
      return all unless stat
      where status: stat
    end
  end

end