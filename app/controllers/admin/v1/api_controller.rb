module Admin::V1
  class ApiController < ApplicationController
    class ForbiddenAccess < StandardError; end

    include Authenticable
    include SimpleErrorRenderable
    self.simple_error_partial = "shared/simple_error"

    before_action :restrict_access_from_admin!

    # def render_error(message: nil, fields: nil, status: :unprocessable_entity)
    #   errors = {}
    #   errors['fields'] = fields if fields.present?
    #   errors['message'] = message if message.present?
    #   render json: {errors: errors}, status: status
    # end

    rescue_from ForbiddenAccess do
      render_error(message: "forbidden access", status: :forbidden)
    end

    private
    def restrict_access_from_admin!
      raise ForbiddenAccess unless current_user.admin?
    end
  end
end
