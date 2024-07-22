# frozen_string_literal: true

# Use this hook to configure devise mailer, warden hooks and so forth.
# Many of these configuration options can be set straight in your model.
Devise.setup do |config|
  # The secret key used by Devise. Devise uses this key to generate
  # random tokens. Changing this key will render invalid all existing
  # confirmation, reset password and unlock tokens in the database.
  # Devise will use the `secret_key_base` as its `secret_key`
  # by default. You can change it below and use your own secret key.
  # config.secret_key = 'f4b092399759aebb59aaaa4374e22b9ef450454975a0facb14c6d732d8f8f5b7907d7c4f4e2b23a99aa1171b80916cb6ae11bdd9234c32dbf835f7631c5304b4'

  # ==> Controller configuration
  # Configure the parent class to the devise controllers.
  # config.parent_controller = 'DeviseController'

  # ==> Mailer Configuration
  # Configure the e-mail address which will be shown in Devise::Mailer,
  # note that it will be overwritten if you use your own mailer class
  # with default "from" parameter.
  config.mailer_sender = 'please-change-me-at-config-initializers-devise@example.com'

  # Configure the class responsible to send e-mails.
  # config.mailer = 'Devise::Mailer'

  # Configure the parent class responsible to send e-mails.
  # config.parent_mailer = 'ActionMailer::Base'

  # ==> ORM configuration
  # Load and configure the ORM. Supports :active_record (default) and
  # :mongoid (bson_ext recommended) by default. Other ORMs may be
  # available as additional gems.
  require 'devise/orm/active_record'

  # ==> Configuration for any authentication mechanism
  # Configure which keys are used when authenticating a user. The default is
  # just :email. You can configure it to use [:username, :subdomain], so for
  # authenticating a user, both parameters are required. Remember that those
  # parameters are used only when authenticating and not when retrieving from
  # session. If you need permissions, you should implement that in a before filter.
  # You can also supply a hash where the value is a boolean determining whether
  # or not authentication should be aborted when the value is not present.
  # config.authentication_keys = [:email]

  # Configure parameters from the request object used for authentication. Each entry
  # given should be a request method and it will automatically be passed to the
  # find_for_authentication method and considered in your model lookup. For instance,
  # if you set :request_keys to [:subdomain], :subdomain will be used on authentication.
  # The same considerations mentioned for authentication_keys also apply to request_keys.
  # config.request_keys = []

  # Configure which authentication keys should be case-insensitive.
  # These keys will be downcased upon creating or modifying a user and when used
  # to authenticate or find a user. Default is :email.
  config.case_insensitive_keys = [:email]

  # Configure which authentication keys should have whitespace stripped.
  # These keys will have whitespace before and after removed upon creating or
  # modifying a user and when used to authenticate or find a user. Default is :email.
  config.strip_whitespace_keys = [:email]

  # Tell if authentication through request.params is enabled. True by default.
  # It can be set to an array that will enable params authentication only for the
  # given strategies, for example, `config.params_authenticatable = [:database]` will
  # enable it only for database (email + password) authentication.
  # config.params_authenticatable = true

  # Tell if authentication through HTTP Auth is enabled. False by default.
  # It can be set to an array that will enable http authentication only for the
  # given strategies, for example, `config.http_authenticatable = [:database]` will
  # enable it only for database authentication.
  # For API-only applications to support authentication "out-of-the-box", you will likely want to
  # enable this with :database unless you are using a custom strategy.
  # The supported strategies are:
  # :database      = Support basic authentication with authentication key + password
  # config.http_authenticatable = false

  # If 401 status code should be returned for AJAX requests. True by default.
  # config.http_authenticatable_on_xhr = true

  # The realm used in Http Basic Authentication. 'Application' by default.
  # config.http_authentication_realm = 'Application'

  # It will change confirmation, password recovery and other workflows
  # to behave the same regardless if the e-mail provided was right or wrong.
  # Does not affect registerable.
  # config.paranoid = true

  # By default Devise will store the user in session. You can skip storage for
  # particular strategies by setting this option.
  # Notice that if you are skipping storage for all authentication paths, you
  # may want to disable generating routes to Devise's sessions controller by
  # passing skip: :sessions to `devise_for` in your config/routes.rb
  config.skip_session_storage = [:http_auth]

  # By default, Devise cleans up the CSRF token on authentication to
  # avoid CSRF token fixation attacks. This means that, when using AJAX
  # requests for sign in and sign up, you need to get a new CSRF token
  # from the server. You can disable this option at your own risk.
  # config.clean_up_csrf_token_on_authentication = true

  # When false, Devise will not attempt to reload routes on eager load.
  # This can reduce the time taken to boot the app but if your application
  # requires the Devise mappings to be loaded during boot time the application
  # won't boot properly.
  # config.reload_routes = true

  # ==> Configuration for :database_authenticatable
  # For bcrypt, this is the cost for hashing the password and defaults to 12. If
  # using other algorithms, it sets how many times you want the password to be hashed.
  # The number of stretches used for generating the hashed password are stored
  # with the hashed password. This allows you to change the stretches without
  # invalidating existing passwords.
  #
  # Limiting the stretches to just one in testing will increase the performance of
  # your test suite dramatically. However, it is STRONGLY RECOMMENDED to not use
  # a value less than 10 in other environments. Note that, for bcrypt (the default
  # algorithm), the cost increases exponentially with the number of stretches (e.g.
  # a value of 20 is already extremely slow: approx. 60 seconds for 1 calculation).
  config.stretches = Rails.env.test? ? 1 : 12

  # Set up a pepper to generate the hashed password.
  # config.pepper = '7b3e73ae015358c1bcf5a705f6016d9f9a98c7573b9f02009bbd569042191d14c5a9766489f1a993073d6dce6baa0b86e250dd1f6b020af0b7138500d41b64e7'

  # Send a notification to the original email when the user's email is changed.
  # config.send_email_changed_notification = false

  # Send a notification email when the user's password is changed.
  # config.send_password_change_notification = false

  # ==> Configuration for :confirmable
  # A period that the user is allowed to access the website even without
  # confirming their account. For instance, if set to 2.days, the user will be
  # able to access the website for two days without confirming their account,
  # access will be blocked just in the third day.
  # You can also set it to nil, which will allow the user to access the website
  # without confirming their account.
  # Default is 0.days, meaning the user cannot access the website without
  # confirming their account.
  # config.allow_unconfirmed_access_for = 2.days

  # A period that the user is allowed to confirm their account before their
  # token becomes invalid. For example, if set to 3.days, the user can confirm
  # their account within 3 days after the mail was sent, but on the fourth day
  # their account can't be confirmed with the token any more.
  # Default is nil, meaning there is no restriction on how long a user can take
  # before confirming their account.
  # config.confirm_within = 3.days

  # If true, requires any email changes to be confirmed (exactly the same way as
  # initial account confirmation) to be applied. Requires additional unconfirmed_email
  # db field (see migrations). Until confirmed, new email is stored in
  # unconfirmed email column, and copied to email column on successful confirmation.
  # config.reconfirmable = true

  # Defines which key will be used when confirming an account
  # config.confirmation_keys = [:email]

  # ==> Configuration for :rememberable
  # Defines the time interval after which a user will be automatically
  # logged out if not active. When set to nil, users will never be logged out
  # automatically.
  # config.remember_for = 2.weeks

  # If true, extends the user's remember period when remembered via cookie.
  # config.extend_remember_period = false

  # ==> Configuration for :validatable
  # Range for password length.
  # config.password_length = 8..128

  # Email regex used to validate email formats. It simply asserts that
  # there is one (and only one) @ symbol in the given string.
  # config.email_regexp = /\A[^@\s]+@[^@\s]+\z/

  # ==> Configuration for :timeoutable
  # The time you want to timeout the user session without activity. After this
  # time the user will be asked for credentials again. Default is 30 minutes.
  # config.timeout_in = 30.minutes

  # If true, expires auth token on session timeout.
  # config.expire_auth_token_on_timeout = false

  # ==> Configuration for :lockable
  # Defines which strategy will be used to unlock an account.
  # :email = Sends an unlock link to the user email
  # :time  = Re-enables login after a certain amount of time (see :unlock_in below)
  # :both  = Enables both strategies
  # :none  = No unlock strategy. You should handle unlocking by yourself.
  # config.unlock_strategy = :both

  # Number of authentication tries before locking an account if lock_strategy
  # is failed attempts.
  # config.maximum_attempts = 20

  # Time interval to unlock the account if :time is enabled as unlock_strategy.
  # config.unlock_in = 1.hour

  # Warn on a login attempt if the account is already locked.
  # config.lock_warning = true

  # Defines which key will be used when locking and unlocking an account
  # config.lock_keys = [:email]

  # ==> Configuration for :recoverable
  # Defines which keys will be used when recovering the password for an account
  # config.reset_password_keys = [:email]

  # Time interval you can reset your password with a reset password key.
  # Don't put a too restrictive time frame.
  # config.reset_password_within = 6.hours


  # ==> Configuration for :encryptable
  # Invalid hash errors raised for Devise.encryptor.
  # config.encryptor = :sha512

  
  # ==> Configuration for :omniauthable
  # Add a new OmniAuth provider. Check the wiki for more information on setting
  # up on your models and hooks.
  # config.omniauth :github, 'APP_ID', 'APP_SECRET', scope: 'user,public_repo'

  # ==> JWT Configuration
  # Add this line inside the existing Devise.setup block
  config.jwt do |jwt|
    jwt.secret = Rails.application.credentials.devise[:jwt_secret_key]
    jwt.dispatch_requests = [
      ['POST', %r{^/api/v1/admin/sign_in$}]
    ]
    jwt.revocation_requests = [
      ['DELETE', %r{^/api/v1/admin/sign_out$}]
    ]
    jwt.expiration_time = 30.minutes.to_i
  end

  

  # ==> Configuration for :registerable
  # When set to false, does not allow new user registration.
  # config.registerable = true

  # ==> Configuration for :recoverable
  # When set to false, does not allow users to recover their password.
  # config.recoverable = true

  # ==> Configuration for :rememberable
  # When set to false, will not generate remembering token.
  # config.rememberable = true

  # ==> Configuration for :trackable
  # When set to false, tracks the time when user logged in and out.
  # config.trackable = true

  # ==> Configuration for :validatable
  # When set to false, validations are not applied for this devise model.
  # config.validatable = true

  # ==> Configuration for :timeoutable
  # When set to false, allows user to remain logged in indefinitely.
  # config.timeoutable = true

  # ==> Configuration for :lockable
  # When set to false, no lock strategy will be used.
  # config.lockable = true

  # ==> Configuration for :rememberable
  # When set to false, will not generate remembering token.
  # config.rememberable = true

  # ==> Configuration for :confirmable
  # When set to false, no email confirmation is required.
  # config.confirmable = true

  # ==> Configuration for :recoverable
  # When set to false, does not allow users to recover their password.
  # config.recoverable = true

  # ==> Configuration for :timeoutable
  # When set to false, allows the user to remain logged in indefinitely.
  # config.timeoutable = true

  # ==> Configuration for :lockable
  # When set to false, no lock strategy will be used.
  # config.lockable = true

  # ==> Configuration for :rememberable
  # When set to false, will not generate remembering token.
  # config.rememberable = true

  # ==> Configuration for :confirmable
  # When set to false, no email confirmation is required.
  # config.confirmable = true

  # ==> Configuration for :recoverable
  # When set to false, does not allow users to recover their password.
  # config.recoverable = true

  # ==> Configuration for :timeoutable
  # When set to false, allows the user to remain logged in indefinitely.
  # config.timeoutable = true

  # ==> Configuration for :lockable
  # When set to false, no lock strategy will be used.
  # config.lockable = true

  # ==> Configuration for :rememberable
  # When set to false, will not generate remembering token.
  # config.rememberable = true

  # ==> Configuration for :confirmable
  # When set to false, no email confirmation is required.
  # config.confirmable = true

  # ==> Configuration for :recoverable
  # When set to false, does not allow users to recover their password.
  # config.recoverable = true

  # ==> Configuration for :timeoutable
  # When set to false, allows the user to remain logged in indefinitely.
  # config.timeoutable = true

  # ==> Configuration for :lockable
  # When set to false, no lock strategy will be used.
  # config.lockable = true

  # ==> Configuration for :rememberable
  # When set to false, will not generate remembering token.
  # config.rememberable = true

  # ==> Configuration for :confirmable
  # When set to false, no email confirmation is required.
  # config.confirmable = true

  # ==> Configuration for :recoverable
  # When set to false, does not allow users to recover their password.
  # config.recoverable = true

  # ==> Configuration for :timeoutable
  # When set to false, allows the user to remain logged in indefinitely.
  # config.timeoutable = true

  # ==> Configuration for :lockable
  # When set to false, no lock strategy will be used.
  # config.lockable = true

  # ==> Configuration for :rememberable
  # When set to false, will not generate remembering token.
  # config.rememberable = true

  # ==> Configuration for :confirmable
  # When set to false, no email confirmation is required.
  # config.confirmable = true

  # ==> Configuration for :recoverable
  # When set to false, does not allow users to recover their password.
  # config.recoverable = true

  # ==> Configuration for :timeoutable
  # When set to false, allows the user to remain logged in indefinitely.
  # config.timeoutable = true

  # ==> Configuration for :lockable
  # When set to false, no lock strategy will be used.
  # config.lockable = true

  # ==> Configuration for :rememberable
  # When set to false, will not generate remembering token.
  # config.rememberable = true

  # ==> Configuration for :confirmable
  # When set to false, no email confirmation is required.
  # config.confirmable = true

  # ==> Configuration for :recoverable
  # When set to false, does not allow users to recover their password.
  # config.recoverable = true

  # ==> Configuration for :timeoutable
  # When set to false, allows the user to remain logged in indefinitely.
  # config.timeoutable = true

  # ==> Configuration for :lockable
  # When set to false, no lock strategy will be used.
  # config.lockable = true

  # ==> Configuration for :rememberable
  # When set to false, will not generate remembering token.
  # config.rememberable = true

  # ==> Configuration for :confirmable
  # When set to false, no email confirmation is required.
  # config.confirmable = true

  # ==> Configuration for :recoverable
  # When set to false, does not allow users to recover their password.
  # config.recoverable = true

  # ==> Configuration for :timeoutable
  # When set to false, allows the user to remain logged in indefinitely.
  # config.timeoutable = true

  # ==> Configuration for :lockable
  # When set to false, no lock strategy will be used.
  # config.lockable = true

  # ==> Configuration for :rememberable
  # When set to false, will not generate remembering token.
  # config.rememberable = true

  # ==> Configuration for :confirmable
  # When set to false, no email confirmation is required.
  # config.confirmable = true

  # ==> Configuration for :recoverable
  # When set to false, does not allow users to recover their password.
  # config.recoverable = true

  # ==> Configuration for :timeoutable
  # When set to false, allows the user to remain logged in indefinitely.
  # config.timeoutable = true

  # ==> Configuration for :lockable
  # When set to false, no lock strategy will be used.
  # config.lockable = true

  # ==> Configuration for :rememberable
  # When set to false, will not generate remembering token.
  # config.rememberable = true

  # ==> Configuration for :confirmable
  # When set to false, no email confirmation is required.
  # config.confirmable = true

  # ==> Configuration for :recoverable
  # When set to false, does not allow users to recover their password.
  # config.recoverable = true

  # ==> Configuration for :timeoutable
  # When set to false, allows the user to remain logged in indefinitely.
  # config.timeoutable = true

  # ==> Configuration for :lockable
  # When set to false, no lock strategy will be used.
  # config.lockable = true

  # ==> Configuration for :rememberable
  # When set to false, will not generate remembering token.
  # config.rememberable = true

  # ==> Configuration for :confirmable
  # When set to false, no email confirmation is required.
  # config.confirmable = true

  # ==> Configuration for :recoverable
  # When set to false, does not allow users to recover their password.
  # config.recoverable = true

  # ==> Configuration for :timeoutable
  # When set to false, allows the user to remain logged in indefinitely.
  # config.timeoutable = true

  # ==> Configuration for :lockable
  # When set to false, no lock strategy will be used.
  # config.lockable = true

  # ==> Configuration for :rememberable
  # When set to false, will not generate remembering token.
  # config.rememberable = true

  # ==> Configuration for :confirmable
  # When set to false, no email confirmation is required.
  # config.confirmable = true

  # ==> Configuration for :recoverable
  # When set to false, does not allow users to recover their password.
  # config.recoverable = true

  # ==> Configuration for :timeoutable
  # When set to false, allows the user to remain logged in indefinitely.
  # config.timeoutable = true

  # ==> Configuration for :lockable
  # When set to false, no lock strategy will be used.
  # config.lockable = true

  # ==> Configuration for :rememberable
  # When set to false, will not generate remembering token.
  # config.rememberable = true

  # ==> Configuration for :confirmable
  # When set to false, no email confirmation is required.
  # config.confirmable = true

  # ==> Configuration for :recoverable
  # When set to false, does not allow users to recover their password.
  # config.recoverable = true

  # ==> Configuration for :timeoutable
  # When set to false, allows the user to remain logged in indefinitely.
  # config.timeoutable = true

  # ==> Configuration for :lockable
  # When set to false, no lock strategy will be used.
  # config.lockable = true

  # ==> Configuration for :rememberable
  # When set to false, will not generate remembering token.
  # config.rememberable = true

  # ==> Configuration for :confirmable
  # When set to false, no email confirmation is required.
  # config.confirmable = true

  # ==> Configuration for :recoverable
  # When set to false, does not allow users to recover their password.
  # config.recoverable = true

  # ==> Configuration for :timeoutable
  # When set to false, allows the user to remain logged in indefinitely.
  # config.timeoutable = true

  # ==> Configuration for :lockable
  # When set to false, no lock strategy will be used.
  # config.lockable = true

  # ==> Configuration for :rememberable
  # When set to false, will not generate remembering token.
  # config.rememberable = true

  # ==> Configuration for :confirmable
  # When set to false, no email confirmation is required.
  # config.confirmable = true

  # ==> Configuration for :recoverable
  # When set to false, does not allow users to recover their password.
  # config.recoverable = true

  # ==> Configuration for :timeoutable
  # When set to false, allows the user to remain logged in indefinitely.
  # config.timeoutable = true

  # ==> Configuration for :lockable
  # When set to false, no lock strategy will be used.
  # config.lockable = true

  # ==> Configuration for :rememberable
  # When set to false, will not generate remembering token.
  # config.rememberable = true

  # ==> Configuration for :confirmable
  # When set to false, no email confirmation is required.
  # config.confirmable = true

  # ==> Configuration for :recoverable
  # When set to false, does not allow users to recover their password.
  # config.recoverable = true

  # ==> Configuration for :timeoutable
  # When set to false, allows the user to remain logged in indefinitely.
  # config.timeoutable = true

  # ==> Configuration for :lockable
  # When set to false, no lock strategy will be used.
  # config.lockable = true

  # ==> Configuration for :rememberable
  # When set to false, will not generate remembering token.
  # config.rememberable = true

  # ==> Configuration for :confirmable
  # When set to false, no email confirmation is required.
  # config.confirmable = true

  # ==> Configuration for :recoverable
  # When set to false, does not allow users to recover their password.
  # config.recoverable = true

  # ==> Configuration for :timeoutable
  # When set to false, allows the user to remain logged in indefinitely.
  # config.timeoutable = true

  # ==> Configuration for :lockable
  # When set to false, no lock strategy will be used.
  # config.lockable = true

  # ==> Configuration for :rememberable
  # When set to false, will not generate remembering token.
  # config.rememberable = true

  # ==> Configuration for :confirmable
  # When set to false, no email confirmation is required.
  # config.confirmable = true

  # ==> Configuration for :recoverable
  # When set to false, does not allow users to recover their password.
  # config.recoverable = true

  # ==> Configuration for :timeoutable
  # When set to false, allows the user to remain logged in indefinitely.
  # config.timeoutable = true

  # ==> Configuration for :lockable
  # When set to false, no lock strategy will be used.
  # config.lockable = true

  # ==> Configuration for :rememberable
  # When set to false, will not generate remembering token.
  # config.rememberable = true

  # ==> Configuration for :confirmable
  # When set to false, no email confirmation is required.
  # config.confirmable = true

  # ==> Configuration for :recoverable
  # When set to false, does not allow users to recover their password.
  # config.recoverable = true

  # ==> Configuration for :timeoutable
  # When set to false, allows the user to remain logged in indefinitely.
  # config.timeoutable = true

  # ==> Configuration for :lockable
  # When set to false, no lock strategy will be used.
  # config.lockable = true

  # ==> Configuration for :rememberable
  # When set to false, will not generate remembering token.
  # config.rememberable = true

  # ==> Configuration for :confirmable
  # When set to false, no email confirmation is required.
  # config.confirmable = true

  # ==> Configuration for :recoverable
  # When set to false, does not allow users to recover their password.
  # config.recoverable = true

  # ==> Configuration for :timeoutable
  # When set to false, allows the user to remain logged in indefinitely.
  # config.timeoutable = true

  # ==> Configuration for :lockable
  # When set to false, no lock strategy will be used.
  # config.lockable = true

  # ==> Configuration for :rememberable
  # When set to false, will not generate remembering token.
  # config.rememberable = true

  # ==> Configuration for :confirmable
  # When set to false, no email confirmation is required.
  # config.confirmable = true

  # ==> Configuration for :recoverable
  # When set to false, does not allow users to recover their password.
  # config.recoverable = true

  # ==> Configuration for :timeoutable
  # When set to false, allows the user to remain logged in indefinitely.
  # config.timeoutable = true

  # ==> Configuration for :lockable
  # When set to false, no lock strategy will be used.
  # config.lockable = true

  # ==> Configuration for :rememberable
  # When set to false, will not generate remembering token.
  # config.rememberable = true

  # ==> Configuration for :confirmable
  # When set to false, no email confirmation is required.
  # config.confirmable = true

  # ==> Configuration for :recoverable
  # When set to false, does not allow users to recover their password.
  # config.recoverable = true

  # ==> Configuration for :timeoutable
  # When set to false, allows the user to remain logged in indefinitely.
  # config.timeoutable = true

  # ==> Configuration for :lockable
  # When set to false, no lock strategy will be used.
  # config.lockable = true

  # ==> Configuration for :rememberable
  # When set to false, will not generate remembering token.
  # config.rememberable = true

  # ==> Configuration for :confirmable
  # When set to false, no email confirmation is required.
  # config.confirmable = true

  # ==> Configuration for :recoverable
  # When set to false, does not allow users to recover their password.
  # config.recoverable = true

  # ==> Configuration for :timeoutable
  # When set to false, allows the user to remain logged in indefinitely.
  # config.timeoutable = true

  # ==> Configuration for :lockable
  # When set to false, no lock strategy will be used.
  # config.lockable = true

  # ==> Configuration for :rememberable
  # When set to false, will not generate remembering token.
  # config.rememberable = true

  # ==> Configuration for :confirmable
  # When set to false, no email confirmation is required.
  # config.confirmable = true

  # ==> Configuration for :recoverable
  # When set to false, does not allow users to recover their password.
  # config.recoverable = true

  # ==> Configuration for :timeoutable
  # When set to false, allows the user to remain logged in indefinitely.
  # config.timeoutable = true

  # ==> Configuration for :lockable
  # When set to false, no lock strategy will be used.
  # config.lockable = true

  # ==> Configuration for :rememberable
  # When set to false, will not generate remembering token.
  # config.rememberable = true

  # ==> Configuration for :confirmable
  # When set to false, no email confirmation is required.
  # config.confirmable = true

  # ==> Configuration for :recoverable
  # When set to false, does not allow users to recover their password.
  # config.recoverable = true

  # ==> Configuration for :timeoutable
  # When set to false, allows the user to remain logged in indefinitely.
  # config.timeoutable = true

  # ==> Configuration for :lockable
  # When set to false, no lock strategy will be used.
  # config.lockable = true

  # ==> Configuration for :rememberable
  # When set to false, will not generate remembering token.
  # config.rememberable = true

  # ==> Configuration for :confirmable
  # When set to false, no email confirmation is required.
  # config.confirmable = true

  # ==> Configuration for :recoverable
  # When set to false, does not allow users to recover their password.
  # config.recoverable = true

  # ==> Configuration for :timeoutable
  # When set to false, allows the user to remain logged in indefinitely.
  # config.timeoutable = true

  # ==> Configuration for :lockable
  # When set to false, no lock strategy will be used.
  # config.lockable = true

  # ==> Configuration for :rememberable
  # When set to false, will not generate remembering token.
  # config.rememberable = true

  # ==> Configuration for :confirmable
  # When set to false, no email confirmation is required.
  # config.confirmable = true

  # ==> Configuration for :recoverable
  # When set to false, does not allow users to recover their password.
  # config.recoverable = true

  # ==> Configuration for :timeoutable
  # When set to false, allows the user to remain logged in indefinitely.
  # config.timeoutable = true

  # ==> Configuration for :lockable
  # When set to false, no lock strategy will be used.
  # config.lockable = true

  # ==> Configuration for :rememberable
  # When set to false, will not generate remembering token.
  # config.rememberable = true

  # ==> Configuration for :confirmable
  # When set to false, no email confirmation is required.
  # config.confirmable = true

  # ==> Configuration for :recoverable
  # When set to false, does not allow users to recover their password.
  # config.recoverable = true

  # ==> Configuration for :timeoutable
  # When set to false, allows the user to remain logged in indefinitely.
  # config.timeoutable = true

  # ==> Configuration for :lockable
  # When set to false, no lock strategy will be used.
  # config.lockable = true

  # ==> Configuration for :rememberable
  # When set to false, will not generate remembering token.
  # config.rememberable = true

  # ==> Configuration for :confirmable
  # When set to false, no email confirmation is required.
  # config.confirmable = true

  # ==> Configuration for :recoverable
  # When set to false, does not allow users to recover their password.
  # config.recoverable = true

  # ==> Configuration for :timeoutable
  # When set to false, allows the user to remain logged in indefinitely.
  # config.timeoutable = true

  # ==> Configuration for :lockable
  # When set to false, no lock strategy will be used.
  # config.lockable = true

  # ==> Configuration for :rememberable
  # When set to false, will not generate remembering token.
  # config.rememberable = true

  # ==> Configuration for :confirmable
  # When set to false, no email confirmation is required.
  # config.confirmable = true

  # ==> Configuration for :recoverable
  # When set to false, does not allow users to recover their password.
  # config.recoverable = true

  # ==> Configuration for :timeoutable
  # When set to false, allows the user to remain logged in indefinitely.
  # config.timeoutable = true

  # ==> Configuration for :lockable
  # When set to false, no lock strategy will be used.
  # config.lockable = true

  # ==> Configuration for :rememberable
  # When set to false, will not generate remembering token.
  # config.rememberable = true

  # ==> Configuration for :confirmable
  # When set to false, no email confirmation is required.
  # config.confirmable = true

  # ==> Configuration for :recoverable
  # When set to false, does not allow users to recover their password.
  # config.recoverable = true

  # ==> Configuration for :timeoutable
  # When set to false, allows the user to remain logged in indefinitely.
  # config.timeoutable = true

  # ==> Configuration for :lockable
  # When set to false, no lock strategy will be used.
  # config.lockable = true

  # ==> Configuration for :rememberable
  # When set to false, will not generate remembering token.
  # config.rememberable = true

  # ==> Configuration for :confirmable
  # When set to false, no email confirmation is required.
  # config.confirmable = true

  # ==> Configuration for :recoverable
  # When set to false, does not allow users to recover their password.
  # config.recoverable = true

  # ==> Configuration for :timeoutable
  # When set to false, allows the user to remain logged in indefinitely.
  # config.timeoutable = true

  # ==> Configuration for :lockable
  # When set to false, no lock strategy will be used.
  # config.lockable = true

  # ==> Configuration for :rememberable
  # When set to false, will not generate remembering token.
  # config.rememberable = true

  # ==> Configuration for :confirmable
  # When set to false, no email confirmation is required.
  # config.confirmable = true

  # ==> Configuration for :recoverable
  # When set to false, does not allow users to recover their password.
  # config.recoverable = true

  # ==> Configuration for :timeoutable
  # When set to false, allows the user to remain logged in indefinitely.
  # config.timeoutable = true

  # ==> Configuration for :lockable
  # When set to false, no lock strategy will be used.
  # config.lockable = true

  # ==> Configuration for :rememberable
  # When set to false, will not generate remembering token.
  # config.rememberable = true

  # ==> Configuration for :confirmable
  # When set to false, no email confirmation is required.
  # config.confirmable = true

  # ==> Configuration for :recoverable
  # When set to false, does not allow users to recover their password.
  # config.recoverable = true

  # ==> Configuration for :timeoutable
  # When set to false, allows the user to remain logged in indefinitely.
  # config.timeoutable = true

  # ==> Configuration for :lockable
  # When set to false, no lock strategy will be used.
  # config.lockable = true

  # ==> Configuration for :rememberable
  # When set to false, will not generate remembering token.
  # config.rememberable = true

  # ==> Configuration for :confirmable
  # When set to false, no email confirmation is required.
  # config.confirmable = true

  # ==> Configuration for :recoverable
  # When set to false, does not allow users to recover their password.
  # config.recoverable = true

  # ==> Configuration for :timeoutable
  # When set to false, allows the user to remain logged in indefinitely.
  # config.timeoutable = true

  # ==> Configuration for :lockable
  # When set to false, no lock strategy will be used.
  # config.lockable = true

  # ==> Configuration for :rememberable
  # When set to false, will not generate remembering token.
  # config.rememberable = true

  # ==> Configuration for :confirmable
  # When set to false, no email confirmation is required.
  # config.confirmable = true

  # ==> Configuration for :recoverable
  # When set to false, does not allow users to recover their password.
  # config.recoverable = true

  # ==> Configuration for :timeoutable
  # When set to false, allows the user to remain logged in indefinitely.
  # config.timeoutable = true

  # ==> Configuration for :lockable
  # When set to false, no lock strategy will be used.
  # config.lockable = true

  # ==> Configuration for :rememberable
  # When set to false, will not generate remembering token.
  # config.rememberable = true

  # ==> Configuration for :confirmable
  # When set to false, no email confirmation is required.
  # config.confirmable = true

  # ==> Configuration for :recoverable
  # When set to false, does not allow users to recover their password.
  # config.recoverable = true

  # ==> Configuration for :timeoutable
  # When set to false, allows the user to remain logged in indefinitely.
  # config.timeoutable = true

  # ==> Configuration for :lockable
  # When set to false, no lock strategy will be used.
  # config.lockable = true

  # ==> Configuration for :rememberable
  # When set to false, will not generate remembering token.
  # config.rememberable = true

  # ==> Configuration for :confirmable
  # When set to false, no email confirmation is required.
  # config.confirmable = true

  # ==> Configuration for :recoverable
  # When set to false, does not allow users to recover their password.
  # config.recoverable = true

  # ==> Configuration for :timeoutable
  # When set to false, allows the user to remain logged in indefinitely.
  # config.timeoutable = true

  # ==> Configuration for :lockable
  # When set to false, no lock strategy will be used.
  # config.lockable = true

  # ==> Configuration for :rememberable
  # When set to false, will not generate remembering token.
  # config.rememberable = true

  # ==> Configuration for :confirmable
  # When set to false, no email confirmation is required.
  # config.confirmable = true

  # ==> Configuration for :recoverable
  # When set to false, does not allow users to recover their password.
  # config.recoverable = true

  # ==> Configuration for :timeoutable
  # When set to false, allows the user to remain logged in indefinitely.
  # config.timeoutable = true

  # ==> Configuration for :lockable
  # When set to false, no lock strategy will be used.
  # config.lockable = true

  # ==> Configuration for :rememberable
  # When set to false, will not generate remembering token.
  # config.rememberable = true

  # ==> Configuration for :confirmable
  # When set to false, no email confirmation is required.
  # config.confirmable = true

  # ==> Configuration for :recoverable
  # When set to false, does not allow users to recover their password.
  # config.recoverable = true

  # ==> Configuration for :timeoutable
  # When set to false, allows the user to remain

end 