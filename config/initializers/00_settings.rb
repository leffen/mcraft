AppConfig = YAML.load(File.open "#{Rails.root}/config/settings.yml")[Rails.env].to_hashugar

