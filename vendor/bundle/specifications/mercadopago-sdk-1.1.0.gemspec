# -*- encoding: utf-8 -*-
# stub: mercadopago-sdk 1.1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "mercadopago-sdk".freeze
  s.version = "1.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["maticompiano".freeze]
  s.date = "2020-01-21"
  s.description = "MercadoPago Ruby SDK".freeze
  s.email = ["matias.compiano@mercadolibre.com".freeze]
  s.homepage = "http://github.com/mercadopago/sdk-ruby".freeze
  s.rubygems_version = "3.0.6".freeze
  s.summary = "MercadoPago Ruby SDK".freeze

  s.installed_by_version = "3.0.6" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<json>.freeze, [">= 0"])
      s.add_development_dependency(%q<pry>.freeze, [">= 0"])
      s.add_development_dependency(%q<rake>.freeze, [">= 0"])
    else
      s.add_dependency(%q<json>.freeze, [">= 0"])
      s.add_dependency(%q<pry>.freeze, [">= 0"])
      s.add_dependency(%q<rake>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<json>.freeze, [">= 0"])
    s.add_dependency(%q<pry>.freeze, [">= 0"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
  end
end
