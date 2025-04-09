require "aws-sdk-s3"  # Add this line to load the AWS SDK

Aws.config.update(
  {
    s3: {
      endpoint: "https://#{Rails.application.credentials.dig(:cloudflare, :account_id)}.r2.cloudflarestorage.com",
      access_key_id: Rails.application.credentials.dig(:cloudflare, :access_key_id),
      secret_access_key: Rails.application.credentials.dig(:cloudflare, :secret_access_key),
      region: "auto",
      force_path_style: true,
      request_checksum_calculation: "when_required",
      response_checksum_validation: "when_required"
    }
  }
)
