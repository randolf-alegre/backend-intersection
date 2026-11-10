module CamelCaseJson
  def self.keys(value)
    case value
    when Hash
      value.deep_transform_keys { |key| key.to_s.camelize(:lower) }
    when Array
      value.map { |item| keys(item) }
    else
      value
    end
  end
end

ActionController::Renderers.add :json do |json, options|
  json_options = options.except(:callback, :content_type, :status)
  json_options[:escape] ||= false if !self.class.escape_json_responses? && options[:callback].blank?

  unless json.is_a?(String)
    payload = CamelCaseJson.keys(json.as_json(json_options.except(:escape)))
    json = ActiveSupport::JSON.encode(payload, json_options.slice(:escape))
  end

  if options[:callback].present?
    if media_type.nil? || media_type == Mime[:json]
      self.content_type = :js
    end

    "/**/#{options[:callback]}(#{json})"
  else
    self.content_type = :json if media_type.nil?
    json
  end
end
