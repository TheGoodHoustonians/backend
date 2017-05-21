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

    # here we go
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
  end

  scope "/api", Backend do
    pipe_through :api
  end
end
