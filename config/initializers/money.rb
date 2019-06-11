MoneyRails.configure do |config|
  config.default_currency = :eur

  # config.no_cents_if_whole = false

  # config.default_format = {symbol_first: false}

  # config.register_currency = {
  #   priority:            1,
  #   iso_code:            "EU4",
  #   name:                "Euro with subunit of 4 digits",
  #   symbol:              "€",
  #   symbol_first:        false,
  #   subunit:             "Subcent",
  #   subunit_to_unit:     10000,
  #   thousands_separator: ".",
  #   decimal_mark:        ","
  # }

    config.default_format = {
    no_cents_if_whole: nil,
    symbol: nil,
    sign_before_symbol: false
  }


end
