Ssep::Application.config.to_prepare {
  Devise::SessionsController.layout "magic_admin/devise"
  Devise::RegistrationsController.layout "magic_admin/devise"
}