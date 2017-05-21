defmodule Backend.Router do
  use Backend.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Backend.Plugs.AuthenticateUser
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Backend do
    pipe_through :browser # Use the default browser stack

    resources "/users", UserController

    get "/", PageController, :index
    get "/admin", PageController, :admin_index

    get "/login", AuthController, :sign_in
    post "/login", AuthController, :create
    get "/logout", AuthController, :sign_out

    get "/registration/new", UserController, :new
    post "/registration", UserController, :create

    resources "/client_requirements", ClientRequirementController
    resources "/substance_abuse_treatments", SubstanceAbuseTreatmentController
    resources "/target_demographics", TargetDemographicController
    resources "/support_groups", SupportGroupController
    resources "/outreach_programs", OutreachProgramController
    resources "/payment_methods", PaymentMethodController
    resources "/shelter_capabilities", ShelterCapabilityController
    resources "/services", ServiceController
    resources "/medical_amenities", MedicalAmenityController
    resources "/transportation_assistances", TransportationAssistanceController
    resources "/education_services", EducationServiceController
    resources "/education_supports", EducationSupportController
    resources "/prevention_services", PreventionServiceController
    resources "/legal_services", LegalServiceController
    resources "/client_referral_sources", ClientReferralSourceController

    resources "/service_providers", ServiceProviderController

  end

  scope "/api", Backend do
    pipe_through :api

    resources "/client_requirements", Api.ClientRequirementController, only: [:index, :show]
    resources "/substance_abuse_treatments", Api.SubstanceAbuseTreatmentController, only: [:index, :show]
    resources "/target_demographics", Api.TargetDemographicController, only: [:index, :show]
    resources "/support_groups", Api.SupportGroupController, only: [:index, :show]
    resources "/outreach_programs", Api.OutreachProgramController, only: [:index, :show]
    resources "/payment_methods", Api.PaymentMethodController, only: [:index, :show]
    resources "/shelter_capabilities", Api.ShelterCapabilityController, only: [:index, :show]
    resources "/services", Api.ServiceController, only: [:index, :show]
    resources "/medical_amenities", Api.MedicalAmenityController, only: [:index, :show]
    resources "/transportation_assistances", Api.TransportationAssistanceController, only: [:index, :show]
    resources "/education_services", Api.EducationServiceController, only: [:index, :show]
    resources "/education_supports", Api.EducationSupportController, only: [:index, :show]
    resources "/prevention_services", Api.PreventionServiceController, only: [:index, :show]
    resources "/legal_services", Api.LegalServiceController, only: [:index, :show]
    resources "/client_referral_sources", Api.ClientReferralSourceController, only: [:index, :show]
    resources "/service_providers", Api.ServiceProviderController, only: [:index, :show]
  end
end
