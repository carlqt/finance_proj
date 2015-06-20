module FormsMethodController
  extend ActiveSupport::Concern

  included do
    before_action :status_count, only: :index
  end

  def status_count
    object = controller_name.classify.constantize

    @pending_count = object.status('pending').count
    @submitted_count = object.status('submitted').count
    @approved_count = object.status('approved').count
  end

end